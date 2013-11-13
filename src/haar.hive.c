/*
 *  TU Eindhoven
 *  Eindhoven, The Netherlands
 *
 *  Name            :   haar.cpp
 *
 *  Author          :   Francesco Comaschi (f.comaschi@tue.nl)
 *
 *  Date            :   November 12, 2012
 *
 *  Function        :   Haar features evaluation for face detection
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

#include <haar.h>
#include <image.h>
#include <stdio.h>
#include <utilities.h>

#define MAXWIDTH 1300

typedef unsigned long long ticks;

void myIntegral( MyImage *src, MyIntImage *sum, MyIntImage *sqsum );
void nearestNeighbor (MyImage *src, MyImage *dst);

/*ToDo: cascade and tilted sum should not be passed as arguments*/
//it just fix the pointers to the right addresses (the new scaled sum and sqSum)
void setImageForCascadeClassifier( myCascade* _cascade, MyIntImage* _sum, MyIntImage* _sqsum, int* stages_array, int *rectangles_array, int **scaled_rectangles_array )
{
	MyIntImage *sum = _sum;
	MyIntImage *sqsum = _sqsum;
	myCascade* cascade = _cascade;
	int i, j, k;

	int r_index = 0;
	int w_index = 0;

	struct MyRect equRect;
	struct MyRect tr;
	cascade->sum = *sum;
	cascade->sqsum = *sqsum;

	equRect.x = equRect.y = 1;
	equRect.width = ((cascade->orig_window_size.width-2));
	equRect.height = ((cascade->orig_window_size.height-2));


	cascade->inv_window_area = equRect.width*equRect.height;

	// pointers to the corners of the first (top-left) detection sub-window on the current scaled-down frame
	cascade->p0 = (sum->data) ;
	cascade->p1 = (sum->data +  equRect.width - 1) ;
	cascade->p2 = (sum->data + sum->width*(equRect.height - 1));
	cascade->p3 = (sum->data + sum->width*(equRect.height - 1) + equRect.width - 1);
	cascade->pq0 = (sqsum->data);
	cascade->pq1 = (sqsum->data +  equRect.width - 1) ;
	cascade->pq2 = (sqsum->data + sqsum->width*(equRect.height - 1));
	cascade->pq3 = (sqsum->data + sqsum->width*(equRect.height - 1) + equRect.width - 1);

	// loop over the number of stages
	for( i = 0; i < cascade->n_stages; i++ )
	{
		// loop over the number of trees
		for( j = 0; j < stages_array[i]; j++ )
		{

			int nr;

			// number of rectangular features
			nr = 3;
			// loop over the number of rectangles
			for( k = 0; k < nr; k++ )
			{

				tr.x = rectangles_array[r_index + k*4];
				tr.width = rectangles_array[r_index + 2 + k*4];
				tr.y = rectangles_array[r_index + 1 + k*4];
				tr.height = rectangles_array[r_index + 3 + k*4];
				if (k < 2)
				{
					scaled_rectangles_array[r_index + k*4] = (sum->data + sum->width*(tr.y ) + (tr.x )) ;
					scaled_rectangles_array[r_index + k*4 + 1] = (sum->data + sum->width*(tr.y ) + (tr.x  + tr.width)) ;
					scaled_rectangles_array[r_index + k*4 + 2] = (sum->data + sum->width*(tr.y  + tr.height) + (tr.x ));
					scaled_rectangles_array[r_index + k*4 + 3] = (sum->data + sum->width*(tr.y  + tr.height) + (tr.x  + tr.width));
				}
				else
				{
					if ((tr.x == 0)&& (tr.y == 0) &&(tr.width == 0) &&(tr.height == 0))
					{
						scaled_rectangles_array[r_index + k*4] = NULL ;
						scaled_rectangles_array[r_index + k*4 + 1] = NULL ;
						scaled_rectangles_array[r_index + k*4 + 2] = NULL;
						scaled_rectangles_array[r_index + k*4 + 3] = NULL;
					}
					else
					{
						scaled_rectangles_array[r_index + k*4] = (sum->data + sum->width*(tr.y ) + (tr.x )) ;
						scaled_rectangles_array[r_index + k*4 + 1] = (sum->data + sum->width*(tr.y ) + (tr.x  + tr.width)) ;
						scaled_rectangles_array[r_index + k*4 + 2] = (sum->data + sum->width*(tr.y  + tr.height) + (tr.x ));
						scaled_rectangles_array[r_index + k*4 + 3] = (sum->data + sum->width*(tr.y  + tr.height) + (tr.x  + tr.width));
					}
				}
			}

			r_index+=12;
			w_index+=3;
		} /* j */
	}
}

