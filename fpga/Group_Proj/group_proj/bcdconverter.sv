module bcdconverter #(
    input[19:0] score,
    output[23:0] bcdout

);

    reg[3:0] ht, tt, th, h, t, u;
    reg[16:0] tmpreg;

    always @* begin

        ht = score / 100000;
        tmpreg = score % 100000;
        tt = tmpreg / 10000;
        tmpreg = tmpreg % 10000;
        th = tmpreg / 1000;
        tmpreg = tmpreg % 1000;
        h = tmpreg / 100;
        tmpreg = tmpreg % 100;
        t = tmpreg / 10;
        u = tmpreg % 10;

    end

    assign bcdout = {ht, tt, th, h, t, u};

endmodule