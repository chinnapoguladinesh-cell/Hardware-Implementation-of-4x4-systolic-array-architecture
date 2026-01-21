`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2025 11:45:21 PM
// Design Name: 
// Module Name: systolic_tb
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


module systolic_tb();
reg [7:0] A0,A1,A2,A3,B0,B1,B2,B3;
reg clk,rst;
wire [15:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
wire done,start;
systolic_4x4 DUT (
 A0,A1,A2,A3,B0,B1,B2,B3,
clk,rst,
 done,start,
 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15
    );
always #5 clk=~clk;
initial
begin
rst=1'b1;
clk=1'b1;
//A0=8'd0;
//A1=8'd0;
//A2=8'd0;
//A3=8'd0;
//B0=8'd0;
//B1=8'd0;
//B2=8'd0;
//B3=8'd0;
#20
rst=1'b0;
#150;
$finish;
end

initial
begin

//A0=8'd0;
//B0=8'd0;
#20
A0=8'd1;
B0=8'd1;
#10;
A0=8'd2;
B0=8'd2;
#10;
A0=8'd3;
B0=8'd3;
#10;
A0=8'd4;
B0=8'd4;
#10;
A0=8'd0;
B0=8'd0;
#10;
A0=8'd0;
B0=8'd0;
#10;
A0=8'd0;
B0=8'd0;
#10;
end

initial
begin
#20;
//A1=8'd0;
//B1=8'd0;
//#10;

A1=8'd0;
B1=8'd0;
#10;

A1=8'd4;
B1=8'd4;
#10;

A1=8'd3;
B1=8'd2;

#10;
A1=8'd2;
B1=8'd1;

#10;
A1=8'd1;
B1=8'd3;

#10;
A1=8'd0;
B1=8'd0;

#10;
A1=8'd0;
B1=8'd0;
#10;
end

initial
begin
#20;
//A2=8'd0;
//B2=8'd0;
//#10;

A2=8'd0;
B2=8'd0;
#10;
A2=8'd0;
B2=8'd0;
#10;
A2=8'd2;
B2=8'd3;
#10;
A2=8'd3;
B2=8'd1;
#10;
A2=8'd4;
B2=8'd4;
#10;
A2=8'd1;
B2=8'd2;
#10;
A2=8'd0;
B2=8'd0;
#10;
end

initial
begin
#20;
//A3=8'd0;
//B3=8'd0;
//#10;

A3=8'd0;
B3=8'd0;
#10;
A3=8'd0;
B3=8'd0;
#10;
A3=8'd0;
B3=8'd0;
#10;
A3=8'd3;
B3=8'd2;
#10;
A3=8'd1;
B3=8'd3;
#10;
A3=8'd4;
B3=8'd1;
#10;
A3=8'd2;
B3=8'd4;
#10;
A3=8'd0;
B3=8'd0;
#10;
end

endmodule