inline int evalWeakClassifier(int variance_norm_factor, int p_offset, int tree_index, int w_index, int r_index, int *tree_thresh_array, int **scaled_rectangles_array, int *weights_array, int *alpha1_array, int *alpha2_array)
{
	// the node threshold is multiplied by the standard deviation of the image
	int t = tree_thresh_array[tree_index] * variance_norm_factor;

	int sum = (*(scaled_rectangles_array[r_index] + p_offset)
			- *(scaled_rectangles_array[r_index + 1] + p_offset)
			- *(scaled_rectangles_array[r_index + 2] + p_offset)
			+ *(scaled_rectangles_array[r_index + 3] + p_offset))
			* weights_array[w_index];


	sum += (*(scaled_rectangles_array[r_index+4] + p_offset)
			- *(scaled_rectangles_array[r_index + 5] + p_offset)
			- *(scaled_rectangles_array[r_index + 6] + p_offset)
			+ *(scaled_rectangles_array[r_index + 7] + p_offset))
			* weights_array[w_index + 1];

	if ((scaled_rectangles_array[r_index+8] != NULL))// || (scaled_rectangles_array[r_index+8+1] != NULL) || (scaled_rectangles_array[r_index+8+2] != NULL) || (scaled_rectangles_array[r_index+8+3] != NULL))
		//  sum += calc_sum(node->feature.rect[2],p_offset) * scaled_weights_array[w_index+2];
		sum += (*(scaled_rectangles_array[r_index+8] + p_offset)
				- *(scaled_rectangles_array[r_index + 9] + p_offset)
				- *(scaled_rectangles_array[r_index + 10] + p_offset)
				+ *(scaled_rectangles_array[r_index + 11] + p_offset))
				* weights_array[w_index + 2];

	if(sum >= t)
		return alpha2_array[tree_index];
	else
		return alpha1_array[tree_index];

}

int runCascadeClassifier( myCascade* _cascade, MyPoint pt, int *tree_thresh_array, int **scaled_rectangles_array, int *weights_array, int *alpha1_array, int *alpha2_array, int *stages_array, int *stages_thresh_array)
{
	int p_offset, pq_offset;
	int i, j;
	unsigned int mean;
	unsigned int variance_norm_factor;
	int haar_counter = 0;
	int w_index = 0;
	int r_index = 0;
	int stage_sum;
	int exit_stage;
	myCascade* cascade;
	cascade = _cascade;

	p_offset = pt.y * (cascade->sum.width) + pt.x;
	pq_offset = pt.y * (cascade->sqsum.width) + pt.x;

	// Image normalization
	// mean is the mean of the pixels in the detection window
	//cascade->pqi[pq_offset] are the squared pixel values (using the squared integral image)
	// inv_window_area is 1 over the total number of pixels in the detection window
	variance_norm_factor =  (cascade->pq0[pq_offset] - cascade->pq1[pq_offset] - cascade->pq2[pq_offset] + cascade->pq3[pq_offset]);
	mean = (cascade->p0[p_offset] - cascade->p1[p_offset] - cascade->p2[p_offset] + cascade->p3[p_offset]);

	variance_norm_factor = (variance_norm_factor*cascade->inv_window_area);
	variance_norm_factor =  variance_norm_factor - mean*mean;
	if( variance_norm_factor >= 0 )
		variance_norm_factor = int_sqrt(variance_norm_factor);
	else
		variance_norm_factor = 1;

	for( i = 0; i < cascade->n_stages; i++ )
	{
		stage_sum = 0;

		for( j = 0; j < stages_array[i]; j++ )
		{
			stage_sum += evalWeakClassifier(variance_norm_factor, p_offset, haar_counter, w_index, r_index, tree_thresh_array, scaled_rectangles_array, weights_array, alpha1_array, alpha2_array);
			haar_counter++;
			w_index+=3;
			r_index+=12;
		}
		// threshold of the stage. If the sum is below the threshold, no faces are detected, and the search is abandoned at the i-th stage (-i).
		// Otherwise, a face is detected (1)
		if( stage_sum < stages_thresh_array[i] )
			return -i;
	}
	return 1;
}

