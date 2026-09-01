`timescale 1ns / 1ps

module tb_traffic_signal;

reg clock, clear, X;
wire [1:0] hwy, entry;

// Instantiate DUT
traffic_signal uut (
    .hwy(hwy),
    .entry(entry),
    .X(X),
    .clear(clear),
    .clock(clock)
);

// Clock generation
always #5 clock = ~clock;   // 10 ns clock period

initial
begin
    $dumpfile("traffic_signal.vcd");  // for waveform if using GTKWave
    $dumpvars(0, tb_traffic_signal);
end

initial
begin
    clock = 0;
    clear = 1;
    X = 0;

    // Reset active
    #20 clear = 0;

    // No car on entry road
    #30 X = 0;

    // Car arrives at entry road
    #40 X = 1;

    // Car stays waiting
    #60 X = 1;

    // Car leaves
    #50 X = 0;

    // Another car after some time
    #80 X = 1;

    // Finish simulation
    #200 $finish;
end

endmodule
