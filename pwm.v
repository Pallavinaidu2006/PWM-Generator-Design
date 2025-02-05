module pwm(
    input clk,
    input rst,  
    input [7:0] dutycycle,
    output reg out
);
   reg [7:0] counter;
   

   always @(posedge clk or posedge rst)
     if (rst) begin
        counter <= 8'b0;
        out <= 0;
     end
     else  begin
       counter = counter+1;
       if (counter<dutycycle) begin
        out <= 1;
       end
       else
        out <= 0;
       end
endmodule