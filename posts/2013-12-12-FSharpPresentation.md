---
title: F# an Introduction: Single Page
---

% F\#
  An Introduction
% Jon Nyman
% November 14, 2013

# Credits
- [F\# for Fun and Profit](http://fsharpforfunandprofit.com)

# [History](http://en.wikipedia.org/wiki/F_Sharp_(programming_language)#History)

> F\# originates from Microsoft Research, Cambridge and the language was originally designed and implemented by Don Syme. Andrew Kennedy contributed to the design of units of measure. The F\# language and the Visual F\# tools for Windows are developed by Microsoft. The F\# Software Foundation develop the F\# open source compiler and tools based partly on open source releases by the Microsoft Visual F\# team.

> F\# features a legacy "ML compatibility mode" which allow programs written in a large subset of OCaml (roughly, with no functors, objects, polymorphic variants and other additions) to be immediately compiled as F\#.

# Influenced By
- ML, OCaml, C\#, Python, Haskell, Scala, Erlang

# Why Use F\#?
- Conciseness
- Convenience
- Correctness
- Concurrency
- Completeness

# Conciseness
- Not cluttered with curly brackets, semicolons, etc.
  No need to specify type of object (type inference).
  Less lines of code to solve similar problems in C\#.

# Convenience
- Many tasks are simpler in F\#
    + Complex type definitions
    + list processing
    + comparison and equality
    + state machines
    + type providers (feature)
  
# Correctness
- Powerful type system
- Business logic can be typed right into the code so errors are caught at compile time.
- Gaming can be helped by F\# by using the units of measure.

# Concurrency
- Asynchronous, parallelism, message queuing system, event handling, reactive programming.
- Data is immutable by default so sharing state and avoiding locks is much easier

# Completeness
- F\# is hybrid functional/OO Language
    + Capable of interacting well with other applications.
  
# Scripting & Testing Code
- F\# Interactive (FSI)
- Small Incremental Testing Makes Code More Robust (Functions)

# [Type Providers](http://msdn.microsoft.com/en-us/library/vstudio/hh156509.aspx)
- Provides types, properties, and methods for F# program.
- Eliminates barriers to working with diverse information.
- No need to create your own types (classes) nor maintain them.
- Great for exploratory code.
- Types can be created from URL or connection string.
- Groups of types are only expanded on demand; that is, they are expanded if the types are actually referenced by your program. This allows for the direct, on-demand integration of large-scale information spaces such as online data markets in a strongly typed way.

# [F\# in 60 Seconds](http://fsharpforfunandprofit.com/posts/fsharp-in-60-seconds/)
- See [SampleCode.fs](SampleCode.fs)

# [Designing with Types](http://fsharpforfunandprofit.com/posts/designing-with-types-conclusion/)
# The End!

:)
