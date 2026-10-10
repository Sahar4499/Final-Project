# Systolic Array – Hardware Accelerator (VHDL)

This project implements the core building blocks of a **systolic-array-based hardware accelerator**, focusing on the Processing Element (PE), custom multiplier units, and a minimal systolic array prototype.

The design is written in **VHDL** and serves as the foundation for a future physical implementation in **Cadence Virtuoso** as part of a final-year hardware project.

---

## 📂 Project Structure


/rtl
├── mult4x4.vhd # 4×4 partial-product multiplier
├── mult16x16.vhd # 16×16 shift-add multiplier
├── hPE.vhd # Processing Element (MAC + data forwarding)
└── systolic_2x2.vhd # Minimal systolic array (2×2 grid)
/sim
├── TB_mult16x16.vhd # Testbench for 16×16 multiplier
└── TB_hPE.vhd # Testbench for Processing Element


---

## 🔧 System Overview

### **1. Multiplier Units**
- `mult4x4` implements a simple bitwise partial-product generator.  
- `mult16x16` creates a full 16-bit multiplier using shift-and-add logic.  
- These units form the arithmetic core of each PE.

### **2. Processing Element (PE)**
Each PE performs a **MAC operation**:


ACC <= ACC + (A * B)

and forwards inputs to adjacent PEs:

A_out → next PE in the row
B_out → next PE in the column


This is the fundamental building block of any systolic array architecture.

### **3. Systolic 2×2 Array**
A miniature systolic array built from four PEs, demonstrating:

- Wave-like propagation of matrix row/column data  
- Parallel MAC execution  
- Partial-sum accumulation  

This validates the architecture before scaling to larger grids.

---

## 🎯 Project Goals

- Build and verify a fully functional PE module  
- Implement a custom hardware multiplier suitable for ASIC design  
- Construct a systolic array using PE building blocks  
- Prepare the design for backend implementation in Cadence Virtuoso  
- Add structured verification (later using Python/cocotb)

---

## 🚀 Next Steps

- Add pipeline stages inside the PE  
- Scale the systolic array (4×4 / 8×8)  
- Add controller or mini-CPU for feeding matrices  
- Create an automated Python-based verification environment  
- Begin Virtuoso layout for the PE block

---

# 🧰 Git Command Cheat Sheet

### **Initialize project (first time)**

```bash
git init
git remote add origin https://github.com/Sahar4499/Final-Project.git
git branch -M main
git add .
git commit -m "Initial commit"
git push -u origin main


git pull               # Always pull before working
git add .              # Stage all changes
git commit -m "Update RTL"
git push               # Upload changes to GitHub


git status
git remote set-url origin https://github.com/Sahar4499/Final-Project.git
