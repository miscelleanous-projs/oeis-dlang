# OIES A165736 - Implementations in D

For some reason, I need them at my reach... Mostly to solve miscelleanous *Math'n Code* challenge using my languages of choice. Enjoy!

Hopefully they will be useful for somebody else

## What it does do?

To calculate a(3) this how to proceed manually:

```text
 1: 3 ^           3 mod             10 =             7
 2: 3 ^           7 mod            100 =            87
 3: 3 ^          87 mod          1_000 =           387
 4: 3 ^         387 mod         10_000 =         5_387
 5: 3 ^       5_387 mod        100_000 =        95_387
 6: 3 ^      95_387 mod      1_000_000 =       195_387
 7: 3 ^     195_387 mod     10_000_000 =     4_195_387
 8: 3 ^   4_195_387 mod    100_000_000 =    64_195_387
 9: 3 ^  64_195_387 mod  1_000_000_000 =   464_195_387
10: 3 ^ 464_195_387 mod 10_000_000_000 = 2_464_195_387
```
read a(3) = 2_464_195_387

namely `aA165736(n) = n^(n^(n^(n^(n^(n^(n^(n^(n^(n^n mod 10) mod 100) mod 1_000) mod 10_000) mod 100_000) mod 1_000_000) mod 10_000_000) mod 100_000_000) mod 1_000_000_000) mod 10_000_000_000`

Every implementation try to calculate the sequence using equivalent algorithm.

