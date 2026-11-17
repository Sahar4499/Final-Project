import numpy as np

N = 4

A = np.array([
    [ 1,  2,  3,  4],
    [ 5,  6,  7,  8],
    [ 9, 10, 11, 12],
    [13, 14, 15, 16],
], dtype=np.int64)

B = np.eye(4, dtype=np.int64)  # start easy: Identity

C = A @ B

print("A=\n", A)
print("B=\n", B)
print("C=A@B=\n", C)

print("\nSkewed feed (t=0..2N-2):")
for t in range(2*N - 1):
    A_in = []
    B_in = []
    for i in range(N):
        k = t - i
        A_in.append(int(A[i, k]) if 0 <= k < N else 0)
    for j in range(N):
        k = t - j
        B_in.append(int(B[k, j]) if 0 <= k < N else 0)

    print(f"t={t}: A_in={A_in}  B_in={B_in}")

print("\nExpected stabilization (approx): t_stable(i,j) ≈ (N-1)+i+j+PE_LAT, with PE_LAT=3")
PE_LAT = 3
for i in range(N):
    for j in range(N):
        print(f"C({i},{j}) ~ cycle { (N-1) + i + j + PE_LAT }")
