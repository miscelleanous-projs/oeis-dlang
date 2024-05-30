# OEIS [A120893](https://oeis.org/A120893) - Implementations in D

These solutions leverage the standard library [Recurrence](https://dlang.org/library/std/range/recurrence.html) which is under the hood is an `infinite forward range`.

# Source codes

## Using Function in String form

```d
import std.stdio;
import std.range;

void main()
{
    auto a120893Rec = recurrence!"2uL * (2uL * a[n-1] + (-1L) ^^ n) - a[n-2]"(1uL, 1uL);
        
    auto a120893 = a120893Rec.take(25).array;
    
    writeln;
    a120893.writeln;
}
```

## Using Function in Lambda form

```d
import std.stdio;
import std.range;

void main()
{
    auto a120893Rec = recurrence!((a,n) => 2uL * (2uL * a[n-1] + (-1L) ^^ n) - a[n-2])(1uL, 1uL);
        
    auto a120893 = a120893Rec.take(25).array;
    
    writeln;
    a120893.writeln;
}

```

## Using Function in Explicit form

```d
import std.stdio;
import std.range;

void main()
{  
    // Function in explicit form
    static size_t efA120893(R)(R state, size_t n)
    {
        return 2uL * (2uL * state[n-1] + (-1L) ^^ n) - state[n-2];
    }
        
    auto a120893Rec = recurrence!(efA120893)(1uL, 1uL);
    
    auto a120893 = a120893Rec.take(25).array;
    
    writeln;
    a120893.writeln;
}
```

## Output

```text
[1, 1, 5, 17, 65, 241, 901, 3361, 12545, 46817, 174725, 652081, 2433601, 9082321, 33895685, 126500417, 472105985, 1761923521, 6575588101, 24540428881, 91586127425, 341804080817, 1275630195845, 4760716702561, 17767236614401]
```

## Alternatives

The following equivalent initial values (3 instead of 2) along with the accordingly adjusted recurrent function lead to the same result and given here for reference.

```d
auto a120893Rec = recurrence!("3*a[n-1] + 3*a[n-2] - a[n-3]")(1uL, 1uL, 5uL);
```

```d
auto a120893Rec = recurrence!((a,n) => 3*a[n-1] + 3*a[n-2] - a[n-3])(1uL, 1uL, 5uL);
```

```d
static size_t efA120893(R)(R state, size_t n)
{
    return 3*state[n-1] + 3*state[n-2] - state[n-3];
}
        
auto a120893Rec = recurrence!(efA120893)(1uL, 1uL, 5uL);
```
