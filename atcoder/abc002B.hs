god [] = []
god ('a':xs) = god xs
god ('i':xs) = god xs
god ('u':xs) = god xs
god ('e':xs) = god xs
god ('o':xs) = god xs
god (x:xs)   = x:god xs

main = putStrLn . god =<< getLine