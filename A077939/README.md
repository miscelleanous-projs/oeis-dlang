# OEIS [A077939](https://oeis.org/A077939) - Implementation in D

Expansion of `1/(1 - 2*x - x^2 - x^3)`

or 

`a(n) = 2*a(n-1) + a(n-2) + a(n-3), where a(0) = 1, a(1)=2, a(2)=5`

## Source code

[Recurrence](https://dlang.org/library/std/range/recurrence.html) with function in string form...

```d
import std.stdio;
import std.range;

// >pariGP<
// (20:22) gp > Vec(1/(1 - 2*x - x^2 - x^3)+O(x^30))

void main() {
    "\nOEIS - A077939\n".writeln;
        
    auto a077939Rec(uint n) => recurrence!("2*a[n-1] + a[n-2] + a[n-3]")(1uL, 2uL, 5uL).take(n+1);
    
    writefln("%3s %14s", "n", "a(n)");
    
    foreach(index, sequence; enumerate(a077939Rec(29)))
    {
        writefln("%3d %14d", index, sequence);
    }
    
    writeln;
    a077939Rec(29).writeln;
}

```
## Output

```text
OEIS - A077939

  n           a(n)
  0              1
  1              2
  2              5
  3             13
  4             33
  5             84
  6            214
  7            545
  8           1388
  9           3535
 10           9003
 11          22929
 12          58396
 13         148724
 14         378773
 15         964666
 16        2456829
 17        6257097
 18       15935689
 19       40585304
 20      103363394
 21      263247781
 22      670444260
 23     1707499695
 24     4348691431
 25    11075326817
 26    28206844760
 27    71837707768
 28   182957587113
 29   465959726754

[1, 2, 5, 13, 33, 84, 214, 545, 1388, 3535, 9003, 22929, 58396, 148724, 378773, 964666, 2456829, 6257097, 15935689, 40585304, 103363394, 263247781, 670444260, 1707499695, 4348691431, 11075326817, 28206844760, 71837707768, 182957587113, 465959726754]
```
