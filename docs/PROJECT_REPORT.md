# Traffic Light Controller using VLSI — Project Report

## Academic Information

**Institution:** BLDEA’s V.P. Dr. P.G. Halakatti College of Engineering and Technology, Vijayapur  
**Department:** Electronics and Communication Engineering  
**University:** Visvesvaraya Technological University (VTU), Belagavi  
**Project:** Traffic Light Controller using VLSI  
**Authors:** Aishwarya Hadimur (2BL23EC008), Patil Soundarya Sanjeev (2BL23EC062)  
**Guide:** Dr. Rajeshwari Patil  
**Academic Year:** 2025–26

## Abstract

Traffic management is a critical requirement in modern urban infrastructure, where efficient control of vehicle movement directly impacts safety and congestion reduction. A Traffic Light Controller (TLC) is one of the most essential components used to regulate vehicular flow at road intersections. This project presents the design and simulation of a simple, fully digital Traffic Light Controller using Verilog Hardware Description Language (HDL). The controller is based on a synchronous Finite State Machine (FSM) architecture, ensuring predictable and reliable state transitions corresponding to Green, Yellow, and Red light intervals.

In this design, the system cycles through three major states—Green, Yellow, and Red—each associated with specific timing intervals controlled by an internal counter. The use of a Moore-type FSM simplifies the output logic by ensuring that the outputs depend exclusively on the current state. A clock-driven state register updates the system state at each clock edge, allowing precise timing control and smooth transitions. The controller is resettable, ensuring safe initialization and recovery from undefined states. The Verilog implementation is kept simple and modular, making it easy to understand for beginners while still demonstrating the practical application of sequential logic, counters, and state machines. Simulation was performed using a Verilog simulator such as ModelSim or Vivado, where the waveform results verified correct state sequencing and timing behavior. This project is highly applicable for real-world embedded traffic systems and serves as a foundational exercise for learners exploring digital design, HDL programming, and FSM-based control systems.

## 1. Introduction

Traffic management is a fundamental requirement for ensuring safety and smooth flow of vehicles in urban and rural environments. As population and vehicle density continue to increase, conventional manually operated traffic systems are becoming inefficient and outdated. A traffic light controller plays a crucial role in regulating the flow of vehicles at road intersections by assigning the right-of-way to different lanes in a controlled and sequential manner.

Traditional traffic control systems have relied on relay logic and electromechanical devices, which are prone to wear and tear, slower operation, and limited flexibility. With advancements in VLSI design and digital electronics, it has become possible to develop more reliable, efficient, and programmable traffic controllers using hardware description languages (HDLs) such as Verilog.

A Verilog-based traffic light controller provides multiple advantages including high speed, accuracy, reliability, and ease of modification. Its operation is based on the principles of a Finite State Machine (FSM), which allows the controller to transition between different traffic states—Red, Yellow, and Green—based on predetermined timing intervals. Such designs are widely used in microcontrollers, FPGA implementations, and digital circuits.

This project focuses on designing and simulating a Traffic Light Controller using Verilog HDL, implementing the timing sequence using clock division and FSM methodology. The design is simulated using open-source tools such as Icarus Verilog and GTKWave, enabling students and researchers to explore VLSI design without the need for commercial tools.

## 2. Literature Review

Research and technical publications have explored traffic light controllers using digital logic, microcontrollers, and programmable devices. FSMs provide structured progression from one state to another, ensuring predictable and deterministic operation. Verilog HDL supports behavioral and structural modeling, timing simulation, and modular development. FPGA implementations provide reprogrammability and parallel processing, while sensor-based systems can dynamically adjust signal timing based on traffic density. Compared with software-oriented microcontroller designs, hardware implementations can execute operations concurrently and respond quickly.

## 3. Basic Components

### 3.1 Verilog HDL

Verilog HDL describes digital circuits at behavioral, RTL, and structural levels and is widely used in ASIC and FPGA design.

### 3.2 Finite State Machine

The FSM is the backbone of the controller. It contains states, state transitions, and output signals representing traffic-light conditions. Traffic lights typically use the Moore model for simple and predictable output decoding.

### 3.3 Clock and Timing

A clock signal synchronizes the controller. The supplied report describes clock division for obtaining human-perceivable delays; however, the supplied RTL source itself does not contain a separate clock-divider module or counter.

