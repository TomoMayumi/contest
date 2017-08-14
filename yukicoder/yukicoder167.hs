import Control.Applicative
import Data.Maybe
import Data.List

solve 0 0 = 1
solve 0 _ = 0
solve _ 0 = 1
solve n m = as!!((c+b-2)`mod`b)
        where
          (a:as) = map ((`mod`10).(n^)) [1..9]
          b      = 1 + (fromJust $ findIndex (==a) $ as)
          c      = (fromIntegral m)`mod`b

main = do
  n <- read . (:[]) . last <$> getLine
  m <- read <$> getLine
  print $ solve n m