/*
 *  TU Eindhoven
 *  Eindhoven, The Netherlands
 *
 *  Name            :   faceDetection.cpp
 *
 *  Author          :   Francesco Comaschi (f.comaschi@tue.nl)
 *
 *  Date            :   November 12, 2012
 *
 *  Function        :   Main function for face detection
 *
 *  History         :
 *      12-11-12    :   Initial version.
 *
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program;  If not, see <http://www.gnu.org/licenses/>
 *
 * In other words, you are welcome to use, share and improve this program.
 * You are forbidden to forbid anyone else to use, share and improve
 * what you give them.   Happy coding!
 */

 //CELL THAT WE ARE GOING TO RUN THE APPLICATION AT
#include <pearl_system.h> 
#define CELL pearl 
#include <hrt/embed.h>

#include <stdio.h>
#include <stdlib.h>
#include <include/image.h>
#include <include/haar.hive.h>

#define INPUT_FILENAME "../data/Face.pgm"
#define OUTPUT_FILENAME "../data/Output.pgm"
#define TEXTCLASSIFIER_FILENAME1 "../data/info.txt"
#define TEXTCLASSIFIER_FILENAME2 "../data/class.txt"

#ifdef C_RUN
#include "../include/haar.hive.h"
#else
#include "haar.map.h"
#ifndef HRT_CRUN_LS
#include "haar.stubs.h"
#endif
#endif

void drawRectangle(MyImage* image, struct MyRect *r)
{
    int i;
    int col = image->width;

    for (i = 0; i < r->width; i++)
    {
      image->data[col*r->y + r->x + i] = 255;
    }
    for (i = 0; i < r->height; i++)
    {
        image->data[col*(r->y+i) + r->x + r->width] = 255;
    }
    for (i = 0; i < r->width; i++)
    {
        image->data[col*(r->y + r->height) + r->x + r->width - i] = 255;
    }
    for (i = 0; i < r->height; i++)
    {
        image->data[col*(r->y + r->height - i) + r->x] = 255;
    }

}

void readTextClassifier(myCascade * cascade)
{
    int stages;                                /*number of stages of the cascade classifier*/
    int total_nodes = 0;                            /*total number of weak classifiers (one node each)*/
    int i, j, k, l;
    char mystring [12];
    int r_index = 0;
    int w_index = 0;
    int tree_index = 0;
    FILE *finfo = fopen(TEXTCLASSIFIER_FILENAME1, "r");
    if ( fgets (mystring , 12 , finfo) != NULL )
    {
        stages = atoi(mystring);
    }
    i = 0;
    cascade->stages_array = (int *)malloc(sizeof(int)*stages);
    while ( fgets (mystring , 12 , finfo) != NULL )
    {
        cascade->stages_array[i] = atoi(mystring);
        total_nodes += cascade->stages_array[i];
        i++;

    }
    fclose(finfo);
    //TODO: use matrices where appropriate
    cascade->rectangles_array = (int *)malloc(sizeof(int)*total_nodes*12);
    cascade->scaled_rectangles_array = (int **)malloc(sizeof(int*)*total_nodes*12);
    cascade->weights_array = (int *)malloc(sizeof(int)*total_nodes*3);//[total_nodes*3];
    cascade->alpha1_array = (int*)malloc(sizeof(int)*total_nodes);
    cascade->alpha2_array = (int*)malloc(sizeof(int)*total_nodes);
    cascade->tree_thresh_array = (int*)malloc(sizeof(int)*total_nodes);
    cascade->stages_thresh_array = (int*)malloc(sizeof(int)*stages);
    FILE *fp = fopen(TEXTCLASSIFIER_FILENAME2, "r");

    // loop over n of stages
    for (i = 0; i < stages; i++)
    {    //loop over n of trees
        for (j = 0; j < cascade->stages_array[i]; j++)
        {    //loop over n of rectangular features
            for(k = 0; k < 3; k++)
            {    //loop over the n of vertices
                for (l = 0; l <4; l++)
                {
                    if (fgets (mystring , 12 , fp) != NULL)
                        cascade->rectangles_array[r_index] = atoi(mystring);
                    else
                    r_index++;
                }
                if (fgets (mystring , 12 , fp) != NULL)
                {
                    cascade->weights_array[w_index] = atoi(mystring);
                    //Shift value to avoid overflow in the haar evaluation
                    //TODO: make more general
//                    weights_array[w_index]>>=8;
                }
                else
                    break;
                w_index++;
            }
            if (fgets (mystring , 12 , fp) != NULL)
                cascade->tree_thresh_array[tree_index]= atoi(mystring);
            else
                break;
            if (fgets (mystring , 12 , fp) != NULL)
                cascade->alpha1_array[tree_index]= atoi(mystring);
            else
                break;
            if (fgets (mystring , 12 , fp) != NULL)
                cascade->alpha2_array[tree_index]= atoi(mystring);
            else
                break;
            tree_index++;
            if (j == cascade->stages_array[i]-1)
            {
                if (fgets (mystring , 12 , fp) != NULL)
                    cascade->stages_thresh_array[i] = atoi(mystring);
                else
                    break;
            }
        }
    }
    fclose(fp);
}

