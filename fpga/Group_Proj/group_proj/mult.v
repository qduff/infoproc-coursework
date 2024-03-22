module mult (
	input signed [31:0] calc_in_a,
	input signed [31:0] calc_in_b,
	output reg [31:0] calc_out_h,
	output reg [31:0] calc_out_l
	);
	
	reg signed [63:0] out;

	always@(calc_in_a or calc_in_b) begin
		out = calc_in_a * calc_in_b;
		calc_out_h = out[63:31];
	        	calc_out_l = out[31:0];
	end
	
endmodule