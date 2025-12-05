

## 📁 Project Overview
## 🧩 Project Overview

This project focuses on the **design, simulation, and implementation of an 8-bit Arithmetic Logic Unit (ALU)** using both **Proteus schematic design** and **Verilog HDL in Xilinx Vivado**.  
The goal was to understand how fundamental digital building blocks integrate to form a complex processing component capable of performing a variety of arithmetic and logical operations.

The development process began with the design of essential combinational circuits such as:
- **8-bit Adder** – for binary addition.  
- **8-bit Subtractor** – for performing binary subtraction using two’s complement logic.  
- **8-bit Multiplier** – for binary multiplication using AND-Add logic.  
- **8-bit Comparator** – for comparing two binary numbers.  
- **8-bit Multiplexer** – for selecting one input from multiple data lines.

Each of these modules was created and simulated in **Proteus** to validate their functional accuracy.  
Once verified, the principles from these individual circuits were combined to construct the **8-bit ALU** — a unified digital system capable of handling multiple operations like **addition, subtraction, multiplication, division, logical AND/OR/XOR**, **comparison**, **modulus**, and **bit shifting**.

The Verilog-based ALU design was then implemented in **Xilinx Vivado**, undergoing **synthesis, implementation, and device-level mapping**.  
The resulting **RTL schematic** and **FPGA placement views** confirmed correct logic synthesis and optimal resource allocation on the target device.

---

### ⚙️ Tools and Technologies Used
- **Proteus Design Suite** – for circuit simulation and schematic verification.  
- **Xilinx Vivado** – for Verilog synthesis, simulation, and FPGA implementation.  
- **Verilog HDL** – for designing the 8-bit ALU module.  
- **Digital Logic Components** – AND, OR, XOR, NOT, Adder, and Multiplexer gates.

---

### 🎯 Objective
To design and implement an **8-bit Arithmetic Logic Unit (ALU)** by integrating core arithmetic and logical modules, simulate its operations, and validate its performance through **FPGA-based implementation** using Vivado.

---

### 🔬 Expected Outcomes
- A verified and simulated 8-bit ALU capable of performing multiple operations.  
- Successful synthesis and hardware mapping of the ALU design on an FPGA device.  
- Comprehensive understanding of digital circuit design flow — from logic gates to HDL implementation.




## ⚙️ 8-Bit Multiplier Circuit

![8-Bit Multiplier Schematic](Screenshot%202025-06-20%20202255.png)

*Figure: 8-bit multiplier schematic implemented in Proteus.*

This schematic represents an **8-bit binary multiplier** designed using basic logic gates.  
It performs the multiplication of two 8-bit binary numbers using **AND gates for partial product generation** and **adders for summing those partial products**.

### 🔍 Working Principle:
1. Each bit of the multiplicand is ANDed with every bit of the multiplier to form partial products.  
2. The partial products are then shifted according to their bit positions.  
3. A series of **full adders and half adders** combine these partial products to produce the final 16-bit output.  
4. The output represents the product of two unsigned 8-bit binary numbers.

### 🧩 Key Features:
- Fully combinational logic design (no clock or sequential logic).  
- Optimized for gate-level understanding and hardware implementation.  
- Verified through simulation in Proteus to ensure correct binary multiplication.

- Although this array multiplier works correctly, it is not suitable to embed directly inside a single-cycle ALU.
Array multipliers have a large combinational delay, and placing them inside the ALU would significantly slow down the entire datapath.
That’s why real CPU designs implement multiplication as a separate hardware unit or multi-cycle block, not as part of the main ALU.




## ⚙️ 8-Bit Adder Circuit

![8-Bit Adder Schematic](Screenshot%202025-07-02%20031753.png)

*Figure: 8-bit adder schematic implemented in Proteus.*

This schematic represents an **8-bit binary adder** designed using **full adders** and **logic gates**.  
It performs the arithmetic addition of two 8-bit binary numbers, generating an 8-bit sum and a carry output.

### 🔍 Working Principle:
1. Each pair of corresponding bits from the two inputs is added using a **full adder circuit**.  
2. The **carry output** from each stage is propagated to the next higher bit.  
3. The final carry output represents the overflow (if any) of the addition process.  
4. The resulting 8-bit output is displayed as the sum of the two binary inputs.

