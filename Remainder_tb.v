module Remainder_tb;


wire [2:0] sel;
wire [2:0] res;
reg [2:0] a;
reg [2:0] b;

Remainder DUT 
(
    .Selection(sel),
    .Result(res),
    .A(a),
    .B(b)
);

integer i;
integer j;
integer f;
reg[2:0] expected;

initial begin
    f=$fopen("Remainder.txt","w");
        for (i = -3; i <= 3; i = i + 1) begin
            for (j = -3; j <= 3; j = j + 1) begin
                a = i;
                b = j;
                #100;
                expected[2]=a[2];

                if(b==00) begin
                    expected[1:0]=2'b00;
                end else begin
                    expected[1:0]=a[1:0]%b[1:0];
                end

                if(res==expected) begin
                    $display("[Pass], X=%b , Y=%b, X %% Y= result=%b", a, b, res);
                    $fwrite(f, "[Pass], X=%b , Y=%b, X %% Y= result=%3b\n", a, b, res);
                end else begin
                    $display("[Fail], X=%b , Y=%b, X %% Y= result=%b", a, b, res);
                    $fwrite(f, "[Fail], X=%b , Y=%b, X %% Y= result=%3b\n", a, b, res);
                end
            end
        end
        $fclose(f);
        $finish;
    end
endmodule