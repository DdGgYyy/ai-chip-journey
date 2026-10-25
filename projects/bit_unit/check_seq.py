import sys

W = int(sys.argv[1]) if len(sys.argv) > 1 else 8
M, H = (1 << W) - 1, W // 2
HM = (1 << H) - 1

def rev(x):
    r = 0
    for i in range(W):
        r = (r << 1) | ((x >> i) & 1)
    return r

def ref(a, sel):
    if sel == 0: return rev(a)
    if sel == 1: return ((a & HM) << H) | (a >> H)
    if sel == 2: return ((a << 1) | (a >> (W - 1))) & M
    return ((a & HM) << H) | (a & HM)

bad, total, prev_y, nvalid = 0, 0, None, 0
with open("results_seq.txt") as f:
    for line in f:
        p = line.split()
        if len(p) != 5:
            continue
        cyc, a, sel, y, valid = map(int, p)
        total += 1
        if valid == 1:
            nvalid += 1
            if y != ref(a, sel):
                bad += 1
                if bad <= 10:
                    print(f"BAD  cyc={cyc} a={a:0{W}b} sel={sel} got={y:0{W}b} exp={ref(a,sel):0{W}b}")
        else:
            if prev_y is not None and y != prev_y:
                bad += 1
                if bad <= 10:
                    print(f"BAD  cyc={cyc} valid=0 但 y 变了: {prev_y:0{W}b} -> {y:0{W}b}")
        prev_y = y

print(f"\n{total} cycles, {nvalid} valid, {bad} bad")
sys.exit(0 if bad == 0 else 1)
