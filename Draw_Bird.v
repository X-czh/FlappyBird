`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:11 12/07/2016 
// Design Name: 
// Module Name:    Draw_Bird 
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
module Draw_Bird(
    input clk10,
    input clr,
	 input game_end,
    input up,
    input down,
    output reg [9:0] bird_y_pos
    );
	
	 initial bird_y_pos = 240;
	 
	 always @ (posedge clk10, posedge clr, negedge clr) begin
		if (clr)
			bird_y_pos = 240;
		else if (~game_end) begin
			if ((up == 1) && (bird_y_pos >= 15))
				bird_y_pos = bird_y_pos - 6;
			if ((down == 1) && (bird_y_pos <= 465))
				bird_y_pos = bird_y_pos + 6;
			else if (bird_y_pos >=466)
				bird_y_pos = 465;
			else if (bird_y_pos <=14)
				bird_y_pos = 15;
		end
	 end
		
endmodule
