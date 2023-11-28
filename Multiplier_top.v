`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:50:05 PM
// Design Name: 
// Module Name: Multiplier_top
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


module Multiplier_top(
    input clk,
    input rst,
    input [2:0] adr1_r,
    input [2:0] adr2_r,
    input [3:0] adr_ram,
    output [7:0] result,
    output [3:0] st_out
    );
wire w_rf;
wire [2:0] adr;
wire DA,SA,SB;
wire [2:0] w_ram;
wire [3:0] A, B;
wire [3:0] O;
wire [7:0] X;
ROM uut1(adr, O);
Control uut4(clk, rst, adr1_r, adr2_r, w_rf, adr, DA, SA, SB, st_out, w_ram);
RF uut5(A, B, SA, SB, O, DA, w_rf, rst, clk);
multiplier uut2(A, B, X); //Use combinational -1 from the slide
RAM uut3(clk, rst, w_ram, adr_ram, X, result);
endmodule
