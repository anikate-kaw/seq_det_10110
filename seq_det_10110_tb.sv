 import uvm_pkg::*;
 `include "uvm_macros.svh"

module tb_top;
  
  reg a, clk, rst_n, en;
  wire b;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    forever begin
      clk = 0;
      #5ns;
      clk = 1;
      #5ns;
    end 
  end
  
  initial begin
    repeat(30) begin
      a = $urandom()%2;
      #10ns;
    end
    #10ns;
    a = 1;
    #10ns;
    a = 0;
    #10ns;
    a = 1;
    #10ns;
    a = 1;
    #10ns;
    a = 0;
    #10ns
    repeat(30) begin
      a = $urandom()%2;
      #10ns;
    end
    $finish;
  end
  
  dut dut_i(.in(a) , .clk(clk), .out(b));
  
endmodule
