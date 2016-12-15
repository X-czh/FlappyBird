`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:00:35 12/11/2016
// Design Name:   Draw_Tubes
// Module Name:   Z:/Downloads/FlappyBird latest/pipe_test.v
// Project Name:  FlappyBird
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Draw_Tubes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe_test;

	// Inputs
	reg clk10;
	reg clr;

	// Outputs
	wire [9:0] tube1_y_pos;
	wire [9:0] tube2_y_pos;
	wire [9:0] tube3_y_pos;
	wire [9:0] tube1_x_pos;
	wire [9:0] tube2_x_pos;
	wire [9:0] tube3_x_pos;
	wire [7:0] score;

	// Instantiate the Unit Under Test (UUT)
	Draw_Tubes uut (
		.clk10(clk10), 
		.clr(clr), 
		.tube1_y_pos(tube1_y_pos), 
		.tube2_y_pos(tube2_y_pos), 
		.tube3_y_pos(tube3_y_pos), 
		.tube1_x_pos(tube1_x_pos), 
		.tube2_x_pos(tube2_x_pos), 
		.tube3_x_pos(tube3_x_pos), 
		.score(score)
	);

	initial begin
		// Initialize Inputs
		clk10 = 0;
		clr = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
      
	always begin
		#10;
		clk10=~clk10;
	end
endmodule

