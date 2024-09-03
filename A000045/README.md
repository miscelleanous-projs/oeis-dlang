# OEIS [A000045](https://oeis.org/A000045) - Implementation in D

The Fibonacci numbers: F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
import std.stdio;
import std.range;


// >pariGP<
// Vec(x^2/(1-x-x^2)+O(x^(41+1)))

// >Mathematica<
// LinearRecurrence[{1, 1}, {0, 1}, 41]

enum strFrmFunc = "a[n-2]+a[n-1]";
auto a000045Rec = recurrence!(strFrmFunc)(0u,1u);

void main()
{
	a000045Rec.take(41).writeln;
}
```

## Output

```text
[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169, 63245986, 102334155]
```


