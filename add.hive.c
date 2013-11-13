#include <hive/support.h>
#include "add.hive.h"

int add_inputs[2];
int add_output_gen, mul_output_gen;

void add(void) ENTRY
{
  add_output_gen = add_inputs[0] + add_inputs[1];
  mul_output_gen = add_inputs[0] * add_inputs[1];
}
