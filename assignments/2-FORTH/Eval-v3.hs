module Eval where
-- This file contains definitions for functions and operators

import Val

import Data.Char (chr)


-- Helper functions
extractInteger :: [Val] -> Int
extractInteger (Integer x:_) = x
extractInteger _ = error "Expected an integer value on top of stack"

-- Convert integer to ASCII character string representation
intToChar :: Int -> String
intToChar = (:[]) . chr

-- Update stack and concatenated output with ASCII character
updateStackOut :: [Val] -> String -> ([Val], String)
updateStackOut stack newChar = (stack, newChar)

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

-- Emit function to convert Int to Char
-- emit :: Int -> String
-- emit n = [chr n]

-- -- Function to update the stack and string tuple
-- updateStackStringTuple :: [Val] -> String -> ([Val], String)
-- updateStackStringTuple stack str = (stack, str)

-- -- Function to filter Integer values from the stack
-- filtIntFromStack :: [Val] -> [Int]
-- filtIntFromStack [] = []
-- filtIntFromStack (Integer i : tl) = i : filtIntFromStack tl
-- filtIntFromStack (_ : tl) = filtIntFromStack tl

-- -- Emit operation
-- eval "EMIT" stack =
--     let filtInt = filtIntFromStack stack
--         emitChar = concatMap emit filtInt
--         (newStack, _) = updateStackStringTuple stack emitChar
--     in newStack

-- Duplicate the element at the top of the stack
eval "DUP" (x:tl) = (x:x:tl)
eval "DUP" [] = error("Stack underflow")

-- this must be the last rule
-- it assumes that no match is made and preserves the string as argument
eval s l = Id s : l 

-- variant of eval with output
-- state is a stack and string pair
-- evalOut :: String -> ([Val], String) -> ([Val], String)
-- print element at the top of the stack
-- evalOut "." (Id x:tl, out) = (tl, out ++ x)
-- evalOut "." (Integer i:tl, out) = (tl, out ++ (show i))
-- evalOut "." (Real x:tl, out) = (tl, out ++ (show x))
-- evalOut "." ([], _) = error "Stack underflow"

evalOut :: String -> ([Val], String) -> ([Val], String)
evalOut "." (stack, output) = case stack of
    [] -> error "Stack underflow"
    (Id x:tl) -> (tl, output ++ x)
    (Integer x:tl) -> let
        char = intToChar x
        updatedOutput = output ++ char
        in if x >= 32 && x <= 126 -- ASCII printable characters range
           then (tl, updatedOutput)
           else (tl, output ++ show x)
    (Real x:tl) -> (tl, output ++ show x)
evalOut op (stack, out) = (eval op stack, out) -- General operations handled by eval

-- Definitions for eval keep as they were


-- this has to be the last case
-- if no special case, ask eval to deal with it and propagate output
-- evalOut op (stack, out) = (eval op stack, out)
