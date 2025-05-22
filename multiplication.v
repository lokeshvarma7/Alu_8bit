`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2025 20:10:41
// Design Name: 
// Module Name: multiplication
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


module multiplication(
a,b,sum
    );
input [7:0]a,b;
output reg [15:0]sum;
reg [7:0]mul;

integer i,j;
always@(*)begin
    mul=8'b0;
    sum=16'b0;
    for(i=0;i<8;i=i+1)begin
        for(j=0;j<8;j=j+1) begin 
                mul[j]=a[i]&b[j];
            end
            sum=sum+(mul<<i);
    end


end

endmodule
