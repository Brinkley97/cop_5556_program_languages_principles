module Eval where
-- This file contains definitions for functions and operators

import Val

import Data.Char (chr)

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
-- if arguments are integers, make result as real/float
eval "/" (Integer x: Integer y:tl) = Real (toFloat (Integer y) / toFloat (Integer x)) : tl
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

eval "++" (Id x: Id y:tl) = Id (y++x) : tl -- CONCAT2
eval "+++" (Id x: Id y: Id z:tl) = Id (z++y++x) : tl -- CONCAT3

-- Duplicate the element at the top of the stack
eval "DUP" (x:tl) = (x:x:tl)
eval "DUP" [] = error("Stack underflow")

-- this must be the last rule
-- it assumes that no match is made and preserves the string as argument
eval s l = Id s : l 

-- variant of eval with output
-- state is a stack and string pair
evalOut :: String -> ([Val], String) -> ([Val], String)
-- print element at the top of the stack
evalOut "." (Id x:tl, out) = (tl, out ++ x)
evalOut "." (Integer i:tl, out) = (tl, out ++ (show i))
evalOut "." (Real x:tl, out) = (tl, out ++ (show x))
evalOut "." ([], _) = error "Stack underflow"

-- evalOut ".EMIT" (Integer x:tl, output) = let 
--     char = emit x
--     updatedOutput = emitUpdateStackOut tl char 
--     in updatedOutput

evalOut op (Integer x:tl, output)
    | op == ".EMIT" = let 
        char = emit x
        updatedOutput = emitUpdateStackOut tl (output ++ char)
        in updatedOutput
    | op == ".STR" = (tl, "\"" ++ output ++ strOut (Integer x) ++ "\"")

evalOut ".CR" (stack, output) = (stack, output ++ cr)

-- evalOut ".STR" (Integer x:stack, output) = (stack, output ++ "\"" ++ show x ++ "\"")

-- this has to be the last case
-- if no special case, ask eval to deal with it and propagate output
evalOut op (stack, out) = (eval op stack, out)

-- Convert integer to ASCII character string representation
emit :: Int -> String
emit = (:[]) . chr

-- Update stack and concatenated output with ASCII character
emitUpdateStackOut :: [Val] -> String -> ([Val], String)
emitUpdateStackOut stack inputChar = (stack, inputChar)

cr :: String
cr = "\n"

-- Convert argumnet to String
strOut :: Val -> String
-- strOut (Integer x) = "\"" ++ show x ++ "\""
strOut (Integer x) = show x
strOut (Real x) = show x
