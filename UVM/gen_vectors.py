import numpy as np
from pathlib import Path

N = 4
OUT_DIR = Path("VECTORS")
OUT_DIR.mkdir(exist_ok=True)

# Choose mode: "identity", "fixed", "random"
MODE = "fixed"
SEED = 7

rng = np.random.default_rng(SEED)

if MODE == "identity":
    A = np.array([
        [ 1,  2,  3,  4],
        [ 5,  6,  7,  8],
        [ 9, 10, 11, 12],
        [13, 14, 15, 16],
    ], dtype=np.int64)
    B = np.eye(N, dtype=np.int64)

elif MODE == "fixed":
    A = np.array([
        [1, 2, 0, 1],
        [0, 1, 3, 2],
        [2, 1, 1, 0],
        [1, 0, 2, 1],
    ], dtype=np.int64)

    B = np.array([
        [1, 0, 2, 1],
        [2, 1, 0, 0],
        [0, 1, 1, 2],
        [1, 0, 0, 1],
    ], dtype=np.int64)

elif MODE == "random":
    # keep values small to avoid overflow in 16-bit input and 32-bit accumulation
    A = rng.integers(low=0, high=8, size=(N, N), dtype=np.int64)
    B = rng.integers(low=0, high=8, size=(N, N), dtype=np.int64)

else:
    raise ValueError("Unknown MODE")

C = A @ B

def to_hex16(x: int) -> str:
    return f"{x & 0xFFFF:04X}"

def to_hex32(x: int) -> str:
    return f"{x & 0xFFFFFFFF:08X}"

# Write A, B as 16 lines each (row-major). Each line is HEX16.
with open(OUT_DIR / "A.mem", "w") as f:
    for r in range(N):
        for c in range(N):
            f.write(to_hex16(int(A[r, c])) + "\n")

with open(OUT_DIR / "B.mem", "w") as f:
    for r in range(N):
        for c in range(N):
            f.write(to_hex16(int(B[r, c])) + "\n")

# Expected C as 16 lines HEX32 row-major
with open(OUT_DIR / "Cexp.mem", "w") as f:
    for r in range(N):
        for c in range(N):
            f.write(to_hex32(int(C[r, c])) + "\n")

print("Generated vectors in ./VECTORS/")
print("A=\n", A)
print("B=\n", B)
print("C=A@B=\n", C)
