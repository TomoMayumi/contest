import Control.Applicative
import Control.Monad
import Data.List
import Data.Array


adjList b = map (map snd) . groupBy cmpFst . sort $ concatMap makePairs b
    where
        cmpFst a b = fst a == fst b
        makePairs [a,b] = [(a,b),(b,a)]

solve n b = nextNode 1 [1] $ adj!1
    where
        adj = listArray (1,n) $ adjList b
        nextNode _   gone []     = gone
        nextNode now gone (x:xs) = nextNode x (x:gone) $ (sort $ union xs $ adj!x) \\ (x:gone)

main = do
    n <- read <$> getLine
    b <- replicateM (n-1) $ map read . words <$> getLine
    putStrLn $ unwords . map show $ reverse $ solve n b