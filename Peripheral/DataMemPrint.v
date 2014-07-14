module DataMemPrint(
    input wire [31:0]addr,
    input wire signed [31:0]wdata,
    input wire signed [31:0]rdata,
    input wire read,
    input wire write,
    input wire pulse
);
    always @(posedge pulse) begin
        $display("  -----------------");
        $display("  DataMem operation");
        $display("  -----------------");
        if (read) begin
            $display("    read addr = 0x%08H", addr);
            $display("         data = 0x%08H, int(%d)", rdata, rdata);
        end
        if (write) begin
            $display("    write addr = 0x%08H", addr);
            $display("          data = 0x%08H, int(%d)", wdata, wdata);
        end
        $display("");
    end
endmodule