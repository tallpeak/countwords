import collections
import sys

counts = collections.Counter()
remaining = b''
while True:
    chunk = sys.stdin.buffer.read(64*1024)
    if not chunk:
        break
    chunk = remaining + chunk
    last_eol = chunk.rfind(b'\n')
    if last_eol == -1:
        remaining = ''
    else:
        remaining = chunk[last_eol+1:]
        chunk = chunk[:last_eol]
    counts.update(chunk.lower().split())

for word, count in counts.most_common():
    print(word.decode('utf-8'), count)
