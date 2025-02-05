`include "pwm.v"

module pwm_tb();
   reg clk,rst;
   reg [7:0]dutycycle;
   reg [7:0]counter;
   wire out;

   pwm F1(clk,rst,dutycycle,out);

   initial clk = 0;
   always #10 clk <= ~clk;
   
   initial begin
    $dumpfile("pwn_tb.vcd");
    $dumpvars(0, pwm_tb);

    clk=0;
    rst=1;
    dutycycle=8'b11000000;
    
    #20 rst=0;

    #100 dutycycle=8'b10000000;

    #100 dutycycle=8'b1000000;

    #20 rst=0;

    #100 dutycycle=8'b100000;

    #500 $finish;
   end

   initial begin
    $monitor($time ," dutycycle = %d , output = %b",dutycycle,out);
   end
endmodule