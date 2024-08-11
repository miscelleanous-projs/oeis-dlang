# OEIS [A007798](https://oeis.org/A007798) - Implementation in D

Expected number of random moves in Tower of Hanoi problem with n disks starting with a randomly chosen position and ending at a position with all disks on the same peg.

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
// OEIS A007798
// https://oeis.org/A007798

import std.stdio;
import std.range;

enum strFrmFunc = "9*a[n-1]-23*a[n-2]+15*a[n-3]";
auto a007798Rec = recurrence!(strFrmFunc)(0u, 0u, 2u);

void main()
{
	a007798Rec.take(60+1).writeln;
}
```

## Output


```text
[0, 0, 2, 18, 116, 660, 3542, 18438, 94376, 478440, 2411882, 12118458, 60769436, 304378620, 1523487422, 3327252782, 3765710928, 1691732176, 4292833746, 376752738, 3046025156, 1537040996, 965688998, 1849766230, 312794872, 525669304, 3808398650, 1107313162, 3272133100, 977432780, 1687138702, 3130585214, 4032568480, 2481638816, 2314256290, 2764304562, 285494036, 3769056820, 100240246, 100644518, 3596519752, 1492686472, 943368458, 2336519770, 246663996, 1285253788, 2287103070, 3312985038, 787268848, 3848015472, 1795221874, 3886183170, 4161137252, 766154244, 3841717318, 2061555702, 1816358808, 787404120, 528687322, 1008371370, 136661132]
```
