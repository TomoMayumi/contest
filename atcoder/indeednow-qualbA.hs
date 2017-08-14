import Control.Applicative

main = do
  [x1,y1,x2,y2] <- map read . words <$> getContents
  print $ abs (x1-x2) + abs (y1-y2) + 1  