### 🧩 Key Features:
- Fully combinational logic — no clock signal required.  
- Designed using **cascaded full adders** for accurate carry propagation.  
- Verified through Proteus simulation to ensure correct arithmetic behavior.  
- Can be used as a building block for larger arithmetic circuits like **adders/subtractors** or **ALUs**.




![8-Bit Subtractor Schematic](Screenshot%202025-07-02%20031841.png)

*Figure: 8-bit subtractor schematic implemented in Proteus.*

This schematic represents an **8-bit binary subtractor** built using **full adders** and **logic gates**.  
It performs subtraction between two 8-bit binary numbers using the **2’s complement method**, which allows subtraction to be achieved using addition logic.

### 🔍 Working Principle:
1. The second operand (subtrahend) is converted into its **2’s complement** form using inverters and an initial carry input of `1`.  
2. The resulting complemented value is **added** to the first operand (minuend) using a series of full adders.  
3. The final sum represents the subtraction result, while the carry output can indicate **overflow** or **borrow**.  
4. This configuration allows both **positive and negative results** to be represented correctly in binary.

### 🧩 Key Features:
- Implemented entirely using combinational logic (no clock needed).  
- Uses **full adder blocks** with inverted inputs to achieve subtraction.  
- Supports both signed and unsigned 8-bit binary subtraction.  
- Verified through Proteus simulation to confirm accurate bitwise operation.  
- Can serve as a foundation for designing **ALUs (Arithmetic Logic Units)** or **arithmetic processors**.



## ⚙️ 8-Bit Comparator Circuit

![8-Bit Comparator Schematic](Screenshot%202025-07-04%20145433.png)

*Figure: 8-bit comparator schematic implemented in Proteus.*

This schematic represents an **8-bit magnitude comparator** built using **logic gates**.  
The circuit compares two 8-bit binary numbers and produces three outputs indicating whether one number is **greater than**, **less than**, or **equal to** the other.

### 🔍 Working Principle:
1. Each bit of the two 8-bit inputs is compared starting from the most significant bit (MSB) down to the least significant bit (LSB).  
2. Logic gates are used to determine three possible conditions:  
   - **A > B**  
   - **A = B**  
   - **A < B**  
3. The comparison is performed hierarchically — if higher-order bits differ, lower bits are ignored.  
4. The final output consists of three indicator signals showing the relationship between the two binary inputs.

### 🧩 Key Features:
- Fully combinational design using logic gates (no clock required).  
- Compares two 8-bit unsigned binary values simultaneously.  
- Produces three distinct outputs: **Greater**, **Equal**, and **Less**.  
- Verified through Proteus simulation for correct logical operation.  
- Useful as a core block in **ALUs**, **sorting units**, and **digital decision systems**.



## ⚙️ 8-Bit Multiplexer Circuit

![8-Bit Multiplexer Schematic](Screenshot%202025-07-06%20224526.png)

*Figure: 8-bit multiplexer schematic implemented in Proteus.*

This schematic represents an **8-bit 8:1 Multiplexer (MUX)** designed using **AND, OR, and NOT gates**.  
The circuit selects one of the eight input data lines and forwards it to a single output line based on the selection inputs.

### 🔍 Working Principle:
1. The multiplexer has **8 input lines (D0–D7)**, **3 selection lines (S0–S2)**, and **one output (Y)**.  
2. Depending on the binary combination of the selection lines, one of the eight inputs is routed to the output.  
3. The **NOT gates** generate the complement of the selection lines, ensuring all possible selection combinations are handled.  
4. **AND gates** enable the input corresponding to the selected address line, while the **OR gate** combines these outputs into a single line.

### 🧩 Key Features:
- Implements an **8:1 selection mechanism** using basic logic gates.  
- Fully combinational design with no clock or sequential logic.  
- Verified through Proteus simulation for correct selection of inputs.  
- Useful in data routing, control systems, and digital signal selection.  
- Can be extended to larger multiplexers (e.g., 16:1 or 32:1) by cascading multiple 8:1 units.



## ⚙️ 8-Bit Arithmetic Logic Unit (ALU)

![8-Bit ALU Schematic](Screenshot%202025-10-21%20130806.png)

