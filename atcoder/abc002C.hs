import Control.Applicative

areaTriangle a b c d = (a*d-b*c) / 2

main = do
  [a,b,c,d,e,f] <- map read . words <$> getLine
  print $ abs $ (areaTriangle a b c d) + (areaTriangle c d e f) + (areaTriangle e f a b)