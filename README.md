# JLCL

Copyright (c) 2024 Marco Antoniotti, all rights reserved.
See the file COPYING for licensing information


**JLCL** is a small, first cut, [**Julia**](https://julialang.org)
library containing a few things I miss from **Common Lisp**.

For the time being it contains a single usable macro called
`@in_module` that I use a bit like `cl:in-package`.  The use case is
derived from the fact that **Julia** nudges you to define a `module`
and then to `include` several files containing actual code.  I like to
have a first "declaration" that tells me *where* I am writing code; as
in "in which module I am".


## Example

You have a file called `TopModule.jl` containing the following code.

```julia
    ### TopModule.jl
	
    module TopModule
	
    #= Some code here ... =#

    include("some/folder/with/file.jl")

    #= ... more code here ... =#

    end    # module TopModule
	
    ### TopModule.jl ends here.
```

Then, file `some/folder/with/file.jl` contains code that will end
up in module `TopModule`; but now I can write the following.

```julia
    ### ... in file "file.jl"
	
    @in_module TopModule
	
    #| ... actual code here ... |#
	
    ### file.jl ends here.
```

The macro `@in_module` simply yields `true` if the "current" module is
what is passed as argument, or it yields `false` after printing a
warning (using `@warn`).  Pretty harmless, but useful as a visual
reference in your code.


## A NOTE ON FORKING

Of course you are free to fork the project subject to the current
licensing scheme.  However, before you do so, I ask you to consider
plain old "cooperation" by asking me to become a developer.
It helps keeping the entropy level at an acceptable level.

