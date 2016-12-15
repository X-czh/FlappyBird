`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:44:38 11/20/2016 
// Design Name: 
// Module Name:    SevenSegScoreDisplay 
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
module SevenSegScoreDisplay(
	 input clk,
    input [7:0] score,
    output reg [3:0] AN,
    output reg [6:0] CA
    );
	
	// clk: 100MHz clock signal
	// score: the score won in the game
	// AN: anodes of 7-seg diaplay; 0 ON, 1 OFF
	// CA: cathods of 7-seg diaplay controling the 7 segments; 0 ON, 1 OFF
	
	reg [27:0] cnt;
	reg [1:0] cnt_AN;
	reg [3:0] dig_2;
	reg [3:0] dig_1;
	reg [3:0] dig_0;
	reg [3:0] O;
	
	// cnt_AN: count #100KHz clock signals, for controling AN
	// dig: decomposition of the count value
	// O: the output we want to display on 7-seg display
	
	initial
	begin
		cnt = 0;
		cnt_AN = 0;
		dig_2 = 0;
		dig_1 = 0;
		dig_0 = 0;
		AN = 4'b1111;
		CA = 7'b1111111;
	end
	
	always @ (posedge clk)
	begin
	
		cnt = cnt + 1;
		
		// Generate 100KHz clock signal for controling AN
		if (cnt == 1000)
			begin
				cnt = 0;
				cnt_AN = cnt_AN + 1;
				if (cnt_AN == 3)
					cnt_AN = 0;
				dig_2 = score / 100;
				dig_1 = (score / 10) % 10;
				dig_0 = score % 10;
			end
		
		// Control the periodic display of the three 7-seg displays
		case (cnt_AN)
			0: begin
					AN = 4'b1011;
					O = dig_2;
				end
			1: begin
					AN = 4'b1101;
					O = dig_1;
				end
			2: begin
					AN = 4'b1110;
					O = dig_0;
				end
			default: AN = 4'b1111;
		endcase
		
		// Generate output on 7-seg display
		case (O)
			0: CA = 7'b1000000;
			1: CA = 7'b1111001;
			2: CA = 7'b0100100;
			3: CA = 7'b0110000;
			4: CA = 7'b0011001;
			5: CA = 7'b0010010;
			6: CA = 7'b0000010;
			7: CA = 7'b1111000;
			8: CA = 7'b0000000;
			9: CA = 7'b0010000;
			default: CA = 7'b1111111;
		endcase
		
	end
	
endmodule
