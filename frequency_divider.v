`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:26:37 13/04/2022
// Design Name: 
// Module Name:    frequency_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created //00000010000000010101010101010101011111111
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module frequency_divider(
	input CLK,		//При помощи счетчика подсчитывает количество поступивших синхросигнлов и когда счетчик заполняется
	input RST,		//выдает на выходе единицу, то есть поделенный синхросигнал
	output reg CEO
    );

	reg [16:0] CNT; //Счетчик для посчета синхросигналов
	
	always @(posedge CLK, posedge RST)
		if (RST)
			begin
				CNT <= 17'd0;
				CEO <= 1'b0;
			end
		else
			if (CNT == 17'd99999)
				begin
					CNT <= 17'd0;
					CEO <= 1'b1;
				end
			else
				begin
					CNT <= CNT + 1;
					CEO <= 1'b0;
				end
endmodule
