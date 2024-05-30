import std.stdio;
import std.range;
import std.algorithm;

// OEIS-A245788
// https://oeis.org/A245788

int a245788(int n)
{
    if (n < 0)
        return 0;
    
    int sum = 0;
    int num = n;
    
    while (num != 0)
    {
        sum += num % 2;
        num /= 2;
    }
    
    return n * sum;
}

void main()
{
    const N = 60;
    
    iota(N+1).map!a245788.writeln;
}

unittest {
    // Test cases
    assert(a245788(3) == 6);
    assert(a245788(7) == 21);
    assert(a245788(28) == 84);
    assert(a245788(31) == 155);
    assert(a245788(60) == 240);
}