void releaseTextClassifier(myCascade * cascade)
{
    free(cascade->stages_array);
    free(cascade->rectangles_array);
    free(cascade->scaled_rectangles_array);
    free(cascade->weights_array);
    free(cascade->tree_thresh_array);
    free(cascade->alpha1_array);
    free(cascade->alpha2_array);
    free(cascade->stages_thresh_array);
}

int hrt_main (int argc, char **argv) 
{
    int flag;

    int i;

    // detection parameters
    float scaleFactor = 1.2;
    int minNeighbours = 3;
    int size;

    printf("-- entering main function --\r\n");

    printf("-- loading image --\r\n");

    MyImage imageObj;
    MyImage *image = &imageObj;

    flag = readPgm((char *)INPUT_FILENAME, image);
    if (flag == -1)
    {
        printf( "Unable to open input image\n");
        return 1;
    }

    printf("-- loading cascade classifier --\r\n");

    myCascade cascadeObj;
    myCascade *cascade = &cascadeObj;
    MySize minSize = {20, 20};
    MySize maxSize = {0, 0};

    // classifier properties
    cascade->n_stages=25;
    cascade->total_nodes=2913;
    cascade->orig_window_size.height = 24;
    cascade->orig_window_size.width = 24;

    readTextClassifier(cascade);

    struct MyRect *result[NUM] = {};

    //Load the program 
    hrt_cell_load_program_id(CELL, haar);

    hrt_scalar_store(CELL, MyImage, myimage, image);
    hrt_indexed_store(CELL, MySize, mysize, 0, minSize);
    hrt_indexed_store(CELL, MySize, mysize, 1, maxSize);
    hrt_scalar_store(CELL, myCascade, mycascade, cascade);
    hrt_scalar_store(CELL, float, scalefactor, scaleFactor);
    hrt_scalar_store(CELL, int, minneighbours, minNeighbours); 
    hrt_scalar_store(CELL, MyRect, myrect, result); 

    printf("-- detecting faces --\r\n");
    
    //size = detectObjects(image, minSize, maxSize, cascade, scaleFactor, minNeighbours, result);
    detectObjects();
    size = hrt_scalar_load(CELL, int, size);


    printf("-- drawing boxes --\r\n");
    for(i = 0; i < NUM; i++ )
    {
        if ( result[i] != NULL) {
            struct MyRect *r = result[i];
            drawRectangle(image, r);
        }
        else
            break;
    }

    printf("-- saving output --\r\n");
    flag = writePgm((char *)OUTPUT_FILENAME, image);

    printf("-- image saved --\r\n");

    //    delete image and free classifier
    releaseTextClassifier(cascade);
    freeImage(image);

    

    return 0;
}
