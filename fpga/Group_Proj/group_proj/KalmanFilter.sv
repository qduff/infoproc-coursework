enum {STAGE_1, STAGE_2, STAGE_3, NUM_STAGES} e_stages;

parameter NO_RESET = 1'b1;

module KalmanFilter(
    input           new_data_available,

    input [31:0]    new_accel,
    input [31:0]    new_rate,
    input [31:0]    dt,
    input clk,
    input reset,

)


//STAGE_1
SUB rate_STAGE_1(
    .clk(clk),
    .areset(reset),
    .a(new_rate),
    .b(bias[STAGE_1]),
    .q(rate[STAGE_1])
)
reg [31:0]dangle;
MULT dangle_STAGE_1(
    .clk(clk),
    .areset(reset),
    .a(dt),
    .b(rate[STAGE_1])
    .q(dangle)
)

ADD angle_STAGE_1(
    .clk(clk),
    .areset(reset),
    .a(dangle),
    .b(angle[STAGE_1]),
    .q(angle[STAGE_2])
)



reg [3:0] state

reg[31:0] rate[NUM_STAGES]
reg[31:0] bias[NUM_STAGES];
reg[31:0] angle[NUM_STAGES];

always @* begin


always_ff @(posedge new_data_available) begin
    state = STAGE_1;

always_ff @(posedge state[0] or negedge state[0] or posedge state[1] or negedge state[1]){
    case(state)
        STAGE_1: begin

}

