import subprocess
import random

N = 500 
TARGET = "http://192.168.100.1"

count1 = 0
count2 = 0

for _ in range(N):
    port = random.randint(40000, 60000)
    # port = 50000
    try:
        out = subprocess.check_output(
            ["curl", "-s", f"--local-port", str(port), TARGET],
            stderr=subprocess.DEVNULL
        ).decode()
    except:
        continue

    if "SERVER-1" in out:
        count1 += 1
    elif "SERVER-2" in out:
        count2 += 1

print(f"SERVER-1: {count1} ({count1/N*100:.1f}%)")
print(f"SERVER-2: {count2} ({count2/N*100:.1f}%)")

