#!/bin/bash
set -e
W=${1:-8}
echo "=== sequential W = $W ==="
rm -rf obj_dir
verilator --binary --timing --trace -Wall -Wno-BLKSEQ \
    --top tb_seq -GW=$W bit_unit_seq.v tb_seq.v -o sim_seq
./obj_dir/sim_seq
python3 check_seq.py $W
