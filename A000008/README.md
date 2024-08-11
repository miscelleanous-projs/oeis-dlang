# OEIS [A000008](https://oeis.org/A000008) - Implementation in D

 Number of ways of making change for n cents using coins of 1, 2, 5, 10 cents or the number of partitions of n into parts 1, 2, 5, and 10..
 
## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
// OEIS A000008
// https://oeis.org/A000008

import std.stdio;
import std.range;

// (20:49) gp > Vec(x/(1-x)^2+O(x^78))
// %32 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
//        21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
//        41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
//        61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77]

enum strFrmFunc = "-a[n-2]+2*a[n-1]";
auto a000027Rec = recurrence!(strFrmFunc)(1u, 2u);

void main()
{
	a000027Rec.take(77).writeln;
}
```
## Output

```text
[1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 11, 12, 15, 16, 19, 22, 25, 28, 31, 34, 40, 43, 49, 52, 58, 64, 70, 76, 82, 88, 98, 104, 114, 120, 130, 140, 150, 160, 170, 180, 195, 205, 220, 230, 245, 260, 275, 290, 305, 320, 341, 356, 377, 392, 413, 434, 455, 476, 497, 518, 546] 
```
