
module RAM_256(CLK,read,write,INDATA,OUTDATA );
    input CLK,read,write;
    input [15:0]INDATA;
    output reg [15:0] OUTDATA;
         reg [15:0] RAM_4K [4096:0];
        RAM_Control MEMlink (write,read);
        
        initial
            begin
                $readmemh("D:/Documents/UNI/projectbasiccomp/ram_256.txt", RAM_256);
            end
    
        always@ (posedge CLK)
            begin
            if (write)
                RAM_4K[0] <= INDATA;
            else if(read)
                OUTDATA = RAM_4K[0];
            end

endmodule
