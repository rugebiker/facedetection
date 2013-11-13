#ifndef _haar_hive_h
#define _haar_hive_h

#include <stdio.h>
#include<stdlib.h>
#include<image.h>

#define MAXLABELS 50
#define NUM 300

typedef  int sumtype;
typedef int sqsumtype;
extern int size;

typedef struct MyPoint
{
    int x;
    int y;
}
MyPoint;

typedef extern struct
{
    int width;
    int height;
}
MySize;

struct extern MyRect
{
    int x;
    int y;
    int width;
    int height;
};

typedef struct
{
    int x;
    int y;
    int width;
    int height;
    int matched;
}
MyRectLabeled;


typedef extern struct myCascade
{
// number of stages (22)
    int  n_stages;
    int total_nodes;
    float scale; 
 
    // size of the window used in the training set (20 x 20)
    MySize orig_window_size;
    MySize real_window_size;

    int inv_window_area;

    MyIntImage sum;
    MyIntImage sqsum;
   
    // pointers to the corner of the actual detection window
    sqsumtype *pq0, *pq1, *pq2, *pq3;
    sumtype *p0, *p1, *p2, *p3;

 int *stages_array;
 int *rectangles_array;
 int *weights_array;
 int *alpha1_array;
 int *alpha2_array;
 int *tree_thresh_array;
 int *stages_thresh_array;
 int **scaled_rectangles_array;

} myCascade;

/* sets images for haar classifier cascade */
void setImageForCascadeClassifier( myCascade* _cascade, MyIntImage* _sum, MyIntImage* _sqsum, int *stages_array, int *rectangles_array, int **scaled_rectangles_array);

/* runs the cascade on the specified window */
int runCascadeClassifier( myCascade* _cascade, MyPoint pt, int *tree_thresh_array, int **scaled_rectangles_array, int *weights_array, int *alpha1_array, int *alpha2_array, int *stages_array, int *stages_thresh_array);

void readTextClassifier();//(myCascade* cascade);
void releaseTextClassifier();

extern void detectObjects(void);
#endif
