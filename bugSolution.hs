The solution involves using `mapM_` (or `sequence_`) to force the evaluation of the IO actions.

```haskell
import Control.Monad

main :: IO ()
main = do
  mapM_ ("x -> print x) [x | x <- [1..5], even x]
  print "done"
```

`mapM_` applies a function to each element of a list in the IO monad, ensuring that the side effects (printing) happen sequentially.  `sequence_` is a more general solution that works for any monad, but in this case `mapM_` is more readable and efficient. This modification guarantees that even numbers are printed *before* "done".