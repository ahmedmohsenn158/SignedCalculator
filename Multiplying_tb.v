module Multiplying_tb;


reg [2:0] iA;
reg [2:0] iB;
wire [4:0] res;

Multiplying DUT(
.A(iA),
.B(iB),
.P(res)

);

integer i;
integer j;
integer f;
reg[4:0] expected;

initial begin
    f=$fopen("Multiplying.txt","w");
        for (i = -3; i <= 3; i = i + 1) begin
            for (j = -3; j <= 3; j = j + 1) begin
                iA = i;
                iB = j;
                #100;
                expected[4]=iA[2]^iB[2];
                expected[3:0]=iA[1:0]*iB[1:0];
                if(res==expected) begin
                    $display("[Pass], X=%b , Y=%b, X*Y= result=%4b", iA, iB, res);
                    $fwrite(f, "[Pass], X=%b , Y=%b, X*Y= result=%4b\n", iA, iB, res);
                end else begin
                    $display("[Fail], X=%b , Y=%b, X*Y= result=%4b", iA, iB, res);
                    $fwrite(f, "[Fail], X=%b , Y=%b, X*Y= result=%4b\n", iA, iB, res);
                end
            end
        end
        $fclose(f);
        $finish;
    end

endmodule