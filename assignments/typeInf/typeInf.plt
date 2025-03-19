:- begin_tests(typeInf).
:- include(typeInf). 

/* Note: when writing tests keep in mind that 
    the use of of global variable and function definitions
    define facts for gvar() predicate. Either test
    directy infer() predicate or call
    delegeGVars() predicate to clean up gvar().
*/

% tests for typeExp
test(typeExp_iplus) :- 
    typeExp(iplus(int,int), int).

% this test should fail
test(typeExp_iplus_F, [fail]) :-
    typeExp(iplus(int, int), float).

test(typeExp_iplus_T, [true(T == int)]) :-
    typeExp(iplus(int, int), T).

/* My test cases:
1. minus
2. times
3. divide
4. less than
5. greater than
6. equals
*/
% 1. times
test(typeExp_iminus) :-
	typeExp(itimes(int,int), int).
	
% this test should fail
test(typeExp_iminus_F, [fail]) :-
    typeExp(iminus(int, int), float).

test(typeExp_iminus_T, [true(T == int)]) :-
    typeExp(iminus(int, int), T).

% 2. times
test(typeExp_itimes) :-
	typeExp(itimes(int,int), int).
	
% this test should fail
test(typeExp_itimes_F, [fail]) :-
    typeExp(itimes(int, int), float).

test(typeExp_itimes_T, [true(T == int)]) :-
    typeExp(itimes(int, int), T).

% 4. less than
test(typeExp_ilessthan) :-
	typeExp(ilessthan(int,int), bool).
	
% this test should fail
test(typeExp_ilessthan_F, [fail]) :-
    typeExp(ilessthan(int, int), float).

test(typeExp_ilessthan_T, [true(T == bool)]) :-
    typeExp(ilessthan(int, int), T).

% 5. greater than
test(typeExp_igreaterthan) :-
	typeExp(igreaterthan(int,int), bool).
	
% this test should fail
test(typeExp_igreaterthan_F, [fail]) :-
    typeExp(igreaterthan(int, int), float).

test(typeExp_igreaterthan_T, [true(T == bool)]) :-
    typeExp(igreaterthan(int, int), T).

% 6. equals
test(typeExp_iequals) :-
	typeExp(iequals(int,int), bool).
	
% this test should fail
test(typeExp_iequals_F, [fail]) :-
    typeExp(iequals(int, int), float).

test(typeExp_iequals_T, [true(T == bool)]) :-
    typeExp(iequals(int, int), T).
    
/* End of my test cases:
1. minus
2. times
3. divide
4. less than
5. greater than
6. equals
*/

% NOTE: use nondet as option to test if the test is nondeterministic

% test for statement with state cleaning
test(typeStatement_gvar, [nondet, true(T == int)]) :- % should succeed with T=int
    deleteGVars(), /* clean up variables */
    typeStatement(gvLet(v, T, iplus(X, Y)), unit),
    assertion(X == int), assertion( Y == int), % make sure the types are int
    gvar(v, int). % make sure the global variable is defined

test(typeStatement_gfLet, [nondet, true(T == int)]) :-
    deleteGVars(), /* clean up variables */
    typeStatement(gfLet(add, [X, Y], iplus(X, Y)), T),
    assertion(X == int), assertion(Y == int), % make sure the types are int
    gvar(add, [int, int, int]). % make sure the global function is defined


/* My test cases for typeStatements():
1. gvLet(v, T, int) ~ let v = 3; 3 is an int
2. gvLet(v, T, float) ~ let v = 3.4 is a float
3. gfLet(add, [X, Y], iplus(X, Y), int) -> let add x y = x + y;

*/

% 1. test for statement let v = 3;
test(typeStatement_gvLet_int, [nondet, true(T == int)]) :- % should succeed with T=int
    deleteGVars(), /* clean up variables */
    typeStatement(gvLet(v, T, int), unit),
    assertion(T == int), % set the type T to be an int
    gvar(v, int). % make sure the global variable is defined

% 2. test for statement let v = 3.4;
test(typeStatement_gvLet_float, [nondet, true(T == float)]) :- % should succeed with T=int
    deleteGVars(), /* clean up variables */
    typeStatement(gvLet(v, T, float), unit),
    assertion(T == float), % set the type T to be a float
    gvar(v, float). % make sure the global variable is defined

/* End of my test cases for typeStatements():
1. gvLet(v, T, int) ~ let v = 3; 3 is an int
2. gvLet(v, T, float) ~ let v = 3.4 is a float
3. gfLet(add, [X, Y], iplus(X, Y), int) -> let add x y = x + y;

*/
% same test as above but with infer 
test(infer_gvar, [nondet]) :-
    infer([gvLet(v, T, iplus(X, Y))], unit),
    assertion(T==int), assertion(X==int), assertion(Y=int),
    gvar(v,int).

% test custom function with mocked definition
test(mockedFct, [nondet]) :-
    deleteGVars(), % clean up variables since we cannot use infer
    asserta(gvar(my_fct, [int, float])), % add my_fct(int)-> float to the gloval variables
    typeExp(my_fct(X), T), % infer type of expression using or function
    assertion(X==int), assertion(T==float). % make sure the types infered are correct

:-end_tests(typeInf).