`timescale 1ns/1ps
module tb_shiftRegister;
    reg Clk;
    reg [31:0] A, B, w;
    wire [31:0] Y, Z;


    MultiplyAddUnit dut (
        .A(A),
        .B(B),
        .w(w),
        .Y(Y),
        .Z(Z),
        .Clk(Clk)
    );

    initial begin
        //Test two sets of random number inputs
        Clk = 0;
        //Ar = 0.302734375, Ai = 0.1748046875
        A = 8'013600B3
        //Br = 0.662109375, Bi = 1
        B = 8'h02A60800
        //wr = -1, wi = 0.2294921875
        w = 8'hFFFF00EB

        #10;
        Clk = 1;
        #10;
        Clk = 0;
        #10;
        Clk = 1;
        #10;
        Clk = 0;
        #10;
        Clk = 1;
        #10;
        Clk = 0;
        #10;
        Clk = 1;
        #10;
        Clk = 0;
        #10;
        Clk = 1;
        #10;
        Clk = 0;
        #10;
        Clk = 1;
        #10;
        //A = 32'b10010001110110110110110101000000;
        //B = 32'b00010000001100101101000111100110;
        //w = 32'b11111001011010101100011101100000;

        Clk = 0;
        #10;
        Clk = 1;
        #10;
        Clk = 0;


        $stop;
    end









endmodule