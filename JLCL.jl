### -*- Mode: Julia -*-

### JLCL.jl
###
### Some - you guessed it - Common Lisp inspired utilities.
###
### See the file COPYING in the main directory (or folder, or PDS)
### for copyright and licensing information.
###
### Notes:
###
### Julia macros are almost what you want; alas they use the ugly `@`
### thingie.  Oh, well.

module JLCL

export @in_module
### export @sayhello

"""
        @in_module m

Simple macro that can be used to warn you if you try to `include` a
file while not in the expected module.  It is also useful for
self-documentation, non comment, purposes.
"""
macro in_module(m)
    quote
        let modexpr = $(esc(m))
            if ! isa(modexpr,  Module)
                @warn string(modexpr, " is not a Module.")
                false
            elseif modexpr == @__MODULE__
                true
            else
                @warn string("in module ", @__MODULE__,
                             ", not ", modexpr, ".")
                false
            end
        end
    end
end


### Tests necessary to figure out that, because of hygiene, macros
### work backwards from CL; hence the necessary `esc` to ensure that
### the expression does not get "hygienized".

macro sayhello(name)
    quote
        let qd = $(esc(name))
            
            println("Hello, ", $(esc(name)), ", and ", qd)
            dump($(esc(name)))
        end
    end
end


end                             # module JLCL


### JLCL.jl ends here
