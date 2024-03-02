module seq_det_10110(input in, input clk, output out);
  
  bit [2:0] curr_state, next_state;
  reg out_b;
  
  always@(*) begin
  case(curr_state)
    'd0: begin
      next_state = (in == 0) ? 'd0: 'd1;
    end
    'd1: begin
      next_state = (in == 0) ? 'd2: 'd1;
    end
    'd2: begin
      next_state = (in == 0) ? 'd0: 'd3;
    end
    'd3: begin
      next_state = (in == 0) ? 'd2: 'd4;
    end
    'd4: begin
      next_state = (in == 0) ? 'd5: 'd1;
    end
    'd5: begin
      next_state = (in == 0) ? 'd0: 'd3;
    end
  endcase
  end
  
  always@(posedge clk) begin
    if(curr_state == 'd5) begin
      out_b = 1;
    end else begin
      out_b = 0;
    end
    curr_state <= next_state;
  end
  
  assign out = out_b;
  
endmodule
