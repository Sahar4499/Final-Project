#!/usr/bin/env bash
set -euo pipefail

# --- paths ---
ROOT="$(pwd)"
BUILD="$ROOT/build"
LIBREL="$ROOT/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib"

# --- clean ---
rm -rf "$BUILD" bulid work-obj08.cf
mkdir -p "$BUILD"

echo "[1/6] Ensure Nangate45 liberty exists..."
if [ ! -f "$LIBREL" ]; then
  echo "  OpenROAD-flow-scripts not found here -> cloning..."
  rm -rf OpenROAD-flow-scripts
  git clone --depth 1 https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
fi
test -f "$LIBREL"
echo "  OK: $LIBREL"

echo "[2/6] Analyze VHDL (order matters)..."
ghdl -a --std=08 mult16x16.vhd
ghdl -a --std=08 hPE.vhd
ghdl -a --std=08 systolic_4x4.vhd
ghdl -e --std=08 systolic_4x4

echo "[3/6] Export VERILOG from VHDL (auto-try supported commands)..."
OUTV="$BUILD/systolic_4x4_from_vhdl.v"
rm -f "$OUTV"

try_cmd () {
  local cmd="$1"
  echo "  trying: $cmd"
  if bash -lc "$cmd" > "$OUTV" 2> "$BUILD/ghdl_synth.log"; then
    if head -n 5 "$OUTV" | grep -qi "module"; then
      echo "  OK: Verilog detected."
      return 0
    fi
  fi
  rm -f "$OUTV"
  return 1
}

# Try common GHDL synth variants (depends on build)
try_cmd "ghdl synth --std=08 --out=verilog systolic_4x4" || \
try_cmd "ghdl synth --std=08 -o - systolic_4x4 --out=verilog" || \
try_cmd "ghdl --synth --std=08 --out=verilog systolic_4x4" || \
try_cmd "ghdl --synth --std=08 -fverilog systolic_4x4" || \
( echo "ERROR: Could not generate Verilog from GHDL on this install."
  echo "See log: $BUILD/ghdl_synth.log"
  echo "First lines of produced output (if any):"
  [ -f "$OUTV" ] && head -n 20 "$OUTV" || true
  exit 1
)

echo "[4/6] Create Yosys script for Nangate45 mapping..."
cat > "$BUILD/synth_systolic.ys" <<YS
read_verilog $OUTV
hierarchy -check -top systolic_4x4
proc; opt; fsm; opt; techmap; opt
abc -liberty $LIBREL
clean
write_verilog -noattr $BUILD/systolic_4x4_synth.v
stat
YS

echo "[5/6] Run Yosys (mapping to Nangate45)..."
yosys "$BUILD/synth_systolic.ys"

echo "[6/6] Verify output netlist..."
test -f "$BUILD/systolic_4x4_synth.v"
echo "  OK: $BUILD/systolic_4x4_synth.v"
echo "  Sample mapped cells:"
grep -E "NAND|NOR|INV|DFF|AOI|OAI|XOR|XNOR|MUX" -n "$BUILD/systolic_4x4_synth.v" | head -n 20 || true
