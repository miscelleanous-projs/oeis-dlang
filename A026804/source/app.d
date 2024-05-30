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
