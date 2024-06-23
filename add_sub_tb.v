
module add_sub_tb;
    reg [2:0] X;
    reg [2:0] Y;
    reg m;
    wire [3:0] result;
    wire [2:0] carry;

    add_sub DUT(
        .A(X),
        .B(Y),
        .M(m),
        .Result(),
        .TCR(result),
        .Carry(carry)
    );
    
    integer i;
    integer j;
    integer f;

    initial begin
        f=$fopen("add_sub.txt","w");
        for (i = -3; i <= 3; i = i + 1) begin
            for (j = -3; j <= 3; j = j + 1) begin
                X = i;
                Y = j;
                m = 0;
                #100;

                if((X[2] == 0 && Y[2] == 0)||(X[2] == 1 && Y[2] == 1))begin
                    if(result == X+Y)begin
                        $display("[Pass], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                        $fwrite(f, "[Pass], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                    end else begin
                        $display("[Fail], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                        $fwrite(f, "[Fail], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                    end 
                end 
                else

                if(X[2]==1 && result[3]==0) begin
                    if(result[2:0] == (~X[1:0] + 1 + Y[1:0]))begin
                            $display("[Pass], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                            $fwrite(f, "[Pass], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                        end else begin
                            $display("[Fail], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                            $fwrite(f, "[Fail], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                        end
                end
                else

                if(X[2]==1 && result[3]==1) begin
                    if(result[2:0] == ~(~X[1:0] + 1 + Y[1:0])+1)begin
                            $display("[Pass], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                            $fwrite(f, "[Pass], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                        end else begin
                            $display("[Fail], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                            $fwrite(f, "[Fail], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                        end
                end
                else

                if(Y[2]==1 && result[3]==1) begin
                    if(result[2:0] == ~(~Y[1:0] + 1 + X[1:0])+1)begin
                            $display("[Pass], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                            $fwrite(f, "[Pass], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                        end else begin
                            $display("[Fail], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                            $fwrite(f, "[Fail], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                        end
                end

                else
                    if(result[2:0] == (~Y[1:0]+1+X[1:0]))begin
                            $display("[Pass], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                            $fwrite(f, "[Pass], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                        end else begin
                            $display("[Fail], X=%b , Y=%b, X+Y= result=%4b", X, Y, result);
                            $fwrite(f, "[Fail], X=%b , Y=%b, X+Y= result=%4b\n", X, Y, result);
                    end


                m=1;
                #100;

                if(X[2]==0&&Y[2]==0&&result[3]==0) begin
                    if(result[2:0]==X[1:0]+~Y[1:0]+1) begin
                        $display("[Pass], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Pass], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end else begin
                        $display("[Fail], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Fail], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end
                end
                else

                if(X[2]==0&&Y[2]==0&&result[3]==1) begin
                    if(result[2:0]==~(X[1:0]+~Y[1:0]+1)+1) begin
                        $display("[Pass], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Pass], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end else begin
                        $display("[Fail], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Fail], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end
                end

                else
                if(X[2]==1&&Y[2]==1&&result[3]==0) begin
                    if(result[2:0]==~X[1:0]+1+Y[1:0]) begin
                        $display("[Pass], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Pass], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end else begin
                        $display("[Fail], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Fail], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end
                end

                else
                if(X[2]==1&&Y[2]==1&&result[3]==1) begin
                    if(result[2:0]==~(~X[1:0]+1+Y[1:0])+1) begin
                        $display("[Pass], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Pass], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end else begin
                        $display("[Fail], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Fail], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end
                end

                else
                if(X[2]==0&&Y[2]==1&&result[3]==0) begin
                    if(result[2:0]==(X[1:0]+Y[1:0])) begin
                        $display("[Pass], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Pass], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end else begin
                        $display("[Fail], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Fail], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end
                end

                else
                if(X[2]==0&&Y[2]==1&&result[3]==1) begin
                    if(result[2:0]==~(X[1:0]+Y[1:0])+1) begin
                        $display("[Pass], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Pass], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end else begin
                        $display("[Fail], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Fail], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end
                end

                else
                if(X[2]==1&&Y[2]==0&&result[3]==0) begin
                    if(result[2:0]==~X[1:0]+1+Y[1:0]) begin
                        $display("[Pass], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Pass], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end else begin
                        $display("[Fail], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Fail], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end
                end

                else
                if(result[2:0]==(X[1:0]+Y[1:0])) begin
                        $display("[Pass], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Pass], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end else begin
                        $display("[Fail], X=%b , Y=%b, X-Y= result=%4b\n", X, Y, result);
                        $fwrite(f, "[Fail], X=%b , Y=%b, X-Y= result=%4b\n\n", X, Y, result);
                    end
            end
        end
        $fclose(f);
        $finish;
    end
endmodule
