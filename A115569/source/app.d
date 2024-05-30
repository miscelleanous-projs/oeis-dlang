import std.stdio;
import std.conv;
import std.algorithm;
import std.range;

// OEIS-A115569
// https://oeis.org/A115569

// Definition:
// Lynch-Bell numbers are numbers n such that the digits are all different (and do not include 0) and n is divisible by each of its individual digits.

bool isA115569(int num) {
    int[int] set;

    return num
        .to!string
        .map!(c => c.to!int - '0')
        .all!(d => (d != 0) && set[d]++ < 1 && (num % d == 0));
}

void main() {
    
    // No "Closed form" for straitforward approach so using Predicate
    // Reproducing... https://oeis.org/A115569/list
    iota(1_900 + 1).filter!isA115569.writeln;
}


unittest
{
    // no 0 in digits
    assert(isA115569(0) == false);
    assert(isA115569(10) == false);
    assert(isA115569(123450789) == false);
    
    // duplicate digit(s)
    assert(isA115569(11) == false);
    assert(isA115569(999) == false);
    assert(isA115569(5555) == false);
    
    // Some Lynch-Bell numbers
    assert(isA115569(1) == true);
    assert(isA115569(36) == true);
    assert(isA115569(315) == true);
    assert(isA115569(3195) == true);
    assert(isA115569(367248) == true);
    assert(isA115569(9718632) == true);
    
}