# OEIS [A001789](https://oeis.org/A001789) - Implementation in D

Expected number of random moves in Tower of Hanoi problem with n disks starting with a randomly chosen position and ending at a position with all disks on the same peg.

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
// OEIS A001789
// https://oeis.org/A001789

import std.stdio;
import std.range;

enum strFrmFunc = "8*a[n-1]-24*a[n-2]+32*a[n-3]-16*a[n-4]";
auto a001789Rec = recurrence!(strFrmFunc)(1uL,8uL,40uL,160uL);

void main()
{
	a001789Rec.take(25+1).writeln;
}
```

## Output


```text
[1, 8, 40, 160, 560, 1792, 5376, 15360, 42240, 112640, 292864, 745472, 1863680, 4587520, 11141120, 26738688, 63504384, 149422080, 348651520, 807403520, 1857028096, 4244635648, 9646899200, 21810380800, 49073356800, 109924319232]
```
