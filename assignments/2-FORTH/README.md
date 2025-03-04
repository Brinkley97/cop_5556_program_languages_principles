
## Assignment 2

In this assignment, I implement various function in the functional programming type called  `Haskell` while integrating the workflows around `cabal`, the package/builder manager. Test cases are written in a stack-oriented procdural language called `FORTH (.4TH)`.

See [Requirements.md](https://github.com/Brinkley97/cop_5556_program_languages_principles/blob/main/assignments/2-FORTH/Requirements.md) to get a sense of what was expected.

Download `Haskell` : https://www.haskell.org/downloads/

How to use `cabal`: https://www.haskell.org/cabal/users-guide/developing-packages.html

## Installations

Make sure you are inside the FORTH directory and beware of other installation issues that I'm not documenting (do to how many there were).
```
cabal install
cabal install hbase
cabal install hspec --lib
cabal install quickcheck --lib
cabal install flow --lib
```

## Running the unit tests

The easiest way to run the unit HSpec tests is using `runhaskell` command.
```
runhaskell ValSpec.hs
runhaskell EvalSpec.hs
runhaskell InterpretSpec.hs
```

## TODOs

1. Change the code in `Main.hs` so that, if the stack is not empty at the end of execution, a message gets printed on the screen saying so and the stack content gets printed. Make sure at least one of your test cases covers this situation.

2. Add more built-in function definitions to `Eval.hs` and write unit tests for them in `EvalSpec.hs`. The `*.out` file is the correct solution to that test case. of the code. Run each as `cabal run FORTH test/t*.4TH`
   ![Screenshot 2025-03-03 at 21 16 12](https://github.com/user-attachments/assets/ae02b251-4531-44f9-938b-3a22805c3da9)


## Situations you encountered

1. `t3.4TH` test case is: 2 3 - . I process this (and every input file) as 2 - 3, hence why output is -1.
2. **Bugs with inital code:** I sent first email/created a discussion thread on Mon. 24 Feb. There were no response to this via email, so I attend OH on 26th to resolve issue. Two days delay. **Follow-up questions:** I sent email on 26th (after OH). Response via email same day. I attend OH on 27th, then follow up again via email. My questions and thoughts were never answered resulting in having to rely on my own assumptions. **Grading understanding:** Given the delays and some no responses, I may not have all of what's requested, so I ask for you grade according to my assumptions.
3. The base code for “*” only works for two numbers. Thus, my +, -, /, ^ does same without extending to more numbers as there were no instructions to extend to more than two numbers, nor any unit test cases doing so.
4. Requirement of “converts the argument into a string (needs to work for all types)” is unclear. Are you saying all types in the base code (which I my assumption) or all types in Haskell?
5. In `EvalSpec.hs` when testing `CONCAT2` and `CONCAT3`, be sure to *(Un)Comment to test*.
6. Requirements stated to run `runhaskell ValSpec.hs` and `InterpretSpec.hs`, but didn't mention anything about writing code there, so I'm leaving as base code.

## Self-exploratory resources I found beneficial

1. [Learn You a Haskell for Great Good!](https://learnyouahaskell.com/chapters)
2. [Learn You a Haskell for Great Good!](https://learnyouahaskell.github.io/chapters.html) --- Seems to be more recent and more visually appealing than [1]
3. [List of Operators – Haskell](https://www.learningcardano.com/list-of-operators-haskell/)
4. [Haskell Cheat Sheet](https://hackage.haskell.org/package/CheatSheet-1.5/src/CheatSheet.pdf)
5. [HaskellWiki](https://wiki.haskell.org/Keywords)
6. WEBSITE: [Haskell 2010 Language Report](https://www.haskell.org/onlinereport/haskell2010/haskell.html#haskellpa1.html)
7. BOOK: [Real World Haskell](https://book.realworldhaskell.org/)
8. TUTORIAL: [Learn Haskell by building a blog generator](https://learn-haskell.blog/)
9. BOOK: [A Gentle Introduction to Haskell Version 98] https://www.haskell.org/tutorial/



