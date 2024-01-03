import java.util.PriorityQueue;
import java.util.HashMap;
import java.util.Map;

class Node {
    char ch;
    int freq;
    Node left = null, right = null;

    Node(char ch, int freq) {
        this.ch = ch;
        this.freq = freq;
    }
}

public class huffmanCoding {
    public static void encode(Node root, String str, Map<Character, String> huffmanCode) {
        if (root == null) {
            return;
        }

        if (root.left == null && root.right == null) {
            huffmanCode.put(root.ch, str);
        }

        encode(root.left, str + "0", huffmanCode);
        encode(root.right, str + "1", huffmanCode);
    }

    public static void buildHuffmanTree(String text) {
        Map<Character, Integer> freq = new HashMap<>();
        for (char c: text.toCharArray()) {
            freq.put(c, freq.getOrDefault(c, 0) + 1);
        }

        PriorityQueue<Node> pq;
        pq = new PriorityQueue<>((l, r) -> l.freq - r.freq);

        for (var entry: freq.entrySet()) {
            pq.add(new Node(entry.getKey(), entry.getValue()));
        }

        while (pq.size() != 1) {
            Node left = pq.poll();
            Node right = pq.poll();
            int sum = left.freq + right.freq;
            pq.add(new Node('\0', sum, left, right));
        }

        Node root = pq.peek();

        Map<Character, String> huffmanCode = new HashMap<>();
        encode(root, "", huffmanCode);

        System.out.println("Huffman Codes are:");
        for (var entry: huffmanCode.entrySet()) {
            System.out.println(entry.getKey() + " " + entry.getValue());
        }

        System.out.println("\nOriginal string was: " + text);
        StringBuilder sb = new StringBuilder();
        for (char c: text.toCharArray()) {
            sb.append(huffmanCode.get(c));
        }
        System.out.println("\nEncoded string is: " + sb);
    }

    public static void main(String[] args) {
        String text = "example of huffman coding";
        buildHuffmanTree(text);
    }
}
