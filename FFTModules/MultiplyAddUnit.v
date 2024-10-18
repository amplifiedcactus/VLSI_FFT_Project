//Module that takes 3 32 bit complex numbers as inputs, A, B and w. 2 32 bit complex numbers are output, Y and Z.
//A = ar + i.ai, ar = A[31:16], ai = A[15:0], ar and ai are twos complement signed integers
//Y is set equal to A+(B*w)
//Z is set equal to A-(B*w)
module MultiplyAddUnit (A, B, w, Y, Z, Clk, Rst)
    input wire Clk, Rst;
    input wire [31:0] A, B, w;
    output wire [31:0] Y, Z;
    
    //wires for real/imaginary components of operands
    wire signed [15:0] Ar, Ai, Br, Bi, wr, wi, Yr, Yi, Zr, Zi;

    assign Ar = A[31:16];
    assign Ai = A[15:0];
    assign Br = B[31:16];
    assign Bi = B[15:0];
    assign wr = w[31:16];
    assign wi = w[15:0];
    assign Yr = Y[31:16];
    assign Yi = Y[15:0];
    assign Zr = Z[31:16];
    assign Zi = Z[15:0];

    //wires for result of B*w
    wire signed [31:0] Bwr, Bwra, Bwrb Bwi, Bwia, Bwib;

    //wires for results of A+(B*w) and A-(B*w)
    wire signed [32:0] ABwr, ABwi, nABwr, nABwi;


    always@(posedge Clk)
    begin
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
        //Truncate results into outputs
        Yr <= ABwr[32:17];
        Yi <= ABwi[32:17];
        Zr <= nABwr[32:17];
        Zi <= nABwi[32:17];
    end




endmodule