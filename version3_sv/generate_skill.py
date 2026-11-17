import csv

tests = [
    (0, 3, 2),
    (20, 5, 3),
    (40, -3, 2),
    (60, -4, -2),
    (80, 7, -1),
    (100, 0, 12),
    (120, 12, 0),
    (140, 15, 15),
    (160, -8, 7),
    (180, -16, -4)
]

def int_to_bits(val, width):
    if val < 0:
        val = (1 << width) + val
    return [(val >> i) & 1 for i in range(width)]

pwl_data_a = {i: [] for i in range(8)}
pwl_data_b = {i: [] for i in range(8)}

for t, a_val, b_val in tests:
    bits_a = int_to_bits(a_val, 8)
    bits_b = int_to_bits(b_val, 8)
    time_sec = t * 1e-9  
    
    for i in range(8):
        v_a = 1.8 if bits_a[i] == 1 else 0.0
        v_b = 1.8 if bits_b[i] == 1 else 0.0
        pwl_data_a[i].append(f"{time_sec} {v_a}")
        pwl_data_b[i].append(f"{time_sec} {v_b}")

with open("update_sources.il", "w") as f:
    f.write("let((cv inst netName pwlStr)\n")
    f.write("  cv = dbOpenCellViewByType(\"mult\" \"TB_booth_multiplier_8x8\" \"schematic\" \"\" \"w\")\n")
    f.write("  when(cv\n")
    f.write("    foreach(inst cv->instances\n")
    f.write("      when(inst->cellName == \"vsource\"\n")
    f.write("        netName = car(inst->conns)->net->name\n")
    
    for i in range(8):
        str_a = " ".join(pwl_data_a[i])
        f.write(f"        when(netName == \"a<{i}>\"\n")
        f.write(f"          dbReplaceProp(inst \"pwl\" \"string\" \"file NULL pwl \\\" 0 0 {str_a} \\\" \"))\n")
        
        str_b = " ".join(pwl_data_b[i])
        f.write(f"        when(netName == \"b<{i}>\"\n")
        f.write(f"          dbReplaceProp(inst \"pwl\" \"string\" \"file NULL pwl \\\" 0 0 {str_b} \\\" \"))\n")
        
    f.write("      )\n")
    f.write("    )\n")
    f.write("    dbSave(cv)\n")
    f.write("    dbClose(cv)\n")
    f.write("    println(\"Successfully updated all vsource PWL waveforms in schematic!\")\n")
    f.write("  )\n")
    f.write(")\n")

print("SKILL script 'update_sources.il' generated successfully!")
