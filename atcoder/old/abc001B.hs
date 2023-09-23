import Control.Applicative

vv m
  | calc < 10 = '0':show calc
  | otherwise = show calc
    where
      calc
        | m < 100    = 0
        | m <= 5000  = m`div`100
        | m <= 30000 = m`div`1000+50
        | m <= 70000 = (m`div`1000-30)`div`5+80
        | otherwise  = 89

main = do
  m <- read <$> getLine
  putStrLn $ vv m