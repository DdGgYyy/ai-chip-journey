#!/bin/bash
set -e
W=${1:-8}
echo "=== W = $W ==="
rm -rf obj_dir results.txt
verilator --binary --timing --trace -Wall --top tb_bit_unit -GW=$W bit_unit.v tb_bit_unit.v -o sim
./obj_dir/sim
python3 ref.py $W
