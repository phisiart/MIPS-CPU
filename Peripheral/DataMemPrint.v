module DataMemPrint(
    input wire [31:0]addr,
    input wire [31:0]wdata,
    input wire [31:0]rdata,
    input wire read,
    input wire write,
    input wire pulse
);
    always @(posedge pulse) begin
        $display("DataMem operation");
        $display("-----------------");
        if (read) begin
            $display("read addr = %8x data = %8x (%d)", addr, rdata, rdata);
        end
        if (write) begin
            $display("write addr = %8x data = %8x (%d)", addr, wdata, rdata);
        end
    end
endmodule