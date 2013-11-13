/*
 *  TU Eindhoven
 *  Eindhoven, The Netherlands
 *
 *  Name            :   utilities.cpp
 *
 *  Author          :   Francesco Comaschi (f.comaschi@tue.nl)
 *
 *  Date            :   November 12, 2012
 *
 *  Function        :   Functions to manage .pgm images and integral images
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

#include <utilities.h>

#define UPPERBITS(value) (value>>30)
unsigned int int_sqrt (unsigned int value)
{
	int i;
	unsigned int a = 0, b = 0, c = 0;
	for (i=0; i < (32 >> 1); i++)
	{
		c<<= 2;
		c += UPPERBITS(value);
		value <<= 2;
		a <<= 1;
		b = (a<<1) | 1;
		if (c >= b)
		{
			c -= b;
			a++;
		}
	}
	return a;
}









