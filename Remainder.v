 module Remainder
 (
     output reg [2:0] Result,
     output reg [2:0] Selection,
     input [2:0] A,
     input [2:0] B
 );

 assign Selection= {A[1],A[0],B[1]};
 assign Result[2] = A[2];
 always @(*)
 begin
     case (Selection)
       3'b000: Result[0] = 1'b0;
       3'b001: Result[0] = 1'b0;
       3'b010: Result[0] = 1'b0;
       3'b011: Result[0] = 1'b1;
       3'b100: Result[0] = 1'b0; 
       3'b101: Result[0] = 1'b0;
       3'b110: Result[0] = 1'b0;
       3'b111: Result[0] = ~B[0];
       default:  Result[0] = 1'b0;
     endcase
 end

 always @(*)
 begin
     case (Selection)
       3'b000: Result[1] = 1'b0;
       3'b001: Result[1] = 1'b0;
       3'b010: Result[1] = 1'b0;
       3'b011: Result[1] = 1'b0;
       3'b100: Result[1] = 1'b0;
       3'b101: Result[1] = B[0];
       3'b110: Result[1] = 1'b0;
       3'b111: Result[1] = 1'b0;
       default: Result[1] = 1'b0;
     endcase
 end

 endmodule