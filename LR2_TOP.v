`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:09 13/04/2022
// Design Name: 
// Module Name:    LR2_TOP 
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
module LR2_TOP(
   input clk, 
	input btnCpuReset, //Сигнал сброса
	input [4:0] sw,
	output [3:0] led,
	input btnC,
	input btnU
    );
	             
	reg [1:0] RST_SYNC;
	wire RST_I; //Шина с синхронизированным сигналом сброса
	wire CEO;
	wire BTN_C_CE;
	wire BTN_U_CE;
	
	always @(posedge clk, negedge btnCpuReset) //Синхронизация сброса
		if (~btnCpuReset) RST_SYNC <= 2'b11;
		else RST_SYNC <= {RST_SYNC[0], 1'b0};
	
	assign RST_I = RST_SYNC[1];
	
	frequency_divider gce(.CLK(clk), .RST(RST_I), .CEO(CEO));
	button_filter btnf_c(.CLK(clk), .RST(RST_I), .CE(CEO), .BTN_I(btnC), .BTN_O(), .BTN_CEO(BTN_C_CE));
	button_filter btnf_u(.CLK(clk), .RST(RST_I), .CE(CEO), .BTN_I(btnU), .BTN_O(), .BTN_CEO(BTN_U_CE));
	LR2 main(.CLK(clk), .RST(RST_I), .CE(BTN_C_CE), .LOAD(BTN_U_CE), .DAT_I(sw[3:0]), .UP(sw[4]), .SEQ(led[3:0]));

endmodule
