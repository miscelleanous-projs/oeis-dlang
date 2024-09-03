# OEIS [A000005](https://oeis.org/A000005) - Implementation in D

d(n) (also called tau(n) or sigma_0(n)), the number of divisors of n.

## Source code

[Sequence](https://dlang.org/library/std/range/sequence.html) with function in lambda form...

```d
import std.stdio;
import std.range;
import std.algorithm;

// >pariGP<
// (22:07) gp > vector(104, n, numdiv(n))

// >Mathematica<
// (22:38) gp > vector(104, n, sigma(n, 0))

size_t numdiv(size_t n) {
    return iota(1, n + 1)
        .filter!(i => (n) % (i) == 0uL)
        .walkLength
        ;
}

auto a000005Seq = sequence!((a, n) => numdiv(n+1));

void main()
{
	const N = 104;
	a000005Seq.take(N).writeln;
}
```

## Output

```text
[1, 2, 2, 3, 2, 4, 2, 4, 3, 4, 2, 6, 2, 4, 4, 5, 2, 6, 2, 6, 4, 4, 2, 8, 3, 4, 4, 6, 2, 8, 2, 6, 4, 4, 4, 9, 2, 4, 4, 8, 2, 8, 2, 6, 6, 4, 2, 10, 3, 6, 4, 6, 2, 8, 4, 8, 4, 4, 2, 12, 2, 4, 6, 7, 4, 8, 2, 6, 4, 8, 2, 12, 2, 4, 6, 6, 4, 8, 2, 10, 5, 4, 2, 12, 4, 4, 4, 8, 2, 12, 4, 6, 4, 4, 4, 12, 2, 6, 6, 9, 2, 8, 2, 8]

```
