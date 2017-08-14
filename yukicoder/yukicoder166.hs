import Control.Applicative
main = do
  [h,w,n,k] <- map read . words <$> getLine
  putStrLn $ if h*w`mod`n==k`mod`n then "YES" else "NO"