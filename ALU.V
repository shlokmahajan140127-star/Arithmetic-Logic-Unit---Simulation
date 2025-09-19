module ALU(A,B,S,o,zero,negative,carry,overflow);
input [7:0] A;
input [7:0] B;
input [2:0] S;
output zero,negative,carry,overflow;
output reg [15:0]o;

//perform add operation
wire [8:0]ADD_op;
assign ADD_op = A+B; 

//perform substraction 
wire [8:0]SUB_op;
assign SUB_op =A-B;

//perform multiplication
wire [15:0]MULT_op;
assign MULT_op = A * B;

//perform logical AND operation
wire [7:0]AND_op;
assign AND_op  =A & B;

//perform logical OR operation
wire [7:0]OR_op;
assign OR_op = A|B;

//perform logical XOR operation
wire [7:0]XOR_op ;
assign XOR_op = A ^ B;

//indicate zero flag
wire zero;
assign zero =(o ==16'b0);

//indicate negative flag
wire negative;
assign negative = o[15];

//assign overflow flag
wire overflow;
assign overflow =(A[7] == B[7]) && (o[15] != A[7]);

//assign carry flag
wire [8:0]add_res;
assign add_res ={1'b0 ,A} + {1'b0 ,B} ;
wire carry;
assign carry=add_res[8];

always@(*)

begin
case(S)
3'b000 :o = ADD_op; 
3'b001 :o = SUB_op;
3'b010 :o = MULT_op;
3'b011 :o = AND_op;
3'b100 :o = OR_op;
3'b101 :o = XOR_op;

default: o= 16'b0;
endcase
end

endmodule




