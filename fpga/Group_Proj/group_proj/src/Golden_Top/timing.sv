module timing(
    input wire clk,
    output wire [31:0] count
);

parameter div = 50;

reg [31:0] intermediate;
	
always @(posedge clk) begin
    intermediate = intermediate + 1;
    if (intermediate == div) begin
        intermediate = 0;
        count = count + 1;
    end
end

endmodule
