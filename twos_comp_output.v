module twos_comp_output(
    input [3:0] number,
    output [3:0] modified
);

    assign modified[3]=number[3];
    assign modified[2]=(number[3]^number[2])|(~number[1]&&~number[0]&&number[2]);
    assign modified[1]=(number[3]&&number[0])^number[1];
    assign modified[0]=number[0];
    
endmodule