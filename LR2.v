`timescale 1ns / 1ps

module LR2(
	input CLK,
	input RST,
	input CE,
	input LOAD,
	input [3:0] DAT_I,
	input UP,
	output wire [3:0] SEQ
    );
	 
reg [3:0] STATE;

LR2_OUT LR2_OUT(.X(STATE), .Y(SEQ));

always @(posedge CLK or posedge RST)
	begin
	if (RST == 1'b1)
		STATE <= 4'h0;
	else if (LOAD == 1'b1)
		STATE <= DAT_I;
	else if (CE == 1'b1)
		begin
			if (UP == 1'b0)
				begin
					if (STATE == 4'h0)
						STATE <= 4'hF;
					else
						STATE <= STATE - 1'b1;
				end
			else
				begin
					if (STATE == 4'hF)
						STATE <= 4'h0;
					else
						STATE <= STATE + 1'b1;
				end
		end
	
	end

endmodule
