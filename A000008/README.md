# OEIS [A000008](https://oeis.org/A000008) - Implementation in D

 Triangular numbers: a(n) = binomial(n+1,2) = n*(n+1)/2 = 0 + 1 + 2 + ... + n.
 
`a(n) = 2*a(n-1)-a(n-2)+1, where a(0) = 0 and a(1) = 1`

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```
// OEIS A000008
// https://oeis.org/A000008

import std.stdio;
import std.range;
import std.algorithm;

// (14:05) gp > Vec( 1/((1-x)*(1-x^2)*(1-x^5)*(1-x^10)) + O(x^20) )
// %10 = [1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 11, 12, 15, 16, 19, 22, 25, 28, 31, 34]

// Port of 
// LinearRecurrence[{1, 1, -1, 0, 1, -1, -1, 1, 0, 1, -1, -1, 1, 0, -1, 1, 1, -1}, {1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 11, 12, 15, 16, 19, 22, 25, 28}, 100]

enum strFrmFunc = "a[n-1]+a[n-2]-a[n-3]+a[n-5]-a[n-6]-a[n-7]+a[n-8]+a[n-10]-a[n-11]-a[n-12]+a[n-13]-a[n-15]+a[n-16]+a[n-17]-a[n-18]";
auto a000008Rec = recurrence!(strFrmFunc)(1u, 1u, 2u, 2u, 3u, 4u, 5u, 6u, 7u, 8u, 11u, 12u, 15u, 16u, 19u, 22u, 25u, 28u);

void main()
{
	a000008Rec.take(60+1).writeln;
}
```
## Output

```text
[0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210, 231, 253, 276, 300, 325, 351, 378, 406, 435, 465, 496, 528, 561, 595, 630, 666, 703, 741, 780, 820, 861, 903, 946, 990, 1035, 1081, 1128, 1176, 1225, 1275, 1326, 1378, 1431]
```
