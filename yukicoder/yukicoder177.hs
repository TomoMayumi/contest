import Control.Applicative

maxflow :: [(Int,Int,Int)] -> (Int,Int) -> Int
maxflow edges (src,dst) = 

getInt = read <$> getLine
getInts = map read . words <$> getLine

main = do
  w <- getInt
  n <- getInt
  j <- getInts
  m <- getInt
  c <- getInts
  q <- replicateM m getInts