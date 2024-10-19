module control (
  input wire clk, reset,        
  output reg [3:0] stage,       
  output reg [3:0] address,     
  output reg write_en, read_en            
  //add twiddle 
);

  // Twiddle factors(precomputed)

  // Initialize the twiddle factors


  always @(posedge clk or posedge reset) begin
    if (reset) begin
      stage <= 0;
      address <= 0;
      write_en <= 0;
      read_en <= 1;
    end else begin
      if (stage < 4) begin
        // Update the twiddle factors for the current stage
        address <= address + 1;
        
        if (address == 15) begin
          stage <= stage + 1;
          address <= 0;
        end
      end else begin
        // Reset after completing all stages
        stage <= 0;
      end
    end
  end
endmodule
