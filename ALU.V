module ALU(A,B,S,o,zero,negative,carry,overflow);
input [7:0] A;
input [7:0] B;
input [3:0] S;
output zero,negative,carry,overflow,parity;
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

//perform division
wire[7:0]div_op;
assign div_op =A / B;

//perform logical AND operation
wire [7:0]AND_op;
assign AND_op  =A & B;

//perform logical OR operation
wire [7:0]OR_op;
assign OR_op = A|B;

//perform logical XOR operation
wire [7:0]XOR_op ;
assign XOR_op = A ^ B;

//modulo operation 
wire [7:0] modulo;
assign modulo =A % B;

// assign shift left op
wire[7:0] shift_left_op;
assign shift_left_op =A<<1;

//assign shift right op
wire[7:0] shift_right_op;
assign shift_right_op =A>>1;

// comprater operation
wire eq_flag, lt_flag, gt_flag;
assign eq_flag =(A == B); //equaltiy check
assign lt_flag =(A < B); //less than (unsigned)
assign gt_flag =(A > B); //greater than (unsigned)

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

//assign parity flag
wire parity;
assign parity = ~^o; //1 is even number of zeros and 0 if odd number of 1

always@(*)

begin
case(S)
4'b0000 :o = ADD_op; 
4'b0001 :o = SUB_op;
4'b0010 :o = MULT_op;
4'b0011 :o = AND_op;
4'b0100 :o = OR_op;
4'b0101 :o = XOR_op;
4'b0110 :o = modulo;
4'b0111 :o = shift_left_op;
4'b1000 :o = shift_right_op;
4'b1001 :o = div_op;
4'b1010 :o = eq_flag;
4'b1011 :o = lt_flag;
4'b1100 :o =  gt_flag;

default: o= 16'b0;
endcase
end

endmodule