*Figure: RTL schematic of 8-bit ALU generated in Vivado.*

This schematic represents the **8-bit Arithmetic Logic Unit (ALU)** designed and synthesized in **Verilog HDL** using **Xilinx Vivado**.  
The ALU performs a wide range of arithmetic and logical operations and produces corresponding status flags such as **zero**, **negative**, **carry**, and **overflow**.



### 🔍 Working Principle:
1. The ALU takes two 8-bit inputs `A` and `B` and a 4-bit select signal `S` to determine the operation to be executed.  
2. Depending on the value of `S`, it performs one of several operations, including **addition**, **subtraction**, **multiplication**, **division**, **bitwise operations**, **comparisons**, and **shifts**.  
3. The 16-bit output `o` stores the result, while multiple **status flags** indicate the condition of the result.  

---

### 🧮 Supported Operations

| Operation | Select Code (`S`) | Description |
|------------|------------------|--------------|
| ADD | 0000 | Performs addition (`A + B`) |
| SUB | 0001 | Performs subtraction (`A - B`) |
| MULT | 0010 | Multiplies the two 8-bit inputs |
| AND | 0011 | Bitwise AND |
| OR | 0100 | Bitwise OR |
| XOR | 0101 | Bitwise XOR |
| MOD | 0110 | Computes modulus (`A % B`) |
| SHL | 0111 | Shifts bits of A left by 1 |
| SHR | 1000 | Shifts bits of A right by 1 |
| DIV | 1001 | Performs integer division (`A / B`) |
| EQ | 1010 | Checks if A == B |
| LT | 1011 | Checks if A < B |
| GT | 1100 | Checks if A > B |



### ⚡ Status Flags
| Flag | Description |
|------|--------------|
| **Zero** | Set if the result is `0` |
| **Negative** | Set if the result’s MSB is `1` |
| **Carry** | Indicates overflow from addition |
| **Overflow** | Indicates signed arithmetic overflow |
| **Parity** | Set if result has even number of 1s |



### 🧩 Key Features:
- Performs **12 distinct arithmetic and logical operations**.  
- Generates multiple condition flags for advanced computation.  
- Fully combinational design — no clock signal required.  
- Implemented and verified on **Xilinx Vivado** with correct RTL schematic generation.  
- Can serve as the computational core for simple CPUs or microcontrollers.





## ⚙️ 8-Bit ALU Vivado Implementation

![8-Bit ALU Implementation](Screenshot%202025-10-28%20224858.png)

*Figure: Post-synthesis implementation of the 8-bit ALU in Vivado.*

This image shows the **hardware implementation view** of the **8-bit Arithmetic Logic Unit (ALU)** generated after synthesis and implementation in **Xilinx Vivado**.  
It visually represents how logic gates, adders, multiplexers, and combinational units are mapped and interconnected on the FPGA fabric.

---

### 🔍 Implementation Details:
1. The ALU Verilog code was synthesized successfully using the **Xilinx Vivado Design Suite**.  
2. The tool automatically optimized the design, assigning logic resources for arithmetic and logical operations such as **addition**, **subtraction**, **multiplication**, **shifts**, and **comparisons**.  
3. The green lines represent internal **net connections** between the logic blocks and signal paths.  
4. Each block corresponds to functional modules like **adders, comparators, multiplexers, and flag generators** used in the design.

---

### 🧩 Key Features:
- **Fully combinational** design implemented using LUTs and routing logic.  
- Each operation (ADD, SUB, MULT, etc.) is represented as a distinct module mapped to FPGA resources.  
- Generated schematic confirms proper **interconnection and data flow** across all 12 operations of the ALU.  
- Verified for correct logic synthesis, placement, and routing during implementation.  
- Demonstrates the **hardware-level realization** of a Verilog-based ALU design.

---

### ⚙️ Implementation Summary:
- **Tool Used:** Xilinx Vivado  
- **Design Type:** Combinational  
- **Target Device:** Generic FPGA (configurable for specific boards)  
- **Optimization:** Resource utilization and timing  
- **Outputs Verified:** Zero, Carry, Overflow, Negative, and Parity Flags  






## ⚙️ 8-Bit ALU Device Utilization View (Vivado)

