`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:07:30 11/17/2016 
// Design Name: 
// Module Name:    SignalFrequency 
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
module SignalFrequency(
    input clk,
	 input clr,
    output reg clk10
    );
	 
	reg [22:0] count;
	
	initial
	begin
		count = 0;
		clk10 = 1;
	end
	
	always @ (posedge clk, posedge clr, negedge clr) begin
		if (clr) begin
			count = 0;
			clk10 = 1;
		end
		else begin
			count = count + 1;
			if (count == 5000000) begin
				count = 0;
				clk10 = ~clk10;
			end
		end
	end

endmodule
