# OEIS [A014445](https://oeis.org/A014445) - Implementation in D

Even Fibonacci numbers; or, Fibonacci(3*n).

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
import std.stdio;
import std.range;

// >pariGP<
// (21:38) gp > Vec(2*x/(1-4*x-x^2)+O(x^()25+1)))

// >Mathematica<
// LinearRecurrence[{4, 1}, {0, 2}, 25+1]

enum strFrmFunc = "4*a[n-1]+a[n-2]";
auto a014445Rec = recurrence!(strFrmFunc)(0u);

void main()
{
	a014445Rec.take(25+1).writeln;
}
```

## Output

```text
[0, 2, 8, 34, 144, 610, 2584, 10946, 46368, 196418, 832040, 3524578, 14930352, 63245986, 267914296, 1134903170, 4807526976, 20365011074, 86267571272, 365435296162, 1548008755920, 6557470319842, 27777890035288, 117669030460994, 498454011879264, 2111485077978050]
```
