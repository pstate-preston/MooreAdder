`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: LSU
// Engineer: Preston Gautreaux
// 
// Create Date: 04/08/2025 10:37:17 AM
// Design Name: Moore type FSM serial adder
// Module Name: mooreadder
// Project Name: mooreadder

//////////////////////////////////////////////////////////////////////////////////


//defining shift register module
module shiftR(R, L, E, w, clock, Q);
	parameter n=4;
	input [n-1:0]R;
	input L, E, w, clock;
	output reg [n-1:0]Q;
	integer k;
	
	always@(posedge clock)
		if(L) Q <= R;
		else if(E)
		begin
			for(k = n-1; k > 0; k = k-1)
				Q[k-1] <= Q[k];
				Q[n-1] <= w;
		end
endmodule

//defining serial adder using moore type FSM
module mooreadder(A, B, resetn, clock, sum);
	input [3:0]A,B;
	input resetn,clock;
	output [3:0]sum;
	reg [2:0]count;
	reg s;
	reg [1:0]y,Y;
	wire [3:0]QA,QB;
	reg Run=1;
	parameter G0=2'b00, G1=2'b01, H0=2'b10, H1=2'b11;
	
	shiftR shift_A(A, resetn, 1'b1, 1'b0, clock, QA);
	shiftR shift_B(B, resetn, 1'b1, 1'b0, clock, QB);
	shiftR shift_Sum(4'b0000, resetn, Run, s, clock, sum);
	
	always@(QA, QB, y)
	begin
	case(y)
		G0:	begin
				s=0;
				case({QA[0],QB[0]})
					2'b00: Y = G0;
					2'b01: Y = G1;
					2'b10: Y = G1;
					2'b11: Y = H0;
				endcase
			end
		
		G1:	begin
				s=1;
				case({QA[0],QB[0]})
					2'b00: Y = G0;
					2'b01: Y = G1;
					2'b10: Y = G1;
					2'b11: Y = H0;
				endcase
			end
		
		H0:	begin
				s=0;
				case({QA[0],QB[0]})
					2'b00: Y = G1;
					2'b01: Y = H0;
					2'b10: Y = H0;
					2'b11: Y = H1;
				endcase
			end
		
		H1:	begin
				s=1;
				case({QA[0],QB[0]})
					2'b00: Y = G1;
					2'b01: Y = H0;
					2'b10: Y = H0;
					2'b11: Y = H1;
				endcase
			end
	endcase
	end
	
//flip flop definition
	always@(posedge clock)
		if(resetn) y <= 2'b00;
		else y <= Y;

//shift register control
	always@(posedge clock)
	begin
		if(!resetn) count = 5;              
		else if(Run) count = count - 1;
		Run = |count;
	end
	
endmodule