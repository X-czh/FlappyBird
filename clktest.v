`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:50:51 12/11/2016
// Design Name:   clk_div
// Module Name:   C:/Users/M1A2/Documents/Xilinx/FlappyBird latest/clktest.v
// Project Name:  FlappyBird
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_div
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clktest;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	clk_div uut (
		.clk(clk), 
		.reset(reset), 
		.clk_out(clk_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   always
	begin
		#5;
		clk = ~clk;
	end
endmodule

