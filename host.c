
//CELL THAT WE ARE GOING TO RUN THE APPLICATION AT
#include <pearl_system.h> 
#define CELL pearl 
#include <hrt/embed.h> 

//APPLICATION THAT WE ARE GOING TO RUN
#ifdef C_RUN 
  #include "faceDetection/include/haar.h" 
#else 
  #include "haar.map.h" 

  #ifndef HRT_CRUN_LS
    #include "haar.stubs.h" 
  #endif 
#endif

int hrt_main(int argc, char **argv)
{
  int inputs[2] = { 3, 4}, add_output, mul_output, expected_add_output, expected_mul_output;
  expected_add_output = inputs[0] + inputs[1];
  expected_mul_output = inputs[0] * inputs[1];

 //Loading the program
	hrt_cell_load_program_id(CELL,add);

 //Loading the initial variables
	hrt_indexed_store(CELL, int, add_inputs, 0, inputs[0]);
	hrt_indexed_store(CELL, int, add_inputs, 1, inputs[1]);

 //Starting the program
	add();

 //Reading back the results
	add_output = hrt_scalar_load(CELL, int, add_output_gen);
	mul_output = hrt_scalar_load(CELL, int, mul_output_gen);

 if(add_output != expected_add_output || mul_output != expected_mul_output)
 {
	hrt_error("Wrong output recieved");
	return 1;
 } 	
  return 0;
}