struct MyRect **ScaleImage_Invoker( myCascade* _cascade, float _factor, int sum_row, int sum_col, struct MyRect **allCandidates, int* index, int *tree_thresh_array, int **scaled_rectangles_array, int *weights_array, int *alpha1_array, int *alpha2_array, int *stages_array, int *stages_thresh_array)
{
	myCascade* cascade = _cascade;

	float factor = _factor;
	MyPoint p;
	int result;
	int y2, x2;
	int x = 0, y = 0, step = 1;
	
	//struct MyRect *pmyrect;
	

	MySize winSize0 = cascade->orig_window_size;
	MySize winSize;

	//winSize.width =  int(winSize0.width*factor);
	//winSize.height =  int(winSize0.height*factor);

	winSize.width =  (int)(winSize0.width*factor);
	winSize.height =  (int)(winSize0.height*factor);

	y2 = sum_row - winSize0.height;
	x2 = sum_col - winSize0.width;

	for( y = 0; y <= y2; y += step )
		for( x = 0; x <= x2; x += step )
		{
			p.x = x;
			p.y = y;
			result = runCascadeClassifier( cascade, p, tree_thresh_array, scaled_rectangles_array, weights_array, alpha1_array, alpha2_array, stages_array, stages_thresh_array );

			if( result > 0 )
			{
				struct MyRect *pmyrect = (struct MyRect*) malloc(sizeof(struct MyRect ));
				pmyrect->x=(int)(x*factor);
				pmyrect->y=(int)(y*factor);
				pmyrect->width=winSize.width;
				pmyrect->height=winSize.height;
				addRect(allCandidates, pmyrect);
				//pmyrect++;
				*index++;
			}
		}
	return NULL;
}

void addRect(struct MyRect **rectArray, struct MyRect *rect)
{
	int i;

	for (i = 0; i < NUM; i++)
	{
		if (rectArray[i] == NULL)
		{
			rectArray[i] = rect;
			return;
		}
	}

	if (i == NUM)
	{
		printf("Failed adding rect!");
	}
}

