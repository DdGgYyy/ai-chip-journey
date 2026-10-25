import sys

W = int(sys.argv[1]) if len(sys.argv) > 1 else 8
M = (1 << W) - 1
H = W // 2
HM = (1 << H) - 1

def rev(x):
    r = 0
    for i in range(W):
        r = (r << 1) | ((x >> i) & 1)
    return r

def ref(a, sel):
    if sel == 0:
        return rev(a)
    if sel == 1:                     # 高低半区交换
        return ((a & HM) << H) | (a >> H)
    if sel == 2:                     # 循环左移 1
        return ((a << 1) | (a >> (W - 1))) & M
    return ((a & HM) << H) | (a & HM)  # 低半区复制到高半区

bad, total = 0, 0
with open("results.txt") as f:
    for line in f:
        p = line.split()
        if len(p) != 3:
            continue
        a, sel, y = map(int, p)
        exp = ref(a, sel)
        total += 1
        if y != exp:
            bad += 1
            if bad <= 10:
                print(f"MISMATCH a={a:0{W}b} sel={sel} got={y:0{W}b} expected={exp:0{W}b}")

print(f"\n{total} cases, {bad} mismatch")
sys.exit(0 if bad == 0 else 1)
