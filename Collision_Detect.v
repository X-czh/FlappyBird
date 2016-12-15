`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:46 12/07/2016 
// Design Name: 
// Module Name:    Collision_Detect 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Collision_Detect(
    input clr,
    input [9:0] bird_y_pos,
    input [9:0] tube1_x_pos,
    input [9:0] tube1_y_pos,
    input [9:0] tube2_x_pos,
    input [9:0] tube2_y_pos,
    input [9:0] tube3_x_pos,
    input [9:0] tube3_y_pos,
    output game_end
    );
	 
	wire collide;
	
	// Set bird_x_pos
	wire [9:0] bird_x_pos;
	assign bird_x_pos = 364;
	
	// Check whether collides: 1 collides, 0 not yet
	assign collide = (
		(((bird_y_pos + 15 >= tube1_y_pos + 30) | (bird_y_pos - 15 <= tube1_y_pos - 30)) & 
			((bird_x_pos + 15 >= tube1_x_pos - 30) & (bird_x_pos - 15 <= tube1_x_pos + 30))) |
		(((bird_y_pos + 15 >= tube2_y_pos + 30) | (bird_y_pos - 15 <= tube2_y_pos - 30)) &
			((bird_x_pos + 15 >= tube2_x_pos - 30) & (bird_x_pos - 15 <= tube2_x_pos + 30))) |
		(((bird_y_pos + 15 >= tube3_y_pos + 30) | (bird_y_pos - 15 <= tube3_y_pos - 30)) &
			((bird_x_pos + 15 >= tube3_x_pos - 30) & (bird_x_pos - 15 <= tube3_x_pos + 30)))
		);
	
	// Output whether game ends: 1 ends, 0 not yet
	assign game_end = 
		(clr) ? 0:
		(collide) ? 1:
		0;

endmodule
