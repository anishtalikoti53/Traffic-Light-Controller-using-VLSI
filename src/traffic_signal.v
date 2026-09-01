`timescale 1ns / 1ps
`define TRUE 1'b1
`define FALSE 1'b0
`define Y2RDELAY 3
`define R2GDELAY 2

module traffic_signal(hwy, entry, X, clear, clock);
input X, clock, clear;
output reg [1:0] hwy, entry;

parameter RED = 2'b00,
          YELLOW = 2'b01,
          GREEN = 2'b10;

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

reg [2:0] state, next_state;

always @(posedge clock)
begin
    if (clear)
        state <= S0;
    else
        state <= next_state;
end

always @(*)
begin
    hwy = GREEN;
    entry = RED;

    case (state)
        S0: ;
        S1: hwy = YELLOW;
        S2: hwy = RED;
        S3: begin
            hwy = RED;
            entry = GREEN;
        end
        S4: begin
            hwy = RED;
            entry = YELLOW;
        end
    endcase
end

// Next-state logic
always @(*)
begin
    case (state)
        S0: if (X) next_state = S1; else next_state = S0;

        S1: next_state = S2;
        S2: next_state = S3;
        S3: if (X) next_state = S3; else next_state = S4;
        S4: next_state = S0;
        default: next_state = S0;
    endcase
end
endmodule
