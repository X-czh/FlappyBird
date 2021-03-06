`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:21 12/07/2016 
// Design Name: 
// Module Name:    VGA_Controller 
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

module VGA_Controller(
    input clk,
    input clr,
    output reg hSync,
    output reg vSync,
    output bright,
    output [9:0] x,
    output [9:0] y
    );

	reg [2:0] count;
	reg [9:0] hCount;
	reg [9:0] vCount;		initial begin		count = 0;
		hCount = 0;
		vCount = 0;
	end	
	// Generate Horizontal_Count_Enable signal
	always @ (posedge clk, posedge clr, negedge clr)
		if (clr) begin
			count = 0;
			hCount = 0;
			vCount = 0;
		end
		else begin
			count = count + 1;
			if (count == 4) begin
				count = 0;
				// Horizontal pixel counter
				hCount = hCount + 1;
				if (hCount == 800) begin
					hCount = 0;
					// Vertival pixel counter
					vCount = vCount + 1;
					if (vCount == 525) begin
						vCount = 0;
					end
				end
			end
		end
		
	// Generate hSync signal
	always @ (posedge clk, posedge clr, negedge clr)
		if (clr)
			hSync = 0;
		else 
			if (hCount == 0)
				hSync = 0;
			else if (hCount == 96)
				hSync = 1;
	
	// Generate vSync signal
	always @ (posedge clk, posedge clr, negedge clr)
		if (clr)
			vSync = 0;
		else 
			if (vCount == 0)
				vSync = 0;
			else if (vCount == 2)
				vSync = 1;
	
	// Generate x, y (converted coordinates for display)
	assign x = hCount;
	assign y = vCount - 35;
	
	// Generate bright signal - 1 activate display, 0 deactivate display
	assign bright = (x >= 144) && (x <= 783) && (y >= 0) && (y <= 479);
				
endmodule
