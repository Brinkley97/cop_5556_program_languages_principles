module Main where

-- Running: runaskell Main.hs path_to_test_file

import Interpret
import System.Environment

main :: IO ()
main = do
    (fileName:tl) <- getArgs
    contents <- readFile fileName
    -- putStrLn $ " "
    -- putStrLn $ "Contents in file: " ++ contents
    -- putStrLn $ " "
    let (stack, output) = interpret contents 
    putStrLn output

    -- if the stack is not empty at the end of execution, a message gets printed on the screen saying so and the stack content gets printed.
    -- null is a standard library function that checks if a list is empty
    if null stack
        then
            return ()
        else
            putStrLn "The stack is not empty at the end of execution. It has elements: " >> print stack

    return ()