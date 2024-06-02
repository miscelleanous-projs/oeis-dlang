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

Example of [Farey sequence](https://en.wikipedia.org/wiki/Farey_sequence)

```text
1: 0/1 1/1
2: 0/1 1/2 1/1
3: 0/1 1/3 1/2 2/3 1/1
4: 0/1 1/4 1/3 1/2 2/3 3/4 1/1
5: 0/1 1/5 1/4 1/3 2/5 1/2 3/5 2/3 3/4 4/5 1/1
6: 0/1 1/6 1/5 1/4 1/3 2/5 1/2 3/5 2/3 3/4 4/5 5/6 1/1
7: 0/1 1/7 1/6 1/5 1/4 2/7 1/3 2/5 3/7 1/2 4/7 3/5 2/3 5/7 3/4 4/5 5/6 6/7 1/1
8: 0/1 1/8 1/7 1/6 1/5 1/4 2/7 1/3 3/8 2/5 3/7 1/2 4/7 3/5 5/8 2/3 5/7 3/4 4/5 5/6 6/7 7/8 1/1
9: 0/1 1/9 1/8 1/7 1/6 1/5 2/9 1/4 2/7 1/3 3/8 2/5 3/7 4/9 1/2 5/9 4/7 3/5 5/8 2/3 5/7 3/4 7/9 4/5 5/6 6/7 7/8 8/9 1/1
10: 0/1 1/10 1/9 1/8 1/7 1/6 1/5 2/9 1/4 2/7 3/10 1/3 3/8 2/5 3/7 4/9 1/2 5/9 4/7 3/5 5/8 2/3 7/10 5/7 3/4 7/9 4/5 5/6 6/7 7/8 8/9 9/10 1/1
```

`a005728[5]=11` because the fractions are `0/1, 1/5, 1/4, 1/3, 2/5, 1/2, 3/5, 2/3, 3/4, 4/5, 1/1`.
