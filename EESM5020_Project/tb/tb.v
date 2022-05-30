`timescale 1 ns / 1 ps

module tb;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
localparam CLK_PERIOD = 5.0;  // clock period: 5ns

// ----------------------------------
// Interface of the top module
// ----------------------------------
reg clk, rst;
wire [7:0] aluout;

// ----------------------------------
// Instantiate the top
// ----------------------------------
processor uut (
  .clk        (clk),          // system clock
  .reset        (rst),          // system reset (active high)

  .aluout  (aluout)     // result
);

// ----------------------------------
// For gate-level and post-layout 
// simulation, we should backannotate 
// the SDF file defined in SDF_FILE
// ----------------------------------

`ifdef SDF_FILE
initial begin
  $sdf_annotate(`SDF_FILE, uut);
end
`endif

// ----------------------------------
// Clock generation
// ----------------------------------

initial begin
  clk = 1'b0;
  forever #(CLK_PERIOD/2.0) clk = ~clk;
end

// ----------------------------------
// Input stimulus
// Generate the ad-hoc stimulus
// ----------------------------------
initial begin
  // Reset
  rst         = 1'b0;
  #(2*CLK_PERIOD) rst = 1'b1;

end
  
// ----------------------------------
// Time Limit
// ----------------------------------
initial begin
  #1000
  $display("Reach time limit, force stop.");
  $finish;
end
  
// ----------------------------------
// Output monitor
// ----------------------------------
always @(posedge clk) begin

    $display("alu result: %d", aluout);

end

endmodule