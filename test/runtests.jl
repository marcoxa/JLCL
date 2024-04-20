### -*- Mode: Julia -*-

### runtests.jl
###
### Standard file for automated testing.

using JLCL

### Start with hand weaved code.


println("JLCL.jl: testing.")

if @in_module @__MODULE__
    println("JLCL.jl: testing for module ",
            @__MODULE__,
            " passed.")
else
    println("JLCL.jl: testing for module @__MODULE__ failed.")
end


if @in_module JLCL
    println("JLCL.jl: testing for module JLCL wrongly passed.")
else
    println("JLCL.jl: testing for module JLCL rightly failed.")
end


if @in_module 42
    println("JLCL.jl: testing for module `42` wrongly passed.")
else
    println("JLCL.jl: testing for module `42` rightly failed")
    println("JLCL.jl: with a warning.")
end



### Next we use the testing framework properly (note that the macro
### calls must be parenthesized to avoid confounding `@test`.

module JLCL_testing

using JLCL
using Test

@test (@in_module JLCL_testing)

@test (! @in_module Main)

@test (! @in_module 42)

@test_throws UndefVarError (@in_module FooBar)

end

### runtests.jl ends here.
