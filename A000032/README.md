# OEIS [A000032](https://oeis.org/A000032) - Implementation in D

The Lucas sequence.

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
import std.stdio;
import std.range;


// >pariGP<
// Vec((2-x)/(1-x-x^2)+O(x^(38+1)))
// polsym(1+x-x^2, 38)~
// [fibonacci(n+1)+fibonacci(n-1)|n<-[0..38]]

// >Mathematica<
// LinearRecurrence[{1, 1}, {2, 1}, 38+1]
// LucasL[Range[0, 38]]

enum strFrmFunc = "a[n-2]+a[n-1]";
auto a000032Rec = recurrence!(strFrmFunc)(2u,1u);

void main()
{
	a000032Rec.take(39).writeln;
}
```

## Output

```text
[2, 1, 3, 4, 7, 11, 18, 29, 47, 76, 123, 199, 322, 521, 843, 1364, 2207, 3571, 5778, 9349, 15127, 24476, 39603, 64079, 103682, 167761, 271443, 439204, 710647, 1149851, 1860498, 3010349, 4870847, 7881196, 12752043, 20633239, 33385282, 54018521, 87403803]
```

