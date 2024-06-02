# OEIS [A005728](https://oeis.org/A005728) - Implementation in D

Number of fractions in Farey series of order n... it can be generated with:

`a(n)=1+sum(k=1, n, eulerphi(k))`

D standard library doesn't have a ready to use eulerphi function so a custom one is needed.

## Source code

[Sequence](https://dlang.org/library/std/range/sequence.html) with function in lambda form...

```d
import std.stdio;
import std.range;
import std.algorithm;
import std.conv;

int eulerPhi(int n) {
    if (n <= 1) return n;

    int result = n;
    int p = 2;
    
    if (n % p == 0) {
        result -= result / p;
        while (n % p == 0) n /= p;
    }

    for (p = 3; p * p <= n; p += 2) {
        if (n % p == 0) {
            result -= result / p;
            while (n % p == 0) n /= p;
        }
    }

    if (n > 1) result -= result / n;
    
    return result;
}

void main() {
    const int N = 56+1;

    auto a005728 = sequence!((a, n) => iota(1, to!int(n) + 1).map!eulerPhi.sum + 1);

    a005728.take(N).writeln;
}
```


## Output

```text
[1, 2, 3, 5, 7, 11, 13, 19, 23, 29, 33, 43, 47, 59, 65, 73, 81, 97, 103, 121, 129, 141, 151, 173, 181, 201, 213, 231, 243, 271, 279, 309, 325, 345, 361, 385, 397, 433, 451, 475, 491, 531, 543, 585, 605, 629, 651, 697, 713, 755, 775, 807, 831, 883, 901, 941, 965]
```

## Notes


