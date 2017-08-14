import Control.Applicative

main = do
  [r,g,b] <- map read . words <$> getLine
  let cost gl = sum $ map abs $ [rl..rl+r-1] ++ [gl..gl+g-1] ++ [bl..bl+b-1]
        where
          rl = (min (-100-r`div`2) (gl-r)) + 100
          bl = (max (gl+g) (100-b`div`2))  - 100
  print $ minimum $ map cost [-350..50]