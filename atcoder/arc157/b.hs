main = do
    [n,k] <- map read . words <$> getLine
    s <- getLine
    let x = length $ filter ('X'==) s
    let y = n - x
    let ans = length $ filter (('Y','Y')==) $ zip s (tail s)
    let yxy = length $ filter (('Y','X','Y')==) $ zip3 s (tail s) (tail $ tail s)
    let xyx = length $ filter (('X','Y','X')==) $ zip3 s (tail s) (tail $ tail s)
    print $ case 1 of
        _   | y == 0    -> k - 1
            | k > x     -> n - 1 - ( case k-x of
                                        d   | d <= y-xyx -> d
                                            | otherwise  -> d + d-(y-xyx)
            )
            | k == x    -> n - 1
            | k <= yxy  -> ans + k * 2
            | otherwise -> ans + yxy * 2 + (k - yxy)
