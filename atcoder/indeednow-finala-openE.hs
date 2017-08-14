import Control.Applicative
import Control.Monad
import Data.Array


getInts = map read . words <$> getLine

main = do
  [n,m] <- getInts
  l <- replicateM m getInts
  let
      good :: Array Int [Int]
      good = array (1,n) [(i,map head $ filter ((==i).last) l) | i <- [1..n]]
      size :: Array Int Int
      size = array (1,n) [(i,length $ filter ((==i).head) l) | i <- [1..n]]
      pr :: Array Int Double
      pr = array (1,n) [(i,0.1+0.9*sum (map (\j->(pr!j)/fromIntegral(size!j)) (good!i)))|i<-[1..n]]
  mapM_ (print . (pr!)) [1..n]