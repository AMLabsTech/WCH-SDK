#!/usr/bin/env python3

from pathlib import Path
import sys

def print_usage():
	print(f"Usage: {sys.argv[0]} <V3F core binary> <V5F core binary> <output binary>")

if len(sys.argv) != 4:
	print("Insufficient arguments!")
	print_usage()
	exit(1)

V3F_OFFSET = 0x00000
V5F_OFFSET = 0x10000

v3f = Path(sys.argv[1]).read_bytes()
v5f = Path(sys.argv[2]).read_bytes()

end = max(V3F_OFFSET + len(v3f), V5F_OFFSET + len(v5f))
image = bytearray([0xFF] * end)

image[V3F_OFFSET:V3F_OFFSET + len(v3f)] = v3f
image[V5F_OFFSET:V5F_OFFSET + len(v5f)] = v5f

Path(sys.argv[3]).write_bytes(image)
