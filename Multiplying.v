module Multiplying(
input [2:0] A,
input [2:0] B,
output reg [4:0] P

);

assign P[0]= A[0] && B[0];
assign P[1]= (A[0] && B[1]) ^ (A[1] && B[0]);
assign P[2]= ((A[0]&&B[1])&&(A[1]&&B[0]))^(A[1]&&B[1]);
assign P[3]= ((A[0]&&B[1])&&(A[1]&&B[0]))&&(A[1]&&B[1]);
assign P[4]= A[2]^B[2];

endmodule