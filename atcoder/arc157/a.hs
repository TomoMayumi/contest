main = do
    [n,a,b,c,d] <- map read . words <$> getLine
    putStrLn $ if (abs (b-c)) > 1 || (b+c==0 && a>0 && d>0) then "No" else "Yes"
