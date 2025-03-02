module Eval where
-- This file contains definitions for functions and operators

import Val

import Data.Char (chr)


-- Convert integer to ASCII character string representation
emit :: Int -> String
emit = (:[]) . chr

-- main evaluation function for operators and 
-- built-in FORTH functions with no output
-- takes a string and a stack and returns the stack
-- resulting from evaluation of the function
eval :: String -> [Val] -> [Val]
-- Multiplication
-- if arguments are integers, keep result as integer
eval "*" (Integer x: Integer y:tl) = Integer (x*y) : tl
-- if any argument is float, make result a float
eval "*" (x:y:tl) = (Real $ toFloat x * toFloat y) : tl 
-- any remaining cases are stacks too short
eval "*" _ = error("Stack underflow")

-- Addition
-- if arguments are integers, keep result as integer
eval "+" (Integer x: Integer y:tl) = Integer (x+y) : tl
-- if any argument is float, make result a float
eval "+" (x:y:tl) = (Real $ toFloat x + toFloat y) : tl 
-- any remaining cases are stacks too short
eval "+" _ = error("Stack underflow")

-- Subtraction
-- if arguments are integers, keep result as integer
eval "-" (Integer x: Integer y:tl) = Integer (y-x) : tl
-- if any argument is float, make result a float
eval "-" (x:y:tl) = (Real $ toFloat y - toFloat x) : tl 
-- any remaining cases are stacks too short
eval "-" _ = error("Stack underflow")

-- Division
-- if arguments are integers, keep result as integer
eval "/" (Integer x: Integer y:tl) = Integer (y`div`x) : tl
-- if any argument is float, make result a float
eval "/" (x:y:tl) = (Real $ toFloat y / toFloat x) : tl 
-- any remaining cases are stacks too short
eval "/" _ = error("Stack underflow")

-- Power
-- if arguments are integers, keep result as integer
eval "^" (Integer x: Integer y:tl) | x >= 0 = Integer (y^x) : tl
-- if any argument is float or exponent is negative, make result a float
eval "^" (x:y:tl) = (Real $ toFloat y ** toFloat x) : tl
-- any remaining cases are stacks too short
eval "^" _ = error("Stack underflow")

-- Duplicate the element at the top of the stack
eval "DUP" (x:tl) = (x:x:tl)
eval "DUP" [] = error("Stack underflow")

-- this must be the last rule
-- it assumes that no match is made and preserves the string as argument
eval s l = Id s : l 

-- Extended eval function with output capabilities
-- Consolidated logic under a single handler for "."
evalOut :: String -> ([Val], String) -> ([Val], String)
evalOut "." (stack, output) = case stack of
    [] -> error "Stack underflow"
    (Id x:tl) -> (tl, output ++ x)
    (Integer i:tl) -> let
        char = emit i
        updatedOutput = output ++ char
        in (tl, updatedOutput)
    (Real x:tl) -> (tl, output ++ (show x))
evalOut op (stack, out) = (eval op stack, out) -- General operations handled by eval