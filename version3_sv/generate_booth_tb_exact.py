filename = "booth_multiplier_vectors.csv"
VDD = 1.0
STEP = 20.0
RISE = 0.01

tests = [
    (3, 2),       # Test 1:  3 * 2
    (5, 3),       # Test 2:  5 * 3
    (-3, 2),      # Test 3: -3 * 2
    (-4, -2),     # Test 4: -4 * -2
    (7, -1),      # Test 5:  7 * -1
    (0, 12),      # Test 6:  0 * 12
    (12, 0),      # Test 7: 12 * 0
    (15, 15),     # Test 8: 15 * 15
    (-8, 7),      # Test 9: -8 * 7
    (-16, -4)     # Test 10: -16 * -4
]

def int_to_8bit_twos_comp(val):
    val = int(val)
    if val < 0:
        val = (1 << 8) + val
    return [(val >> i) & 1 for i in range(8)]

# מיפוי LSB -> MSB בדיוק לפי הסכמה
inst_a = ["V14", "V12", "V10", "V8", "V6", "V4", "V2", "V0"] 
inst_b = ["V15", "V13", "V11", "V9", "V7", "V5", "V3", "V1"] 

a_bits_history = {i: [] for i in range(8)}
b_bits_history = {i: [] for i in range(8)}

for a_val, b_val in tests:
    a_bits = int_to_8bit_twos_comp(a_val)
    b_bits = int_to_8bit_twos_comp(b_val)
    for i in range(8):
        a_bits_history[i].append(a_bits[i])
        b_bits_history[i].append(b_bits[i])

def get_pwl_string(bit_sequence):
    points = []
    for step, bit in enumerate(bit_sequence):
        v = VDD if bit == 1 else 0.0
        t_start = step * STEP
        t_end = (step + 1) * STEP
        t_s = t_start + RISE if step > 0 else t_start
        points.extend([f"{t_s}n", str(v), f"{t_end}n", str(v)])
    return ", ".join(points)

with open(filename, 'w') as f:
    for i in range(8):
        f.write(f"{inst_a[i]}, {get_pwl_string(a_bits_history[i])}\n")
    for i in range(8):
        f.write(f"{inst_b[i]}, {get_pwl_string(b_bits_history[i])}\n")

print("CSV generated successfully!")
