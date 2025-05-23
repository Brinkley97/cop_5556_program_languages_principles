Introduction
============

The goal of this assignment is to write a type inference
algorithm similar (but simpler) than the one in OCaml in SWI prolog.
In particular, your program will figure out the types of inputs
and outputs of functions and type of variables used much like
OCaml inferes the types when it compiles code.

For exmple, OCaml will infer the fact that the function
let add x y = x + y;
has the type add: int->int->int (i.e. takes pairs of ints into int)

The specific mechanism used in OCaml to implement type inference
is called Unification 
https://en.wikipedia.org/wiki/Unification
https://www.cs.toronto.edu/~bonner/courses/2016f/csc324/slides/prolog2.pdf


What to implement
=================

The provided code already implements significant part of the 
type inference mechanism. You need to complete it to allow
a more complete coverage of OCAml type inference. Specifically:

1. Add more basic functions to provide interesting code (fType predicate)
2. Add more statement types. At a minimum you need to cover:
   
   a. global variables with expression initialization  (e.g. let x = 3)

   b. global function definitions (let add x y = x+y)
        last expression is an implicit return. return statement also possible

   c. expression computation (as a statement)

   d. if statements

   e. "let in" statement for local variables

   f. for statements

   g. code blocks (separated by ;)
   
4. Write tests for all predicates especially infer (at least 20 cases).

You need to find your own representation of OCaml code to implement the above and to write your tests accordingly. 

Keep in mind that only type inference mattes so any constants in the corresponding OCaml code become basic types. For example "let v = 3" gets translated as "gvLet(v, T, int)" since  3->int and we do not care about values, only types.

Running the code
================

A) Start the SWI prolog interpreter (run swipl 
on Lixnux and swipl.exe on Windows).

[alin@localhost typeInf]$ swipl
Welcome to SWI-Prolog (threaded, 64 bits, version 7.6.4)
-------
?-

B) Load your code (do this every time you change the code)
?- [typeInf].

C) Ask questions
?- typeExp(iplus(X,Y), T).
X = Y, Y = T, T = int.

D) Trace execution (to get step by step execution)
?- trace.
[trace]  ?- typeExp(iplus(X,Y), T).
    Call: (8) typeExp(iplus(_3446, _3448), _3454) ? 

Press "h" to see all the options on how to interact 
with the tracer. Enter performs one step, "a" aborts.

E) Stop tracing for example if you want to  avoid stepped
execution for a while.
?- notrace.

Writing and running unit tests
==============================

Advice: In general, the best advice is to practice 
Test Driven Development for this assignment. That is, 
write tests before you even write the code and run
tests to see your progress. If things do not pass, run 
with tracing. 

For an introduction to unit tests see:
http://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/plunit.html%27)

For a complete example see:
http://www.paulbrownmagic.com/blog/swi_prolog_unit_testing_env

The easiest way to write and run unit tests is to place them
in a .plt file. typeInf.plt already contains some tests and 
provides a complete framework.

A) Adding tests. Read the documentation above and see the 
examples in order to write your own tests. 

My advice is add tests for each component but you must have 
at least 20 tests for infer(Code,T) which is the top predicate
(entry point). Code is a list of statements and T is the infered
type of the last statement in the list. 

B) Running tests
    1. Run all tests
?- consult("typeInf.plt"), run_tests().

    2. Run one specific tests
?- consult("typeInf.plt"), run_tests(typeInf:testname).

    3. Run specific test with trcing to debug
?- trace, consult("typeInf.plt"), run_tests(typeInf:testname).

C) Changing tests

If you change the test or de code, rerun 
?- load_test_files([]).

Then you can rerun
?- run_tests().

Bonus [20%]
=====

A. Add sum types
B. Add tuple types
C. Add templated assignment to unpack tuples
D. Add match statements support 
