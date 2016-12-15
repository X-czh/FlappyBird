`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:35 12/08/2016 
// Design Name: 
// Module Name:    random_gen 
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
module random_gen(
	input clk, 
	output reg [6:0] out
    );
	 
	 reg [20:0] rand;
	 initial rand = ~(20'b0);
	 reg [20:0] rand_next;
	 wire feed;
	 
	 assign feed = rand[20] ^ rand[17];
	 
	 always @ (posedge clk)
	 begin
		rand <= rand_next;
		out = rand[6:0];
	 end
	 
	 always @ (*)
	 begin
		rand_next = {rand[19:0], feed};
	 end

endmodule
