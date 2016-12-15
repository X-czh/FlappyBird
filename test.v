`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:53:38 12/08/2016
// Design Name:   FlappyBird
// Module Name:   C:/Users/M1A2/Documents/Xilinx/FlappyBird/test.v
// Project Name:  FlappyBird
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FlappyBird
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg clr;
	reg up;
	reg down;

	// Outputs
	wire hSync;
	wire vSync;
	wire [7:0] rgb;
	wire [3:0] AN;
	wire [6:0] CA;

	// Instantiate the Unit Under Test (UUT)
	FlappyBird uut (
		.clk(clk), 
		.clr(clr), 
		.up(up), 
		.down(down), 
		.hSync(hSync), 
		.vSync(vSync), 
		.rgb(rgb), 
		.AN(AN), 
		.CA(CA)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		up = 0;
		down = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
     
	always begin
		#5;
		clk = ~clk;
	end
endmodule

