module Counter( 
input wire clk,
input wire reset,
input wire enable,
input wire inputBit,
output wire [3:0] score
);
  
reg [3:0] counter;

always @(posedge clk) begin
  if(reset)
   
      counter <= 0;
     else if (enable) begin
      if (counter == 4'b1111) 
        counter <= 0;
        else
        
          counter <= (inputBit == 1'b0) ? counter + 1 : counter;
      end
    end
    assign score = counter;
    
endmodule

module CounterTB;
  
  reg clk;
  reg reset;
  reg enable;
  reg inputBit;
  wire [3:0] score;
  
  initial begin
    clk = 0;
    reset = 0;
    enable = 0;
    inputBit = 0;
    
    #5 reset = 1; // the reset is one
    #5 reset = 0; enable = 1;
    #5 inputBit = 0;
    #5 inputBit = 1;
    #5 inputBit = 1;
    #5 inputBit = 0;
    #5;
    $display("Score: %d", score);//display the total score
    #5 $finish;
  end
  
  always begin
  #1 clk = ~clk;
end

Counter counter(
.clk(clk),
.reset(reset),
.enable(enable),
.inputBit(inputBit),
.score(score)
);
endmodule