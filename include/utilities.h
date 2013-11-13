#include <haar.h>

#define  IMIN(a, b)  ((a) ^ (((a)^(b)) & (((a) < (b)) - 1)))
#define  IMAX(a, b)  ((a) ^ (((a)^(b)) & (((a) > (b)) - 1)))
unsigned int int_sqrt (unsigned int value);

