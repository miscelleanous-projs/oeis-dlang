# OEIS [A026804](https://oeis.org/A026804) - Implementation in D


 
## Source code

```
import std.stdio: writeln;
import std.range: iota;
import std.algorithm: map;

// OEIS-A026804
// https://oeis.org/A026804

int a026804(int n) {
    int b(int n, int i) {
        if (n < 1 || i < 1) {
            return 0;
        } else {
            return b(n, i - 1) + (n == i ? n % 2 : 0) + (i > n ? 0 : b(n - i, i));
        }
    }
    
    return b(n, n);
}

void main() {
    const N = 47;
    
    iota(1, N+1).map!a026804.writeln;
}

unittest {
    // Test cases
    assert(a026804(0) == 0);  // Edge case: n = 0
    assert(a026804(1) == 1);  // Base case: n = 1
    assert(a026804(18) == 319);  // Test case: n = 18
    assert(a026804(34) == 10_617);  // Test case: n = 34
    assert(a026804(47) == 109_456); // Test case: n = 47
}
```
## Output

```text
[1, 1, 3, 3, 6, 8, 13, 16, 25, 33, 47, 61, 84, 109, 148, 189, 249, 319, 413, 522, 670, 842, 1066, 1330, 1668, 2068, 2574, 3171, 3915, 4800, 5888, 7175, 8753, 10617, 12879, 15552, 18772, 22570, 27125, 32480, 38867, 46372, 55275, 65707, 78047, 92470, 109456]
```


