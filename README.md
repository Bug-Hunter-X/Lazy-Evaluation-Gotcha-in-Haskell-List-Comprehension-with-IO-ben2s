# Haskell Lazy Evaluation Bug

This repository demonstrates a subtle bug in Haskell related to lazy evaluation and the interaction between `IO` actions and list comprehensions. The core issue is that side effects within a list comprehension might not be executed immediately, leading to unexpected behavior.

## The Bug

The provided `bug.hs` file contains a Haskell program that attempts to print even numbers from 1 to 5 using a list comprehension. However, due to lazy evaluation, the `print` statements inside the comprehension are not executed before the final `print "done"`. This leads to the "done" message being printed before any even numbers.

## The Solution

The `bugSolution.hs` file presents a corrected version using `mapM_` to explicitly force the evaluation of the `IO` actions within the list comprehension, ensuring that the side effects occur in the intended order.