`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/06/16 17:18:35
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test;
reg CLK;
reg RESET;
wire [7:0] LED;
reg btn;
AHBLITE_SYS Inst_AHBLITE(
       .CLK(CLK),
       .RESET(RESET), 
       .LED(LED),
       .btn(btn)
    );
initial  
begin
  CLK=0;
  RESET=1;
  btn=0;
  #100;
  RESET=0;
end
always 
begin
 CLK=~CLK;
 #5;
end 
endmodule
