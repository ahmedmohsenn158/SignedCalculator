module alu_tb;
    reg [2:0] A;
    reg [2:0] B;
    reg [1:0] sel;
    wire [4:0] Result;
    wire Signed_Flag;
    wire Zero_Flag;
    wire Div_By_Zero_Flag;

    alu DUT(
        .A(A),
        .B(B),
        .S(sel),
        .R(Result),
        .output_sum(),
        .output_sub(),
        .output_mul(),
        .SF(Signed_Flag),
        .ZF(Zero_Flag),
        .DZF(Div_By_Zero_Flag),
        .output_rem()
    );

    integer i;
    integer j;
    integer k;
    integer f;

    initial begin
        f=$fopen("alu.txt","w");
        for (i = -3; i <= 3; i = i + 1) begin
            for (j = -3; j <= 3; j = j + 1) begin
                for (k=0; k<=3; k=k+1) begin
                    A = i;
                    B = j;
                    sel = k;
                    #10;
                    case (sel)
                        2'b00: begin
                            $display("A=%b , B=%b, A + B= result=%b, SF=%b, ZF=%b", A, B, Result, Signed_Flag, Zero_Flag);
                            $fwrite(f, "A=%b , B=%b, A + B= result=%b, SF=%b, ZF=%b\n", A, B, Result, Signed_Flag, Zero_Flag);
                        end

                        2'b01: begin
                            $display("A=%b , B=%b, A - B= result=%b, SF=%b, ZF=%b", A, B, Result, Signed_Flag, Zero_Flag);
                            $fwrite(f, "A=%b , B=%b, A - B= result=%b, SF=%b, ZF=%b\n", A, B, Result, Signed_Flag, Zero_Flag);
                        end

                        2'b10: begin
                            $display("A=%b , B=%b, A * B= result=%b, SF=%b, ZF=%b", A, B, Result, Signed_Flag, Zero_Flag);
                            $fwrite(f, "A=%b , B=%b, A * B= result=%b, SF=%b, ZF=%b\n", A, B, Result, Signed_Flag, Zero_Flag);
                        end

                        2'b11:begin
                            $display("A=%b , B=%b, A %% B= result=%b, SF=%b, ZF=%b, DZF=%b\n", A,B, Result, Signed_Flag, Zero_Flag, Div_By_Zero_Flag);
                            $fwrite(f, "A=%b , B=%b, A %% B= result=%b, SF=%b, ZF=%b, DZF=%b\n\n", A, B, Result, Signed_Flag, Zero_Flag, Div_By_Zero_Flag);
                        end
                        
                        default: begin
                            $display("Error");
                            $fwrite(f,"Error\n");
                        end

                    endcase
                end
            end
        end
        $fclose(f);
        $finish;
    end

endmodule