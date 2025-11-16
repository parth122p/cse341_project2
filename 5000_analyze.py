

import subprocess

critical_path = 65

# Run simulation
subprocess.run("iverilog -o 5000_simulation 5000_tests.v unit_gate_delay_simulation.v", shell=True)
subprocess.run("vvp 5000_simulation", shell=True)

# Calculate stats
delays = [int(line.strip()) for line in open("5000_Delays.txt") if line.strip()]
avg = sum(delays) / len(delays)
above_half = sum(1 for d in delays if d >= 0.5 * critical_path)  

print(f"\n{'='*70}")
print(f"Total patterns: {len(delays)}")
print(f"Average delay:  {avg:.2f} ns ({100*avg/critical_path:.1f}% of CP)")  
print(f"Min/Max delay:  {min(delays)} ns / {max(delays)} ns")
print(f"≥50% of CP:     {above_half} patterns")
print(f"<50% of CP:     {len(delays) - above_half} patterns")
print(f"{'='*70}\n")