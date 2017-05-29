from clock import time

N_SAMPLES = 1000

times = [time() for _ in range(N_SAMPLES)]
diffs = [j - i for i, j in zip(times[:-1], times[1:])]
estimated_resolution = min(diffs)
print(estimated_resolution)
