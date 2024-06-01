# OEIS [A000217](https://oeis.org/A000217) - Implementation in D

 Triangular numbers: a(n) = binomial(n+1,2) = n*(n+1)/2 = 0 + 1 + 2 + ... + n.
 
`a(n) = 2*a(n-1)-a(n-2)+1, where a(0) = 0 and a(1) = 1`

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
import std.stdio, std.range;

void main() {
    auto a000217 = recurrence!("2*a[n-1] - a[n-2] + 1")(0, 1);
    
    a000217.take(54).writeln;
}
```
## Output

```text
[0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210, 231, 253, 276, 300, 325, 351, 378, 406, 435, 465, 496, 528, 561, 595, 630, 666, 703, 741, 780, 820, 861, 903, 946, 990, 1035, 1081, 1128, 1176, 1225, 1275, 1326, 1378, 1431]
```
