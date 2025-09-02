`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2025 10:57:01 PM
// Design Name: 
// Module Name: systolic_4x4
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


module systolic_4x4(
input[7:0] A0,A1,A2,A3,B0,B1,B2,B3,
input clk,rst,
output reg done,
output [15:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15
    );
 reg [3:0] count;
// wire [15:0] out[0:15];
 //reg [15:0] result [0:15];
 wire [7:0] a_out[0:15],b_out[0:15];
 pe p0 (clk,rst,A0,B0,a_out[0],b_out[0],r0);
 pe p4 (clk,rst,A1,b_out[0],a_out[1],b_out[1],r4);
 pe p8 (clk,rst,A2,b_out[1],a_out[2],b_out[2],r8);
 pe p12 (clk,rst,A3,b_out[2],a_out[3],b_out[3],r12);
 
 pe p1 (clk,rst,a_out[0],B1,a_out[4],b_out[4],r1);
 pe p2 (clk,rst,a_out[4],B2,a_out[8],b_out[8],r2);
 pe p3 (clk,rst,a_out[8],B3,a_out[12],b_out[12],r3);
 
 pe p5 (clk,rst,a_out[1],b_out[4],a_out[5],b_out[5],r5);
 pe p6 (clk,rst,a_out[5],b_out[8],a_out[9],b_out[9],r6);
 pe p7 (clk,rst,a_out[9],b_out[12],a_out[13],b_out[13],r7);
 
 pe p9 (clk,rst,a_out[2],b_out[5],a_out[6],b_out[6],r9);
 pe p10 (clk,rst,a_out[6],b_out[9],a_out[10],b_out[10],r10);
 pe p11 (clk,rst,a_out[10],b_out[13],a_out[14],b_out[14],r11);
 
 pe p13 (clk,rst,a_out[3],b_out[6],a_out[7],b_out[7],r13);
 pe p14 (clk,rst,a_out[7],b_out[10],a_out[11],b_out[11],r14);
 pe p15 (clk,rst,a_out[11],b_out[14],a_out[15],b_out[15],r15);
 
 always@(posedge clk)
 begin
 if(rst)
    begin
    count<=4'b0000;
    done<=1'b0;
    
    end
    else if(count == 4'b1010) begin
			    
		        done <= 1;
				count <= 0;
			end
    else begin
				done <= 0;
				count <= count + 1;
		
			end
  end
 
 
 
endmodule


module pe (input clk,rst ,input[7:0] a,b,output reg [7:0] a_out,b_out,output reg [15:0] result);
always@(posedge clk)
begin
if(rst)
    begin
    a_out<=8'b00000000;
    b_out<=8'b00000000;
    result<=8'b00000000;
    end
else
    begin
    a_out<= a;
    b_out <= b;
    result<= result+a*b;
    end
end
endmodule 
