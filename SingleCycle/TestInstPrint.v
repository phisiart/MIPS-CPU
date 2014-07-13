module TestInstPrint(
);
    reg[31:0] addr;
    wire[31:0] data;
    ROM rom(addr, data);

    reg pulse;
    InstPrint print(
        .instruction(data),
        .pulse(pulse)
    );

    initial begin
        pulse = 0;
        for (addr = 32'h00400000; addr <= 32'h00400074; addr = addr + 4) begin
            #1;
            pulse = 1;
            #1;
            pulse = 0;
        end

    end

endmodule