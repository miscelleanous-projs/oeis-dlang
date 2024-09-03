# OEIS [A107358](https://oeis.org/A107358) - Implementation in D

 Dying rabbits: a(n) = Fibonacci(n) for n <= 12; for n >= 13, a(n) = a(n-1) + a(n-2) - a(n-13).
 
## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
// OEIS A107358
// https://oeis.org/A107358

import std.stdio;
import std.range;
import std.algorithm;

// >pariGP<
// (16:36) gp > Vec(x/(x^13-x^2-x+1)+O(x^42))

// >pariGP<
// (16:36) gp > Vec(x/((x-1)*(1+x)*(x^11+x^9+x^7+x^5+x^3+x-1))+O(x^42))

enum strFrmFunc = "a[n-1]+a[n-2]-a[n-13]";
auto a107358Rec = recurrence!(strFrmFunc)(1uL, 1uL, 2uL, 3uL, 5uL, 8uL, 13uL, 21uL, 34uL, 55uL, 89uL, 144uL, 233uL);

void main()
{
	a107358Rec.take(40+1).writeln;
}
```
## Output

```text
[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 376, 608, 982, 1587, 2564, 4143, 6694, 10816, 17476, 28237, 45624, 73717, 119108, 192449, 310949, 502416, 811778, 1311630, 2119265, 3424201, 5532650, 8939375, 14443788, 23337539, 37707610, 60926041, 98441202, 159056294]
```

