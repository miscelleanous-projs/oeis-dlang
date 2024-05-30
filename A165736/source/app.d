import std.stdio : writeln;
import std.range : iota;
import std.bigint : BigInt, powmod;
import std.algorithm;

// OEIS-A165736
// https://oeis.org/A165736

BigInt a165736(BigInt n)
{
    if (n % 10 == 0) return 0.BigInt;
    
    BigInt result = n;

    foreach (i; 1 .. 1+10)
        result = powmod(n, result, 10.BigInt^^i);

    return result;
}

void main()
{
    // https://oeis.org/A165736/list
    iota(1.BigInt, 24.BigInt + 1).map!a165736.writeln;
}

unittest
{
    assert(a165736(  1.BigInt) ==             1.BigInt);
    assert(a165736(  6.BigInt) == 7_447_238_656.BigInt);
    assert(a165736( 10.BigInt) ==             0.BigInt);
    assert(a165736( 11.BigInt) == 9_172_666_611.BigInt);
    assert(a165736( 16.BigInt) ==   290_415_616.BigInt);
    assert(a165736( 19.BigInt) ==   609_963_179.BigInt);
    assert(a165736( 20.BigInt) ==              0.BigInt);
    assert(a165736( 23.BigInt) == 1_075_718_247.BigInt);
    assert(a165736( 30.BigInt) ==             0.BigInt);
    assert(a165736( 40.BigInt) ==             0.BigInt);
    assert(a165736(100.BigInt) ==             0.BigInt);
}
