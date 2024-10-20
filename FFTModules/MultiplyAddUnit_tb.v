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
        //Ar = -4.1, Ai = 3.9
        //A = 32'hEF9A0F99;
        //Br = 2, Bi = 4
        //B = 32'hF8001000;
        //wr = -1, wi = 1
        //w = 32'hFC000400;

        A = 32'h03530402;
        B = 32'h2799f0f0;
        w = 32'h00e3fd56;
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