`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2025 16:49:27
// Design Name: 
// Module Name: alu_8bit
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


module alu_8bit(a,b,sel,fout );
    input wire [3:0]sel;
    input wire [7:0]a,b;
    // reg [15:0]fout_m;
     output reg [15:0]fout;   
     wire [7:0]out_i;
     wire [7:0]out_d;
     wire [8:0]out_a;
     wire [8:0]out_s;
     wire [15:0]out_m;
     reg cin,bin;    
  /*  wire [7:0]log_a;
    wire [7:0]log_o;
    wire [7:0]and_o;
     wire [7:0]or_o;
     wire [7:0]xor_o;
     wire [7:0]not_o;
    wire   [7:0]shift_left;
    wire  [7:0]shift_right;*/
    reg [2:0]shiftbit;
   //  output reg [15:0]fout;
decrement m1(a,out_d);
increment m2(a,out_i);
ripple_add m3(a,b,cin,out_a);
ripple_sub m4(a,b,bin,out_s);
multiplication m5(a,b,out_m);   
/*initial begin
 log_a=a&&b;
 log_o=a||b;
 and_o=a&b;
 or_o=a|b;
 xor_o=a^b;
 end*/
/* assign and_o=a&b;
assign or_o=a|b;
assign log_o=a&&b;
assign log_a=a||b;
assign xor_o=a^b;

assign not_o=~a;
assign shift_left=(a<<shiftbit); 
assign shift_right=(a>>shiftbit); */
  always@(*) begin
    case(sel)
    4'd0:fout=out_m; // multiplication output
    4'b0001:fout={7'b0,out_a}; //  adder output
    4'b0010:fout={8'b0,out_s}; // subtractor output
    4'b0011:fout={8'b0,out_i};  // incrementer output
    4'b0100:fout={8'b0,out_d}; // decrementer output
    4'b0101:fout={8'b0,a & b}; // bitwise  and of a & b
    4'b0110:fout={8'b0,a|b};  // bitwise or operation for a | b
    4'b0111:fout={8'b0,a^b}; // xor operation for a b
    4'b1000:fout={8'b0,~a}; // complementing of a 
    4'b1001:fout={8'b0,a && b}; // logical and between a b
    4'b1010:fout={8'b0,a || b}; // logical or between a b
    4'b1011:fout={8'b0,!a};    // not of a 
    4'd12:fout={8'b0,a<<shiftbit};  //shift left by shiftbit
    4'd13:fout={8'b0,a>>shiftbit};  //shift right a by shiftbit
    4'd14:fout={8'b0,~(a&b)};
    
    //4'd14:fout=!a;  //not of a
    default:
    begin   fout=16'b0;
            
    end          
    endcase
    
    end
    
    
endmodule