### 3.4 LED Indicators

The outputs represent Red (STOP), Yellow (WAIT), and Green (GO) conditions.

### 3.5 Simulation Tools

Simulation tools are used to verify functionality before hardware implementation.

## 4. Software Requirements

- **Icarus Verilog:** Verilog compiler and simulator capable of generating VCD waveform files.
- **GTKWave:** Waveform viewer for inspecting clock, FSM-related signals, and outputs.
- **Yosys:** Optional open-source synthesis suite for generating and optimizing gate-level representations.
- **Operating systems:** Linux/Ubuntu, Windows, or macOS.
- **Text editors:** VS Code, Sublime Text, Notepad++, Vim, or equivalent.

## 5. Methodology

### System Block Diagram

```text
Input Clock → FSM Controller → Output LEDs
```

The supplied report describes a clock-divider stage, but the actual supplied Verilog source contains only the `traffic_signal` module and no separate clock-divider module.

### FSM Design

The actual RTL contains five states:

- **S0:** Highway Green, Entry Red.
- **S1:** Highway Yellow, Entry Red.
- **S2:** Highway Red, Entry Red.
- **S3:** Highway Red, Entry Green.
- **S4:** Highway Red, Entry Yellow.

The state transitions are controlled by `X` and the synchronous `clock`, while `clear` returns the controller to `S0`.

### Simulation Workflow

1. Write the Verilog HDL code.
2. Compile using Icarus Verilog.
3. Generate the VCD waveform.
4. Open the waveform using GTKWave.
5. Verify the output sequence.
6. Validate the observed timing/state behavior.

### Verification Points

- Correct state transitions.
- Correct highway and entry outputs for each state.
- Reset/clear operation.
- No unintended output overlap in the state decode.
- Waveform correctness.

## 6. Advantages and Applications

### Advantages

1. Low cost and efficient hardware structure.
2. Predictable FSM-based operation.
3. Easy modification in Verilog.
4. Low hardware overhead.
5. Scalability toward more complex traffic systems.
6. Fast hardware execution.

### Applications

1. Road intersections.
2. Pedestrian crossings.
3. Highway merging lanes.
4. Multi-lane traffic systems.
5. Smart-city traffic management.
6. Emergency traffic diversion control.
7. Railway crossing signals.
8. Industrial automation gates.

## 7. Results

The supplied report states that the experimental model produced expected results. For the repository implementation, the supplied testbench generates a VCD file named `traffic_signal.vcd` so that the clock, input conditions, and highway/entry outputs can be inspected in GTKWave.

The original report's Results paragraph also contains references to remotely switched home appliances and the Blynk application. Those statements do not correspond to the Traffic Light Controller RTL supplied with this repository, so they are not treated as results of this project here.

## 8. Future Scope

- Sensor-based adaptive traffic control using IR/ultrasonic sensors.
- AI and machine-learning based predictive control.
- IoT connectivity for remote monitoring.
- Emergency vehicle priority.
- Solar-powered traffic controllers.
- CCTV and image-processing based vehicle detection.

## 9. Conclusion

The Verilog-based Traffic Light Controller demonstrates a sequential control system using FSM principles. The design uses clock-synchronized state transitions and state-dependent outputs. The supplied testbench supports simulation and waveform inspection using Icarus Verilog and GTKWave. The project reinforces digital logic, FSM modeling, Verilog HDL, and VLSI design concepts while providing a foundation for future intelligent traffic-control enhancements.

## 10. References

1. Samir Palnitkar, *Verilog HDL: A Guide to Digital Design*.
2. M. Morris Mano, *Digital Design*, Pearson Education.
3. Nazeih M. Botros, *HDL Programming (VHDL & Verilog)*.
4. IEEE Xplore — Traffic Light Controller research articles.
5. Icarus Verilog documentation.
6. GTKWave User Manual.
7. Yosys Open Source Synthesis Suite documentation.
8. FPGA4Student HDL tutorials.
9. TutorialsPoint — Verilog Programming Guide.
10. Open-source VLSI documentation.

## Source Report Note

This Markdown document is a repository-friendly version based on the uploaded academic report. Where the report and the supplied source code differ, the difference is explicitly identified rather than silently altering the project implementation.
