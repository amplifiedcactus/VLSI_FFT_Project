//Module that takes 3 32 bit complex numbers as inputs, A, B and w. 2 32 bit complex numbers are output, Y and Z.
//A = ar + i.ai, ar = A[31:16], ai = A[15:0], ar and ai are twos complement Q6.10 fixed point numbers
//Q6.10 was chosen because if our input signal and w are <=1, max output of stage 1 is 2, of stage 2 is 4, of stage 3 is 8, and of stage 4 is 16
//Y is set equal to A+(B*w)
//Z is set equal to A-(B*w)
module MultiplyAddUnit (
    input wire Clk, Rst,
    input signed [31:0] A, B, w,
    output signed [31:0] Y, Z
);
    
    //reg for real/imaginary components of operands
    reg signed [15:0] Ar, Ai, Br, Bi, wr, wi, Yr, Yi, Zr, Zi;

    //reg for result of B*w
    reg signed [31:0] Bwr, Bwra, Bwrb, Bwi, Bwia, Bwib;

    //reg for results of A+(B*w) and A-(B*w)
    reg signed [31:0] ABwr, ABwi, nABwr, nABwi;


    always@(posedge Clk)
    begin
        //Split A, B and w into real and imaginary parts
        Ar <= A[31:16];
        Ai <= A[15:0];
        Br <= B[31:16];
        Bi <= B[15:0];
        wr <= w[31:16];
        wi <= w[15:0];
        //Calculate real part of B*w
        Bwra <= Br*wr;
        Bwrb <= Bi*wi;
        Bwr <= Bwra - Bwrb;
        //Calculate imaginary part of B*w
        Bwia <= Br*wi;
        Bwib <= Bi*wr;
        Bwi <= Bwia + Bwib;
        //Calculate A+(B*w)
        ABwr <= Ar+Bwr;
        ABwi <= Ai+Bwi;
        //Calculate A-(B*w)
        nABwr <= Ar-Bwr;
        nABwi <= Ai-Bwi;
        //Truncate results into outputs (takes 6 integer bits and 10 decimal bits)
        Yr <= ABwr[25:10];
        Yi <= ABwi[25:10];
        Zr <= nABwr[25:10];
        Zi <= nABwi[25:10];
    end

    assign Y[31:16] = Yr;
    assign Y[15:0] = Yi;
    assign Z[31:16] = Zr;
    assign Z[15:0] = Zi;




endmodule