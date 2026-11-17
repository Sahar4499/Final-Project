# Systolic Array Project (VHDL) — Timing & Latency Notes

This document summarizes the timing behavior observed/assumed for the current implementation:
- **Pipelined PE (hPE)** performing MAC: `ACC <= ACC + (A * B)`
- **Systolic arrays** built from the PE: `2x2` and `4x4`
- **Skewed (diagonal) input feeding** to ensure correct alignment of operands across the array

---

## 1) PE Latency (hPE)

### Pipeline stages (conceptual)
The PE is implemented as a pipelined MAC with the following stages:
1. **Register inputs** (`A_reg`, `B_reg`)
2. **Multiply + register product** (`mult_reg`)
3. **Accumulate** (`ACC <= ACC + mult_reg`)

### Result
- **PE latency (from operand arrival at PE input pins to contribution being added into ACC):**
  - **3 clock cycles**

> In practice, this means the PE needs extra "flush" cycles (feeding zeros) after the last real operands, so the last products can propagate through the pipeline and be accumulated.

---

## 2) Latency of `systolic_2x2`

### Feeding model
To get correct behavior in a 2D systolic array, inputs are **skewed**:
- `A(i,k)` is injected at time **t = k + i**
- `B(k,j)` is injected at time **t = k + j**

So operands meet at PE(i,j) at:
- **t = k + i + j**

For `N=2`, the *injection phase* spans:
- `t = 0 .. 2N-2 = 2`

### When do outputs stabilize?
Each `C(i,j)` is the sum over `k = 0..N-1` (two MAC terms for 2x2).

For a given PE(i,j), the **last term** corresponds to `k = N-1`, so the last operand meeting time is:
- `t_last_meet(i,j) = (N-1) + i + j`

Then you add the **PE pipeline latency** `L_PE = 3` to get the approximate stabilization time:
- **t_stable(i,j) ≈ t_last_meet(i,j) + L_PE**
- **t_stable(i,j) ≈ (N-1) + i + j + 3**

### For 2x2 (N=2)
- `t_stable(i,j) ≈ 1 + i + j + 3 = i + j + 4`

So:
- **C(0,0)** stabilizes at ~ **cycle 4**
- **C(0,1)** stabilizes at ~ **cycle 5**
- **C(1,0)** stabilizes at ~ **cycle 5**
- **C(1,1)** stabilizes at ~ **cycle 6**

### Array-level latency (2x2)
The full matrix result is stable when the slowest cell is stable:
- **latency(systolic_2x2) ≈ 6 cycles** (until C11 is stable)

---

## 3) Latency of `systolic_4x4`

Same model, with `N=4`.

### Stabilization rule (general)
- `t_stable(i,j) ≈ (N-1) + i + j + L_PE`
- with `L_PE = 3`

### For 4x4 (N=4)
- `t_stable(i,j) ≈ 3 + i + j + 3 = i + j + 6`

Examples:
- **C(0,0)** ~ cycle **6**
- **C(0,3)** ~ cycle **9**
- **C(3,0)** ~ cycle **9**
- **C(3,3)** ~ cycle **12**

### Array-level latency (4x4)
The full matrix is stable when the slowest cell (bottom-right) is stable:
- **latency(systolic_4x4) ≈ 12 cycles** (until C33 is stable)

---

## 4) When does `C(i,j)` stabilize? (General formula)

Let:
- `N` = array size (N x N)
- `L_PE` = PE pipeline latency (here **3**)

### Using skewed/diagonal feeding
- Operand meeting time for term `k` at PE(i,j): `t = k + i + j`
- Last term uses `k = N-1`

Therefore:
- **t_stable(i,j) ≈ (N-1) + i + j + L_PE**

With `L_PE = 3`:
- **t_stable(i,j) ≈ (N-1) + i + j + 3**

---

## Quick Summary

- **PE latency:** `L_PE = 3 cycles`
- **systolic_2x2 latency (full result):** ~ `6 cycles`
- **systolic_4x4 latency (full result):** ~ `12 cycles`
- **Stabilization time per cell:**
  - `t_stable(i,j) ≈ (N-1) + i + j + 3`

---

## Notes
- These timing values assume:
  - `EN=1` during computation
  - Skewed (diagonal) feeding
  - Adequate flush cycles after the last injection
- Exact cycle numbers may shift by ±1 depending on how reset/enable are applied relative to the first active clock edge.