![8-Bit ALU Device View](Screenshot%202025-10-28%20225047.png)

*Figure: Device view showing placement of ALU logic elements on the FPGA after implementation.*

This image illustrates the **FPGA device view** generated after running the implementation phase of the **8-bit Arithmetic Logic Unit (ALU)** in **Xilinx Vivado**.  
It represents how different components of the ALU are physically placed and mapped onto the FPGA’s configurable logic blocks (CLBs).



### 🔍 Explanation:
1. Each colored block (e.g., **X0Y0**, **X1Y1**, etc.) represents a **region of the FPGA fabric** divided into clock regions or slices.  
2. The highlighted portion in **X0Y0** indicates the **placement of active logic elements** corresponding to the ALU.  
3. These logic cells include **lookup tables (LUTs)**, **carry chains**, and **routing resources** used to implement arithmetic and logic operations.  
4. The layout confirms that the design fits efficiently into a small area of the FPGA with optimal resource utilization.



### 🧩 Key Features:
- Displays **physical placement** of the synthesized ALU design on the FPGA chip.  
- Each region color-coded for different **logic partitions** managed by Vivado’s placer tool.  
- Confirms that the design meets **placement and routing** constraints.  
- Demonstrates actual **hardware realization** of Verilog logic at the device level.  
- Useful for analyzing **resource utilization**, **timing**, and **power efficiency**.



### ⚙️ Implementation Summary:
- **Design:** 8-Bit ALU (Arithmetic Logic Unit)  
- **Tool:** Xilinx Vivado  
- **View:** Device Utilization / Placement  
- **Regions Used:** X0Y0 – X1Y2  
- **Logic Elements:** LUTs, multiplexers, and carry units  
- **Purpose:** Verification of proper physical mapping post-synthesis and routing  



> 💡 **Tip:**  
> The device view visually confirms how your HDL design translates into real FPGA hardware, showing logic distribution across slices and ensuring efficient chip area utilization.


## 📝 Conclusion

## 🏁 Conclusion

The complete series of designs — from basic combinational circuits to the fully functional **8-bit Arithmetic Logic Unit (ALU)** — demonstrates a comprehensive understanding of digital system design using both **schematic-level** and **HDL-based** approaches.

Starting with elementary building blocks such as the **Adder**, **Subtractor**, **Multiplier**, **Comparator**, and **Multiplexer**, each circuit was carefully designed and simulated in **Proteus** to verify correct logical behavior.  
These fundamental modules formed the conceptual foundation for the final **8-bit ALU**, which integrates multiple arithmetic, logical, and comparison operations within a single Verilog module.

The **ALU design** was implemented and synthesized successfully in **Xilinx Vivado**, producing accurate **RTL**, **implementation**, and **device views**.  
The synthesis confirmed correct mapping of logic elements, efficient utilization of FPGA resources, and functional integrity of all operations.  
The flags for **zero**, **carry**, **negative**, **overflow**, and **parity** were generated correctly, validating the design’s completeness and correctness.

Through this project:
- Each digital module was verified both **theoretically and through simulation**.  
- The final ALU implementation reflected **real hardware behavior**, confirming the translation of Verilog code into physical FPGA logic.  
- The workflow covered all major stages of digital design — **schematic creation**, **HDL coding**, **simulation**, **synthesis**, **implementation**, and **device analysis**.

### ✅ Key Takeaways
- Gained strong practical knowledge of **combinational circuit design** and **HDL synthesis**.  
- Understood how simple logic modules combine to form complex systems like an ALU.  
- Learned FPGA resource mapping and device-level visualization in **Vivado**.  
- Successfully demonstrated a complete **end-to-end hardware design pipeline** from logic concept to FPGA realization.



> 💡 **Final Remark:**  
> This project bridges the gap between theoretical digital electronics and real-world hardware design — proving how fundamental logic operations evolve into a powerful computational unit at the core of modern processors.


## 👨‍💻 Author

**Shlok Mahajan**  
🎓 B.Tech — Automation & Robotics
📍 Nashik, India  
📅 2025  

---

> 💡 **Note:**  
> All images are stored in the project’s main directory.  
> The filenames contain spaces, so they are encoded using `%20` in Markdown (as shown above).
