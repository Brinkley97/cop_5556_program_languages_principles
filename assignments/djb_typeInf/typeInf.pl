/* match functions by unifying with arguments 
    and infering the result
*/
typeExp(Fct, T):-
    \+ var(Fct), /* make sure Fct is not a variable */ 
    \+ atom(Fct), /* or an atom */
    functor(Fct, Fname, _Nargs), /* ensure we have a functor */
    !, /* if we make it here we do not try anything else */
    Fct =.. [Fname|Args], /* get list of arguments */
    append(Args, [T], FType), /* make it loook like a function signature */
    functionType(Fname, TArgs), /* get type of arguments from definition */
    typeExpList(FType, TArgs). /* recurisvely match types */

/* propagate types */
typeExp(T, T).
/* typeExp(return(Expression), T) :-
    typeExp(Expression, T),
    bType(T)
*/

/* list version to allow function mathine */
typeExpList([], []).
typeExpList([Hin|Tin], [Hout|Tout]):-
    typeExp(Hin, Hout), /* type infer the head */
    typeExpList(Tin, Tout). /* recurse */

/* TODO: add statements types and their type checking */
/* global variable definition
    Example:
        1. gvLet(v, T, int) ~ let v = 3;
        2. if
        3. for (in OCaml)
            for variable = start_value to end_value do
                expression
            done
        4. 
 */
typeStatement(gvLet(Name, T, Code), unit):-
    atom(Name), /* make sure we have a bound name */
    typeExp(Code, T), /* infer the type of Code and ensure it is T */
    bType(T), /* make sure we have an infered type */
    asserta(gvar(Name, T)). /* add definition to database */


% gfLet(add, [X, Y], iplus(X, Y), int) -> let add x y = x + y;
typeStatement(gfLet(Name, Params, Code), T):-
    atom(Name), /* make sure we have a bound name */
    is_list(Params), /* make sure we have a list of parameters */
    maplist(typeExp, Params, ParamTypes), /* infer types of parameters */
    typeExp(Code, T), /* infer the type of Code and ensure it is T */
    bType(T),  /* make sure we have an inferred type */
    append(ParamTypes, [T], FType), /* type for a function ...args, return type */
    asserta(gvar(Name, FType)). /* add definition to database */

/*
typeStatement(gfLet(Name, Params, Code), T):-
    atom(Name),
    is_list(Params),
    maplist(typeExp, Params, ParamTypes),
    (   is_list(Code)
    ->  typeCode(Code, T)
    ;   typeExp(Code, T)
    ),
    bType(T),
    append(ParamTypes, [T], FType),
    asserta(gvar(Name, FType)).
*/

/* 2. if */
typeStatement(if(Cond, ThenStmt, ElseStmt), T) :-
    typeExp(Cond, bool),  % Ensure condition is a boolean
    typeStatement(ThenStmt, T),  % Infer type of the 'then' branch
    typeStatement(ElseStmt, T),  % Infer type of the 'else' branch
    bType(T).  % Ensure we inferred a valid type


/* 3. for (in OCaml)
    for variable = start_value to end_value do
        expression
    done 
*/
typeStatement(for(Var, Start, End, Body), unit) :-
    typeExp(Start, int),    % Ensure start_value is an integer
    typeExp(End, int),      % Ensure end_value is an integer
    asserta(lvar(Var, int)),  % Declare Var as an integer inside loop
    writeln(['Loop var added:', Var]),  % Debugging print
    typeStatement(Body, unit),   % Type check the loop body (must be unit)
    retract(lvar(Var, int)). % Remove loop variable after processing


/* Code is simply a list of statements. The type is 
    the type of the last statement 
*/
typeCode([S], T):-typeStatement(S, T).
typeCode([S, S2|Code], T):-
    typeStatement(S,_T),
    typeCode([S2|Code], T).

/* My typeCode
    1. for loop
*/

typeCode(print(X), unit):-
    fType(print, [T, unit]),
    typeExp(X, T).

/* top level function */
infer(Code, T) :-
    is_list(Code), /* make sure Code is a list */
    deleteGVars(), /* delete all global definitions */
    typeCode(Code, T).

/* Basic types
    TODO: add more types if needed
 */
bType(int).
bType(float).
bType(string).
bType(unit). /* unit type for things that are not expressions */
/*  functions type.
    The type is a list, the last element is the return type
    E.g. add: int->int->int is represented as [int, int, int]
    and can be called as add(1,2)->3
 */
bType([H]):- bType(H).
bType([H|T]):- bType(H), bType(T).

/*
    TODO: as you encounter global variable definitions
    or global functions add their definitions to 
    the database using:
        asserta( gvar(Name, Type) )
    To check the types as you encounter them in the code
    use:
        gvar(Name, Type) with the Name bound to the name.
    Type will be bound to the global type
    Examples:
        g

    Call the predicate deleveGVars() to delete all global 
    variables. Best wy to do this is in your top predicate
*/

deleteGVars():-retractall(gvar), asserta(gvar(_X,_Y):-false()).

/*  builtin functions
    Each definition specifies the name and the 
    type as a function type

    TODO: add more functions
*/

fType(iplus, [int,int,int]).
fType(fplus, [float, float, float]).
fType(fToInt, [float,int]).
fType(iToFloat, [int,float]).
fType(print, [_X, unit]). /* simple print */

% My fType definitions
fType(iminus, [int, int, int]).
fType(itimes, [int, int, int]).
fType(ilessthan, [int, int, bool]).
fType(igreaterthan, [int, int, bool]).
fType(iequals, [int, int, bool]).

/* Find function signature
   A function is either buld in using fType or
   added as a user definition with gvar(fct, List)
*/

% Check the user defined functions first
functionType(Name, Args):-
    gvar(Name, Args),
    is_list(Args). % make sure we have a function not a simple variable

% Check first built in functions
functionType(Name, Args) :-
    fType(Name, Args), !. % make deterministic

% This gets wiped out but we have it here to make the linter happy
gvar(_, _) :- false().

:- dynamic gvar/2.