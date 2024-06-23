
module add_sub(
    input [2:0] A,
    input [2:0] B,
    input M,
    output [3:0] Result,
    output [3:0] TCR,
    output [2:0] Carry 
);

full_adder no1(
    .a(A[0]),
    .b(B[0]^M),
    .Cin(M),
    .sum(Result[0]),
    .Cout(Carry[0]) 
);

full_adder no2(
    .a((A[2]^A[1])|(~A[0]&&A[1])),
    .b(((B[2]^B[1])|(~B[0]&&B[1]))^M),
    .Cin(Carry[0]),
    .sum(Result[1]),
    .Cout(Carry[1])
);

full_adder no3(
    .a(A[2]),
    .b(B[2]^M),
    .Cin(Carry[1]),
    .sum(Result[2]),
    .Cout(Carry[2])
);
    assign Result[3]=(Result[2]^(Carry[1]^Carry[2]));

twos_comp_output res(
    .number(Result),
    .modified(TCR)
);

endmodule 