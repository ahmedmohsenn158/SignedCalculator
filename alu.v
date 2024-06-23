module alu(
    input [2:0] A,
    input [2:0] B,
    input [1:0] S,
    output [3:0] output_sum,
    output [3:0] output_sub,
    output [4:0] output_mul,
    output [2:0] output_rem,
    output reg [4:0] R,
    output reg SF,
    output reg ZF,
    output reg DZF
);


add_sub result_sum(
    .A(A),
    .B(B),
    .M(1'b0),  
    .Result(),
    .TCR(output_sum),
    .Carry()
);

add_sub result_sub(
    .A(A),
    .B(B),
    .M(1'b1),  
    .Result(),
    .TCR(output_sub),
    .Carry()
);


Multiplying result_mul(
    .A(A),
    .B(B),
    .P(output_mul)
);


reg [2:0] Rem_Sel;
assign Rem_Sel = {A[1], A[0], B[1]};


Remainder result_rem(
    .Result(output_rem),
    .Selection(),
    .A(A),
    .B(B)
);


always @(*) begin
    case(S)
        2'd0: begin
            R[4] = output_sum[3];
            SF=output_sum[3];
            R[3] = 1'b0;
            R[2:0] = output_sum[2:0];

            if(R==5'b00000) begin
                ZF=1;
            end else begin
                ZF=0;
            end
            DZF=0;
        end
        
        2'd1: begin
            R[4] = output_sub[3];
            R[3] = 1'b0;
            R[2:0] = output_sub[2:0];

            SF=R[4];

            if(R==5'b00000) begin
                ZF=1;
            end else begin
                ZF=0;
            end

            DZF=0;

        end
        2'd2: begin 
            R[4:0] = output_mul;

            SF=R[4];
            
            if(R==5'b00000|R==5'b10000) begin
                ZF=1;
            end else begin
                ZF=0;
            end
            DZF=0;
        end
        2'd3: begin
            R[4] = output_rem[2];
            R[3]=1'b0;
            R[2]=1'b0;
            R[1]=output_rem[1];
            R[0] = output_rem[0];
            SF = output_rem[2];

            if(R==5'b00000|R==5'b10000) begin
                ZF=1;
            end else begin
                ZF=0;
            end

            DZF=~(B[0]|B[1]);
        end

        default: begin
            R = 5'b00000; 
        end
    endcase
end

endmodule