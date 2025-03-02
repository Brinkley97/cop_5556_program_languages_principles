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
        it "divides integers" $ do
            eval "/" [Integer 3, Integer 2] `shouldBe` [Real 0]
        
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