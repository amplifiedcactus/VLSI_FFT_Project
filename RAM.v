// Dual Port RAM for FFT
module RAM #(parameter DATA_BIT_WIDTH = 32, ADDR_BIT_WIDTH = 32)
	(
		input [ADDR_BIT_WIDTH -1:0] write_addr, read_addr,
		input [DATA_BIT_WIDTH - 1: 0] data_in,
		input write_en, clk,
		output reg [DATA_BIT_WIDTH - 1:0] data_out
	);
	
	// declare ram
	reg [DATA_BIT_WIDTH - 1: 0] ram [(1<<ADDR_BIT_WIDTH) - 1: 0];
	
	assign nclk = ~clk;
	// write to memory on posedge.
	always@(posedge clk)
	begin
		if(write_en)
			ram[write_addr] <= data_in;
		end
	// read from memory on negedge of clk or posedge of nclk.
	always@(posedge nclk)
	begin
		data_out <= ram[read_addr];
	end
endmodule
