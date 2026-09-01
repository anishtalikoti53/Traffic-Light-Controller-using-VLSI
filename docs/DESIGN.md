# Design Documentation

## 1. Objective

Design and simulate a digital Traffic Light Controller using Verilog HDL and a synchronous Finite State Machine (FSM).

## 2. Inputs and Outputs

### Inputs

- `clock` — synchronous clock input.
- `clear` — active-high reset/clear input; when asserted, the FSM returns to `S0`.
- `X` — vehicle-detection input for the entry road.

### Outputs

- `hwy[1:0]` — highway traffic-light encoding.
- `entry[1:0]` — entry-road traffic-light encoding.

### Light Encoding

| Signal | Value |
|---|---|
| RED | `2'b00` |
| YELLOW | `2'b01` |
| GREEN | `2'b10` |

## 3. FSM

The supplied RTL contains five states.

| State | Highway | Entry | Next-state behavior |
|---|---|---|---|
| S0 | Green | Red | `X=0` → S0; `X=1` → S1 |
| S1 | Yellow | Red | S2 |
| S2 | Red | Red | S3 |
| S3 | Red | Green | `X=1` → S3; `X=0` → S4 |
| S4 | Red | Yellow | S0 |

### State Flow

```text
              X=1
        +--------------+
        |              v
      +----+         +----+
      | S0 | ------> | S1 |
      +----+         +----+
        ^               |
        |               v
      +----+         +----+
      | S4 | <------ | S2 |
      +----+         +----+
        ^               |
        |               v
        +------------ +----+
                     | S3 |
                     +----+
                       |
                    X=1|  |X=0
                       +  +----> S4
```

## 4. RTL Organization

The module uses three conceptual parts:

1. **State register** — updates `state` on the positive edge of `clock`; `clear` forces `S0`.
2. **Output logic** — decodes the current state into highway and entry light values.
3. **Next-state logic** — determines `next_state` from the current state and `X`.

The design is Moore-style in the sense that the light outputs are decoded from the current FSM state.

## 5. Simulation Workflow

```text
Write RTL
   |
   v
Compile with Icarus Verilog
   |
   v
Run testbench
   |
   v
Generate traffic_signal.vcd
   |
   v
Open VCD with GTKWave
   |
   v
Verify clock, X, clear, hwy and entry
```

Commands:

```bash
iverilog -o traffic_sim src/traffic_signal.v src/tb_traffic_signal.v
vvp traffic_sim
gtkwave traffic_signal.vcd
```

## 6. Testbench Stimulus

The testbench uses a 10 ns clock period (`always #5 clock = ~clock`) and applies the following sequence:

1. Starts with `clear=1`, `X=0`.
2. Releases reset after 20 ns.
3. Keeps the entry-road vehicle input inactive.
4. Applies `X=1` to represent a vehicle arriving.
5. Keeps `X=1` to represent a waiting vehicle.
6. Applies `X=0` to represent the vehicle leaving.
7. Applies another `X=1` event after some time.
8. Ends the simulation after the specified delay.

## 7. Synthesis

The design is written in synthesizable Verilog style and is suitable for an FPGA-oriented synthesis flow. Yosys may be used as an optional open-source synthesis tool. Vivado can be used for simulation and FPGA design workflows.

## 8. Important Source Consistency Note

The academic report supplied for this repository contains different descriptions of the number of FSM states in different sections: the abstract describes three major states, the methodology section describes four states, while the actual supplied Verilog RTL implements **five states (`S0`–`S4`)**. This repository documentation follows the actual RTL implementation rather than silently changing the source code.
