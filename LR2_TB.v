`timescale 1ns / 1ps

module LR2_TB;

    // Inputs
    reg CLK;
    reg RST;
    reg CE;
    reg LOAD;
    reg [3:0] DAT_I;
    reg UP;

    // Outputs
    wire [3:0] SEQ;

    // Instantiate the Unit Under Test (UUT)
    LR2 uut (
        .CLK(CLK), 
        .RST(RST), 
        .CE(CE), 
        .LOAD(LOAD), 
        .DAT_I(DAT_I), 
        .UP(UP), 
        .SEQ(SEQ)
    );

    initial begin
        // Initialize Inputs
        DAT_I = 4'h0;
		  RST = 0;
		  #40;
		  RST = 1;
		  #60;
		  RST = 0;
        #1440;
        DAT_I = 4'ha;
        // Add stimulus here
    end
    initial begin
        // Initialize Inputs
        UP = 0;
        #50;
        UP = 1;
        #670; 
      UP = 0;
        // Add stimulus here
    end
        initial begin
        // Initialize Inputs
        RST = 0;
        #1900;
        RST = 1;
        // Add stimulus here
    end
        initial begin
        // Initialize Inputs
        CE = 0;
        #100;
        CE = 1;
        #1360;
        CE = 0;
        // Add stimulus here
    end
        initial begin
        // Initialize Inputs
        LOAD = 0;
        #1600;
        LOAD = 1;
        #50;
        LOAD = 0;
        #470;
        // Add stimulus here
    end
    initial begin
       CLK = 0;
        forever # 20 CLK = ~CLK;
    end

endmodule

