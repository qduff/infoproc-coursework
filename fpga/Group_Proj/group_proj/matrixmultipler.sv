module Mat_mult(A, B, Result);

    input [31:0] A;
    input [31:0] B;
    output [31:0] Res;
    
    reg [31:0] Result;
    reg [7:0] A1 [0:1][0:1];
    reg [7:0] B1 [0:1][0:1];
    reg [7:0] Res1 [0:1][0:1]; 
    integer i,j,k;

    always@ (A or B)
    begin

        {A1[0][0],A1[0][1],A1[1][0],A1[1][1]} = A;
        {B1[0][0],B1[0][1],B1[1][0],B1[1][1]} = B;
        i = 0;
        j = 0;
        k = 0;
        {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]} = 32'd0; 
 
        for(i=0;i < 2;i=i+1)
            for(j=0;j < 2;j=j+1)
                for(k=0;k < 2;k=k+1)
                    Res1[i][j] = Res1[i][j] + (A1[i][k] * B1[k][j]);
     
        Result = {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]};            
    end 

endmodule