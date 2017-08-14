import Control.Applicative
import Control.Monad
import Data.Array
import Data.List

combinations 0 _ = [[]]
combinations n [] = []
combinations n (x:xs) = (map (x:) $ combinations (n-1) xs) ++ combinations n xs

solve n l = find (\i->any (\j->all (\k->elem k l) $ combinations 2 j) $ combinations i [1..n]) [n,n-1..1]

main = do
  [n,m] <- map read . words <$> getLine
  l <- replicateM m $ map read . words <$> getLine
  print $ solve n l
