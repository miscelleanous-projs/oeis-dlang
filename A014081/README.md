# OEIS [A014081](https://oeis.org/A014081) - Implementation in D

Number of occurrences of '11' in the binary expansion of n.

a(4n) = a(4n+1) = a(n), a(4n+2) = a(2n+1), a(4n+3) = a(2n+1) + 1.

## Source code

It uses A014081Gen which is a `Stateful`, potentially `Infinite Range Generator` that computes values based on a specific sequence logic computing the number of occurrences of '11' in the binary expansion of n.

It uses also `Lazy Evaluation` to generate values as needed, making it _efficient_ for generating sequences without preallocating memory for all possible values.


```d
import std.stdio : writeln, writefln;
import std.format : format;
import std.range : enumerate, take;
import std.functional : memoize;
import std.algorithm : each, map;

struct A014081Gen {
    // Current index of the sequence
    // Start at 0
    size_t n = 0;

    size_t front() {
        // Use the memoized version of a(n)
        return fastA014081(n);
    }

    void popFront() {
        n++;
    }

    bool empty() {
        return n >= size_t.max;
    }

    // Fast a014081(n) with memoization
    alias fastA014081 = memoize!(a014081);

    static auto a014081(size_t n) {
        // Base case for n = 0
        if (n == 0) return 0;

        // Recursive logic
        if (n % 4 <= 1) {
            return a014081(n/4);
        } else if (n % 4 == 2) {
            return a014081(n/2);
        } else {
            // Case where n % 4 == 3
            return 1 + a014081((n-1)/2);
        }
    }
}

void main() {
    const size_t LIMIT = 104+1;
    auto a014081Range = A014081Gen().take(LIMIT);
    
    "\nOEIS - A014081\n".writeln;
    
    writefln("%3s %8s", "n", "a(n)");
    
    a014081Range.enumerate.map!(a => format("%3d %6d", a[0], a[1])).each!writeln;
    
    writeln;
    a014081Range.writeln;
}
```
## Output

```text
OEIS - A014081

  n     a(n)
  0      0
  1      0
  2      0
  3      1
  4      0
  5      0
  6      1
  7      2
  8      0
  9      0
 10      0
 11      1
 12      1
 13      1
 14      2
 15      3
 16      0
 17      0
 18      0
 19      1
 20      0
 21      0
 22      1
 23      2
 24      1
 25      1
 26      1
 27      2
 28      2
 29      2
 30      3
 31      4
 32      0
 33      0
 34      0
 35      1
 36      0
 37      0
 38      1
 39      2
 40      0
 41      0
 42      0
 43      1
 44      1
 45      1
 46      2
 47      3
 48      1
 49      1
 50      1
 51      2
 52      1
 53      1
 54      2
 55      3
 56      2
 57      2
 58      2
 59      3
 60      3
 61      3
 62      4
 63      5
 64      0
 65      0
 66      0
 67      1
 68      0
 69      0
 70      1
 71      2
 72      0
 73      0
 74      0
 75      1
 76      1
 77      1
 78      2
 79      3
 80      0
 81      0
 82      0
 83      1
 84      0
 85      0
 86      1
 87      2
 88      1
 89      1
 90      1
 91      2
 92      2
 93      2
 94      3
 95      4
 96      1
 97      1
 98      1
 99      2
100      1
101      1
102      2
103      3
104      1

[0, 0, 0, 1, 0, 0, 1, 2, 0, 0, 0, 1, 1, 1, 2, 3, 0, 0, 0, 1, 0, 0, 1, 2, 1, 1, 1, 2, 2, 2, 3, 4, 0, 0, 0, 1, 0, 0, 1, 2, 0, 0, 0, 1, 1, 1, 2, 3, 1, 1, 1, 2, 1, 1, 2, 3, 2, 2, 2, 3, 3, 3, 4, 5, 0, 0, 0, 1, 0, 0, 1, 2, 0, 0, 0, 1, 1, 1, 2, 3, 0, 0, 0, 1, 0, 0, 1, 2, 1, 1, 1, 2, 2, 2, 3, 4, 1, 1, 1, 2, 1, 1, 2, 3, 1]
```
