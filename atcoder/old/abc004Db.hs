import Control.Applicative
import Data.Array

main = do
  [r,g,b] <- map read . words <$> getLine
  let ra = ((-650,0),(650,r+g+b))
      dp = listArray ra [dfs i j|(i,j)<-range ra]
      dfs i j
        | j==0      = 0
        | i==(-650)   = 2^30
        | otherwise = min (dp!(i-1,j)) (dp!(i-1,j-1) + cost i j)
      cost i j
        | j <= r    = abs $ i+100
        | j <= r+g  = abs $ i
        | otherwise = abs $ i-100
  print $ dp!(650,r+g+b)