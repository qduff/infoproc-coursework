module top #(

    input logic [19:0]          score,
    input logic                 clk,
    input logic                 rst,

    output logic [6:0]          D0;
    output logic [6:0]          D1;
    output logic [6:0]          D2;
    output logic [6:0]          D3;
    output logic [6:0]          D4;
    output logic [6:0]          D5;

)

    logic [23:0]                bcdouttmp;

bcdconverter converter(

    .score      (score),
    .bcdout     (bcdouttmp)

);

segmentdecoder hundredthousand(

    .bcd(bcdouttmp[23:20]),
    .seg(D5)

);

segmentdecoder tenthousand(

    .bcd(bcdouttmp[19:16]),
    .seg(D4)

);

segmentdecoder thousand(

    .bcd(bcdouttmp[15:12]),
    .seg(D3)

);

segmentdecoder hundred(

    .bcd(bcdouttmp[11:8]),
    .seg(D2)

);

segmentdecoder ten(

    .bcd(bcdouttmp[7:4]),
    .seg(D1)

);

segmentdecoder unit(

    .bcd(bcdouttmp[3:0]),
    .seg(D0)

);






endmodule