int detectObjects( MyImage* _img, MySize minSize, MySize maxSize, myCascade* cascade, float scaleFactor, int minNeighbors, struct MyRect **allCandidates)
{
	const float GROUP_EPS = 0.45f;
	MyImage *img = _img;
	MyImage image1Obj;
	MyIntImage sum1Obj;
	MyIntImage sqsum1Obj;

	MyIntImage *sum1 = &sum1Obj;
	MyIntImage *sqsum1 = &sqsum1Obj;
	MyImage *img1 = &image1Obj;

	float factor;
	int indexCount;
	struct MyRect *p;
	//p = allCandidates[0];

	if( maxSize.height == 0 || maxSize.width == 0 )
	{
		maxSize.height = img->height;
		maxSize.width = img->width;
	}

	// window size of the training set
	MySize winSize0 = cascade->orig_window_size;
	
	createImage(img->width, img->height, img1);
	createSumImage(img->width, img->height, sum1);
	createSumImage(img->width, img->height, sqsum1);

	factor = 1;

	for( factor = 1; ; factor *= scaleFactor )
	{

		/* size of the detection sub-window
		 * scaled up according to scale factor
		*/

		MySize winSize = { (int)(winSize0.width*factor), (int)(winSize0.height*factor) };

		// size of the image scaled down (from bigger to smaller)

		MySize sz = { ( (int)(img->width/factor) ), ( (int)(img->height/factor) ) };

		cascade->real_window_size = sz;

		// difference between sizes of the scaled image and the original detection window
		MySize sz1 = { sz.width - winSize0.width, sz.height - winSize0.height };


		// if the actual scaled image is smaller than the original detection window, break
		if( sz1.width < 0 || sz1.height < 0 )
			break;

		// if the scaled up image is bigger than maxSize(i.e., the input frame), break
		//		if( winSize.width > maxSize.width || winSize.height > maxSize.height )
		//			break;

		// if a minSize different from the original detection window is specified, continue to the next scaling
		if( winSize.width < minSize.width || winSize.height < minSize.height )
			continue;


		setImage(sz.width, sz.height, img1);
		setSumImage(sz.width, sz.height, sum1);
		setSumImage(sz.width, sz.height, sqsum1);
		// image scaling
		nearestNeighbor(img, img1);

		myIntegral(img1, sum1, sqsum1);
		setImageForCascadeClassifier( cascade, sum1, sqsum1, cascade->stages_array, cascade->rectangles_array, cascade->scaled_rectangles_array);
		ScaleImage_Invoker(cascade, factor, sum1->height, sum1->width, allCandidates, &indexCount, cascade->tree_thresh_array, cascade->scaled_rectangles_array, cascade->weights_array, cascade->alpha1_array, cascade->alpha2_array, cascade->stages_array, cascade->stages_thresh_array);
	}

	/*if( minNeighbors > 0)
	{
		mergeDetections(allCandidates,minNeighbors, GROUP_EPS);
	}*/

	freeImage(img1);
	freeSumImage(sum1);
	freeSumImage(sqsum1);

	return indexCount;
}

void myIntegral( MyImage *src, MyIntImage *sum, MyIntImage *sqsum )
{
	int x, y, s, sq, t, tq;
	unsigned char it;
	int height = src->height;
	int width = src->width;
	unsigned char *data = src->data;
	int * sumData = sum->data;
	int * sqsumData = sqsum->data;
	for( y = 0; y < height; y++)
	{
		s = 0;
		sq = 0;
		// loop over the number of columns
		for( x = 0; x < width; x ++)//x += cn )
		{
			//uchar it = src[x]; // pixel value
			it = data[y*width+x];//->Get(x, y);
			s += it; //sum of the current row (integer)
			sq += it*it;

			t = s;
			tq = sq;
			if (y != 0)
			{
				t += sumData[(y-1)*width+x];//sum->Get(x, y-1);
				tq += sqsumData[(y-1)*width+x];
			}
			sumData[y*width+x]=t;//Set(x, y, t);
			sqsumData[y*width+x]=tq;//(x, y, tq);
		}
	}
}

void nearestNeighbor (MyImage *src, MyImage *dst)
{
	int y;
	int j;
	int x;
	int i;
	unsigned char* t;
	unsigned char* p;
	int w1 = src->width;
	int h1 = src->height;
	int w2 = dst->width;
	int h2 = dst->height;

	int rat = 0;

	unsigned char* src_data = src->data;
	unsigned char* dst_data = dst->data;

	//    int[] temp = new int[w2*h2] ;
	// EDIT: added +1 to account for an early rounding problem
	int x_ratio = (int)((w1<<16)/w2) +1;
	int y_ratio = (int)((h1<<16)/h2) +1;
	//int x_ratio = (int)((w1<<16)/w2) ;
	//int y_ratio = (int)((h1<<16)/h2) ;
//	int x2, y2 ;
	for (i=0;i<h2;i++)
	{
		t = dst_data + i*w2;
		y = ((i*y_ratio)>>16);
		p = src_data + y*w1;
		rat = 0;
		for (j=0;j<w2;j++)
		{
//			x2 = ((j*x_ratio)>>16) ;
//			y2 = ((i*y_ratio)>>16) ;
//			temp[(i*w2)+j] = pixels[(y2*w1)+x2] ;
			x = (rat>>16);
			*t++ = p[x];
			rat += x_ratio;
		}
	}
}


/* End of file. */
