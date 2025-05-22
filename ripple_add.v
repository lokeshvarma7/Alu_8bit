`timescale 1ns / 1ps

module ripple_add(
       a,b,cin,S
    );
    input [7:0]a,b;
    output reg [8:0]S;
    reg [8:0]C;
    input cin;
       integer i;
    always@(*) begin 
     
        C[0]=cin;
        for(i=0;i<8;i=i+1)begin
            S[i]=a[i]^b[i]^C[i];
            C[i+1]=(a[i]&b[i])|(C[i]&(a[i]^b[i]));
            end
        
         S[8]=C[8];
        end
   
    
endmodule
