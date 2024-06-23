# SignedCalculator
This is the software implementation ,using Verilog, of an arithmetic unit that is capable of adding, subtracting and multiplying two signed binary numbers of maximum 2 bits, and displays the result of the operation performed along with some additional flags regarding the operation and the result.

There are 3 modules along with their testbenches, addition & subtraction, multiplication, and remainder.

Alu.v is your top module that integrates all the circuits together.

The results of the testbenches are displayed in separate output files.

Flags:

• Sign Flag: The sign flag indicates if the result is negative. The flag is set to 1 if the result is
negative and 0 otherwise.

• Zero Flag: The zero flag indicates if the result is zero. The flag is set to 1 if the result is
zero and 0 otherwise.

• Div by Zero Flag: The divide by zero flag indicates if we divide by zero. The flag is set to 1 if B
operand equal zero in division operation and 0 otherwise.
