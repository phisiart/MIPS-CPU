`timescale 1ns / 1ps
module RegPrint(
    input wire[4:0] addr1,
    input wire[4:0] addr2,
    input wire[4:0] addr3,
    input wire signed[31:0] data1,
    input wire signed[31:0] data2,
    input wire signed[31:0] data3,
    input wire write,
    input wire pulse
);

    always @(posedge pulse) begin
        $display("  -------");
        $display("  RegFile");
        $display("  -------");
        $display("    addr1 = %d", addr1);
        $display("      data1 = 0x%08H, int(%d)", data1, data1);
        $display("    addr2 = %d", addr2);
        $display("      data2 = 0x%08H, int(%d)", data2, data2);
        if (write) begin
            $display("    write addr = %d", addr3);
            $display("          data = 0x%08H, int(%d)", data3, data3);
        end
        $display("");
    end

endmodule
