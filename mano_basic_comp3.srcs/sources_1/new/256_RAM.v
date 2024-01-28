
module RAM (CLK,read,AR,write,INDATA,OUTDATA );
    input CLK,read,write;
    input [15:0]INDATA;
    input [11:0] AR;
    output reg [15:0] OUTDATA;
    
    reg [15:0] RAM_4K [4096:0];
        
    initial begin
        $readmemh("E:\Instructions.txt", RAM_4K);
    end
    
    always@* begin
        if (write)
            RAM_4K[AR] <= INDATA;
        else if(read)
            OUTDATA = RAM_4K[AR];
        end

endmodule
