# OEIS [A056220](https://oeis.org/A056220) - Implementation in D

`a(n) = 2*n^2 - 1`

It's the same as  `a(n) = a(n-1) + 4*n - 2 and a(0)=-1` to follow the formalism required by [Recurrence](https://dlang.org/library/std/range/recurrence.html).

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
import std.stdio, std.range;

// >pariGP<
// (20:28) gp > Vec((-1 + 4*x + x^2)/(1-x)^3+O(x^50))

void main() {
    auto a056220 = recurrence!("a[n-1] + 4 * n - 2")(-1);
    
    a056220.take(50).writeln;
}
```
Alternative:

[Sequence](https://dlang.org/library/std/range/sequence.html) with function in string form...

```d
import std.stdio, std.range;

// >pariGP<
// (20:28) gp > Vec((-1 + 4*x + x^2)/(1-x)^3+O(x^50))

void main() {
    auto a056220 = sequence!((a, n) => (-1+cast(int)(n^^2)*2))();
    
    a056220.take(50).writeln;
}
```
## Output

```text
[-1, 1, 7, 17, 31, 49, 71, 97, 127, 161, 199, 241, 287, 337, 391, 449, 511, 577, 647, 721, 799, 881, 967, 1057, 1151, 1249, 1351, 1457, 1567, 1681, 1799, 1921, 2047, 2177, 2311, 2449, 2591, 2737, 2887, 3041, 3199, 3361, 3527, 3697, 3871, 4049, 4231, 4417, 4607, 4801]
```
