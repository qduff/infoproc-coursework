module fir (
    input signed [31:0] sample,
    output reg [31:0] out_h,
	output reg [31:0] out_l, 
    input new_sample,
    input clk
    );

    
    wire signed [63:0] acc0;
    wire signed [63:0] acc1;
    wire signed [63:0] acc2;
    wire signed [63:0] acc3;
    wire signed [63:0] acc4;
    wire signed [63:0] acc5;
    wire signed [63:0] acc6;
    wire signed [63:0] acc7;
    wire signed [63:0] acc8;
    wire signed [63:0] acc9;
    wire signed [63:0] acc10;
    wire signed [63:0] acc11;
    wire signed [63:0] acc12;
    wire signed [63:0] acc13;
    wire signed [63:0] acc14;
    wire signed [63:0] acc15;
    wire signed [63:0] acc16;
    wire signed [63:0] acc17;
    wire signed [63:0] acc18;
    wire signed [63:0] acc19;
    wire signed [63:0] acc20;
    wire signed [63:0] acc21;
    wire signed [63:0] acc22;
    wire signed [63:0] acc23;
    wire signed [63:0] acc24;
    wire signed [63:0] acc25;
    wire signed [63:0] acc26;
    wire signed [63:0] acc27;
    wire signed [63:0] acc28;
    wire signed [63:0] acc29;
    wire signed [63:0] acc30;
    wire signed [63:0] acc31;
    wire signed [63:0] acc32;
    wire signed [63:0] acc33;
    wire signed [63:0] acc34;
    wire signed [63:0] acc35;
    wire signed [63:0] acc36;
    wire signed [63:0] acc37;
    wire signed [63:0] acc38;
    wire signed [63:0] acc39;
    wire signed [63:0] acc40;
    wire signed [63:0] acc41;
    wire signed [63:0] acc42;
    wire signed [63:0] acc43;
    wire signed [63:0] acc44;
    wire signed [63:0] acc45;
    wire signed [63:0] acc46;
    wire signed [63:0] acc47;
    wire signed [63:0] acc48;

    wire signed [31:0] buf0;
    wire signed [31:0] buf1;
    wire signed [31:0] buf2;
    wire signed [31:0] buf3;
    wire signed [31:0] buf4;
    wire signed [31:0] buf5;
    wire signed [31:0] buf6;
    wire signed [31:0] buf7;
    wire signed [31:0] buf8;
    wire signed [31:0] buf9;
    wire signed [31:0] buf10;
    wire signed [31:0] buf11;
    wire signed [31:0] buf12;
    wire signed [31:0] buf13;
    wire signed [31:0] buf14;
    wire signed [31:0] buf15;
    wire signed [31:0] buf16;
    wire signed [31:0] buf17;
    wire signed [31:0] buf18;
    wire signed [31:0] buf19;
    wire signed [31:0] buf20;
    wire signed [31:0] buf21;
    wire signed [31:0] buf22;
    wire signed [31:0] buf23;
    wire signed [31:0] buf24;
    wire signed [31:0] buf25;
    wire signed [31:0] buf26;
    wire signed [31:0] buf27;
    wire signed [31:0] buf28;
    wire signed [31:0] buf29;
    wire signed [31:0] buf30;
    wire signed [31:0] buf31;
    wire signed [31:0] buf32;
    wire signed [31:0] buf33;
    wire signed [31:0] buf34;
    wire signed [31:0] buf35;
    wire signed [31:0] buf36;
    wire signed [31:0] buf37;
    wire signed [31:0] buf38;
    wire signed [31:0] buf39;
    wire signed [31:0] buf40;
    wire signed [31:0] buf41;
    wire signed [31:0] buf42;
    wire signed [31:0] buf43;
    wire signed [31:0] buf44;
    wire signed [31:0] buf45;
    wire signed [31:0] buf46;
    wire signed [31:0] buf47;
    wire signed [31:0] buf48;

    reg signed [63:0] out;

    always_ff@(posedge new_sample)  begin
        buf0 <= sample;
        buf1 <= buf0;
        buf2 <= buf1;
        buf3 <= buf2;
        buf4 <= buf3;
        buf5 <= buf4;
        buf6 <= buf5;
        buf7 <= buf6;
        buf8 <= buf7;
        buf9 <= buf8;
        buf10 <= buf9;
        buf11 <= buf10;
        buf12 <= buf11;
        buf13 <= buf12;
        buf14 <= buf13;
        buf15 <= buf14;
        buf16 <= buf15;
        buf17 <= buf16;
        buf18 <= buf17;
        buf19 <= buf18;
        buf20 <= buf19;
        buf21 <= buf20;
        buf22 <= buf21;
        buf23 <= buf22;
        buf24 <= buf23;
        buf25 <= buf24;
        buf26 <= buf25;
        buf27 <= buf26;
        buf28 <= buf27;
        buf29 <= buf28;
        buf30 <= buf29;
        buf31 <= buf30;
        buf32 <= buf31;
        buf33 <= buf32;
        buf34 <= buf33;
        buf35 <= buf34;
        buf36 <= buf35;
        buf37 <= buf36;
        buf38 <= buf37;
        buf39 <= buf38;
        buf40 <= buf39;
        buf41 <= buf40;
        buf42 <= buf41;
        buf43 <= buf42;
        buf44 <= buf43;
        buf45 <= buf44;
        buf46 <= buf45;
        buf47 <= buf46;
        buf48 <= buf47; 
    end


    always @ (posedge clk) begin
        acc0 <= 19 * buf0;
        acc1 <= 30 * buf1;
        acc2 <= -10 * buf2;
        acc3 <= -29 * buf3;
        acc4 <= 13 * buf4;
        acc5 <= 0 * buf5;
        acc6 <= -38 * buf6;
        acc7 <= 16 * buf7;
        acc8 <= 18 * buf8;
        acc9 <= -55 * buf9;
        acc10 <= 12 * buf10;
        acc11 <= 47 * buf11;
        acc12 <= -73 * buf12;
        acc13 <= -4 * buf13;
        acc14 <= 91 * buf14;
        acc15 <= -92 * buf15;
        acc16 <= -45 * buf16;
        acc17 <= 162 * buf17;
        acc18 <= -108 * buf18;
        acc19 <= -138 * buf19;
        acc20 <= 308 * buf20;
        acc21 <= -118 * buf21;
        acc22 <= -493 * buf22;
        acc23 <= 1179 * buf23;
        acc24 <= 2609 * buf24;
        acc25 <= 1179 * buf25;
        acc26 <= -493 * buf26;
        acc27 <= -118 * buf27;
        acc28 <= 308 * buf28;
        acc29 <= -138 * buf29;
        acc30 <= -108 * buf30;
        acc31 <= 162 * buf31;
        acc32 <= -45 * buf32;
        acc33 <= -92 * buf33;
        acc34 <= 91 * buf34;
        acc35 <= -4 * buf35;
        acc36 <= -73 * buf36;
        acc37 <= 47 * buf37;
        acc38 <= 12 * buf38;
        acc39 <= -55 * buf39;
        acc40 <= 18 * buf40;
        acc41 <= 16 * buf41;
        acc42 <= -38 * buf42;
        acc43 <= 0 * buf43;
        acc44 <= 13 * buf44;
        acc45 <= -29 * buf45;
        acc46 <= -10 * buf46;
        acc47 <= 30 * buf47;
        acc48 <= 19 * buf48;
    end

    always @ (posedge clk) begin
        out <= acc0 + acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7 + acc8 + acc9 + acc10 + acc11 + acc12 + acc13 + acc14 + acc15 + acc16 + acc17 + acc18 + acc19 + acc20 + acc21 + acc22 + acc23 + acc24 + acc25 + acc26 + acc27 + acc28 + acc29 + acc30 + acc31 + acc32 + acc33 + acc34 + acc35 + acc36 + acc37 + acc38 + acc39 + acc40 + acc41 + acc42 + acc43 + acc44 + acc45 + acc46 + acc47 + acc48; 
        out_h <= out[63:32];
        out_l <= out[31:0];
    end
	 
 endmodule