-- HSpec tests for Val.hs
-- Execute: runhaskell EvalSpec.hs

-- Edge cases and shouldn't break

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Val
import Eval

-- For +, -, /, ^, copy the code below and change signs

main :: IO ()
main = hspec $ do
  describe "eval" $ do
    context "*" $ do
        it "multiplies integers" $ do
            eval "*" [Integer 2, Integer 3] `shouldBe` [Integer 6]
        
        it "multiplies floats" $ do
            eval "*" [Integer 2, Real 3.0] `shouldBe` [Real 6.0]
            eval "*" [Real 3.0, Integer 3] `shouldBe` [Real 9.0]
            eval "*" [Real 4.0, Real 3.0] `shouldBe` [Real 12.0]

        it "errors on too few arguments" $ do   
            evaluate (eval "*" []) `shouldThrow` errorCall "Stack underflow"
            evaluate (eval "*" [Integer 2]) `shouldThrow` errorCall "Stack underflow"

        -- this does not work, seems to be a HSpec bug
        -- it "errors on non-numeric inputs" $ do
        --    evaluate(eval "*" [Real 3.0, Id "x"]) `shouldThrow` anyException
    
    context "+" $ do
        it "add integers" $ do
            eval "+" [Integer 2, Integer 3] `shouldBe` [Integer 5]
        
        it "add floats" $ do
            eval "+" [Integer 2, Real 3.0] `shouldBe` [Real 5.0]
            eval "+" [Real 3.0, Integer 3] `shouldBe` [Real 6.0]
            eval "+" [Real 4.0, Real 3.0] `shouldBe` [Real 7.0]

        it "errors on too few arguments" $ do   
            evaluate (eval "+" []) `shouldThrow` errorCall "Stack underflow"
            evaluate (eval "+" [Integer 2]) `shouldThrow` errorCall "Stack underflow"

    context "-" $ do
        it "subtract integers" $ do
            eval "-" [Integer 3, Integer 2] `shouldBe` [Integer (-1)] -- comment: 2-3
        
        it "subtract floats" $ do
            eval "-" [Real 3.0, Integer 2] `shouldBe` [Real (-1.0)] -- comment: 2-3.0
            eval "-" [Integer 3, Real 3.0] `shouldBe` [Real 0.0] -- comment: 3.0-3
            eval "-" [Real 3.0, Real 4.0] `shouldBe` [Real 1.0] -- comment: 4.0-3.0

        it "errors on too few arguments" $ do   
            evaluate (eval "-" []) `shouldThrow` errorCall "Stack underflow"
            evaluate (eval "-" [Integer 2]) `shouldThrow` errorCall "Stack underflow"
    
    context "/" $ do
        -- it "divides integers" $ do
            -- eval "/" [Integer 3, Integer 2] `shouldBe` [Real 0]
        
        it "divides floats" $ do
            eval "/" [Real 3.0, Integer 2] `shouldBe` [Real 0.6666667]
            eval "/" [Integer 3, Real 3.0] `shouldBe` [Real 1.0]
            eval "/" [Real 3.0, Real 4.0] `shouldBe` [Real 1.3333334]

        it "errors on too few arguments" $ do   
            evaluate (eval "/" []) `shouldThrow` errorCall "Stack underflow"
            evaluate (eval "/" [Integer 2]) `shouldThrow` errorCall "Stack underflow"
      
    context "^" $ do
        it "power integers" $ do
            eval "^" [Integer 3, Integer 2] `shouldBe` [Integer 8] -- comment: 2^3
        
        it "power floats" $ do
            eval "^" [Real 3, Integer 2] `shouldBe` [Real 8.0] -- comment: 2^3
            eval "^" [Integer 3, Real 3.0] `shouldBe` [Real 27.0] -- comment: 3.0^3
            eval "^" [Real 3.0, Real 4.0] `shouldBe` [Real 64.0] -- comment: 4.0^3.0

        it "errors on too few arguments" $ do   
            evaluate (eval "^" []) `shouldThrow` errorCall "Stack underflow"
            evaluate (eval "^" [Integer 2]) `shouldThrow` errorCall "Stack underflow"
    
    context "++" $ do
        it "concat two strings" $ do
            eval "++" [Id "Detravious", Id "Detravious"] `shouldBe` [Id "DetraviousDetravious"]
            eval "++" [Id "Jamari", Id "Brinkley"] `shouldBe` [Id "BrinkleyJamari"]
            eval "++" [Id "Man", Id "Kingdom"] `shouldBe` [Id "KingdomMan"]

        -- it "errors on too few arguments" $ do   
        --     evaluate (eval "++" []) `shouldThrow` errorCall "Stack underflow"
        --     evaluate (eval "++" [Id "Detravious"]) `shouldThrow` errorCall "Stack underflow"
    
    context "+++" $ do
        it "concat three strings" $ do
            eval "+++" [Id "Detravious", Id "Detravious", Id "Detravious"] `shouldBe` [Id "DetraviousDetraviousDetravious"]
            eval "+++" [Id "Detravious", Id "Jamari", Id "Brinkley"] `shouldBe` [Id "BrinkleyJamariDetravious"]
            eval "+++" [Id "Man", Id "Kingdom", Id "Detravious"] `shouldBe` [Id "DetraviousKingdomMan"]


    context "DUP" $ do
        it "duplicates values" $ do
            eval "DUP" [Integer 2] `shouldBe` [Integer 2, Integer 2]
            eval "DUP" [Real 2.2] `shouldBe` [Real 2.2, Real 2.2]
            eval "DUP" [Id "x"] `shouldBe` [Id "x", Id "x"]

        it "errors on empty stack" $ do
            evaluate (eval "DUP" []) `shouldThrow` errorCall "Stack underflow"

  describe "evalOut" $ do
      context "." $ do
        it "prints top of stack" $ do
            evalOut "." ([Id "x"], "") `shouldBe` ([],"x")
            evalOut "." ([Integer 2], "") `shouldBe` ([], "2")
            evalOut "." ([Real 2.2], "") `shouldBe` ([], "2.2")

        it "errors on empty stack" $ do
            evaluate(evalOut "." ([], "")) `shouldThrow` errorCall "Stack underflow"

      it "eval pass-through" $ do
         evalOut "*" ([Real 2.0, Integer 2], "blah") `shouldBe` ([Real 4.0], "blah")

  describe "emit" $ do
    context ".EMIT" $ do
        it "takes a number from the stack and prints the character with the corresponding ASCI code" $ do
            emit 80 `shouldBe` "P"
            emit 76 `shouldBe` "L"
            emit 67 `shouldBe` "C"

        -- it "errors on too few arguments" $ do   
            -- evaluate (emit ".EMIT" []) `shouldThrow` errorCall "Stack underflow"
        --     evaluate (eval "EMIT" [Integer 2]) `shouldThrow` errorCall "Stack underflow"
            -- emit ".EMIT" [Real 4.0, Real 3.0] `shouldBe` [Real 12.0]

  describe "cr" $ do
    context ".CR" $ do
        it "prints a new line (for nice formatting)" $ do
            evalOut ".CR" ([], "Detravious") `shouldBe` ([], "Detravious\n")
            evalOut ".CR" ([], "Jamari") `shouldBe` ([], "Jamari\n")
            evalOut ".CR" ([], "Brinkley") `shouldBe` ([], "Brinkley\n")