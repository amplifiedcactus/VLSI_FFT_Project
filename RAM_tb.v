module RAM_tb();

reg write_en, clk;
reg [31:0] data_in;
reg [15:0] read_addr, write_addr;

wire[31:0] data_out;

RAM UUT
(
.write_en(write_en),
.clk(clk),
.data_in(data_in[31:0]),
.read_addr(read_addr[15:0]),
.write_addr(write_addr[15:0]),
.data_out(data_out[31:0])
);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
write_addr = 16'b1;
data_in = 32'b11;
write_en = 1;
read_addr = 16'b1;
#20
$display("memory at addr:%b",read_addr, " is:%b", data_out);
if(data_out == 32'b11)
begin
	$display("memory was read successfully");
end
else
begin
	$display("ERROR");
end
end
endmodule
