import heapq
import collections

def encode(frequency):
    heap = [[weight, [symbol, ""]] for symbol, weight in frequency.items()]
    heapq.heapify(heap)
    while len(heap) > 1:
        lo = heapq.heappop(heap)
        hi = heapq.heappop(heap)
        for pair in lo[1:]:
            pair[1] = '0' + pair[1]
        for pair in hi[1:]:
            pair[1] = '1' + pair[1]
        heapq.heappush(heap, [lo[0] + hi[0]] + lo[1:] + hi[1:])
    return sorted(heapq.heappop(heap)[1:], key=lambda p: (len(p[-1]), p))

def huffman_code_string(data):
    frequency = collections.Counter(data)
    huff = encode(frequency)
    return {item[0]: item[1] for item in huff}

# Example usage
data = "this is an example for huffman encoding"
huffman_code = huffman_code_string(data)
print("Huffman Codes are :\n" + "\n".join(f"{item[0]}: {item[1]}" for item in huffman_code.items()))
print("\nOriginal string was :\n" + data)
print("\nEncoded string is :\n" + "".join(huffman_code[item] for item in data))
