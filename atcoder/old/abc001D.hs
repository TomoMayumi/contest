import Control.Applicative
import Control.Monad
import Data.List

split :: Char -> String -> [String]
split delimiter target
  | null target  = []
  | null indices = [target]
  | otherwise    = w:split delimiter rest
    where
      indices :: [Int]
      indices = findIndices (==delimiter) target
      (w,_:rest)  = splitAt (head indices) target

zeropad :: Int -> Int -> String
zeropad digit n = (replicate (digit - length strn) '0')++strn
  where
    strn = show n

solve :: [[String]] -> [[String]]
solve l = restrl $ summarize $ sort $ intl l
  where
    intl :: [[String]] -> [[Int]]
    intl = map (adjust . map read)
    adjust :: [Int] -> [Int]
    adjust [s,e] = [s`div`5*5 , if elow==60 then (ehigh+1)*100 else et]
      where
        et = (e+4)`div`5*5
        elow = et`mod`100
        ehigh = et`div`100
    restrl :: [[Int]] -> [[String]]
    restrl = map (map $ zeropad 4)
    summarize :: [[Int]] -> [[Int]]
    summarize [] = []
    summarize (x:[]) = [x]
    summarize (x@[xs,xe]:y@[ys,ye]:z)
      | xe>=ys    = summarize ([xs,max xe ye]:z)
      | otherwise = x:summarize (y:z)

main = do
  n <- read <$> getLine
  l <- replicateM n $ split '-' <$> getLine
  putStr $ unlines $ map (intercalate "-") $ solve l