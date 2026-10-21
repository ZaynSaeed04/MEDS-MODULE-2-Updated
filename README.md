# Module 2: SystemVerilog in Digital Systems

This repository contains the lab assignments, RTL implementations, verification testbenches, and design documentation for **Module 2: SystemVerilog in Digital Systems**

The focus of this module is on practical digital logic design, hierarchical structural modeling, and functional verification using **SystemVerilog** and **Verilator**.

---

## 📁 Repository Structure

```text
.
├── Reports/                     # Complete lab documentation and reports (.pdf / .odt)
├── Task1+2/                     # Section 5: Basic Logic Gates & Testbench Flows
├── Task3_Adders/                # Section 6: Half/Full Adders & Structural Modeling
├── Task4_NORGateRealization/    # Section 6: Universal NOR-Only Logic Implementation
├── Task5_4bitParity/            # Section 6: 4-Bit Parity Generator Design
├── Task6_Decoder3x8/            # Section 7: Hierarchical 3-to-8 Decoder
└── Task7_LZC/                   # Section 7: 32-bit Leading Zero Counter (Linear & Tree)
```
---

## 📝 Note
- Each task contains its own `Makefile` to compile and run SystemVerilog modules using `make MOD=<module_name>` (the module can also be configured in the Makefile).
- Check each task's Makefile for the required directory structure and available commands.