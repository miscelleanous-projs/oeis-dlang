# OEIS [A000213](https://oeis.org/A000213) - Implementation in D

Tribonacci numbers: a(n) = a(n-1) + a(n-2) + a(n-3) with a(0) = a(1) =a (2) = 1.

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
import std.stdio;
import std.range;

// >pariGP<
// (22:57) gp > Vec((1-x)*(1+x)/(1-x-x^2-x^3)+O(x^37))

// >Mathematica<
// LinearRecurrence[{1, 1, 1}, {1, 1, 1}, 37] 

enum strFrmFunc = "a[n-3]+a[n-2]+a[n-1]";
auto a000213Rec = recurrence!(strFrmFunc)(1uL, 1uL, 1uL);

void main()
{
	a000213Rec.take(37).writeln;
}
```

## Output

```text
[1, 1, 1, 3, 5, 9, 17, 31, 57, 105, 193, 355, 653, 1201, 2209, 4063, 7473, 13745, 25281, 46499, 85525, 157305, 289329, 532159, 978793, 1800281, 3311233, 6090307, 11201821, 20603361, 37895489, 69700671, 128199521, 235795681, 433695873, 797691075, 1467182629]
```
