import Control.Applicative
import Control.Monad
import Data.Array
import Data.Maybe
import qualified Data.Set as S
import qualified Data.ByteString.Char8 as B
 
pqEmpty         = S.empty
pqAdd     pq n  = S.insert n pq
pqGet     pq    = S.deleteFindMin pq
pqMember  pq n  = S.member n pq
pqIsEmpty pq    = S.null pq

hypot2:: Integer -> Integer -> Integer
hypot2 x y = x*x+y*y

solve :: Int -> [[Integer]] -> Integer
solve n l = adjust
  where
    adjust = if ansd*ansd < ans then ansd+10 else ansd
    ansd =  (*10) . ceiling . sqrt . (/100) . fromIntegral $ ans
    ans :: Integer
    ans = primlike S.empty (S.singleton (0,0)) 10
--    dst:: Int -> [(Integer,Int)]
--    dst i = let [x1,y1] = (l!!i) in map (\(j,[x2,y2])->(hypot2 (x1-x2) (y1-y2),j)) $ zip [0..] l
    dst = listArray (0,n-1) $ map (\[x1,y1]->map (\(j,[x2,y2])->(hypot2 (x1-x2) (y1-y2),j)) $ zip [0..] l) l
    primlike:: S.Set (Int) -> S.Set ((Integer,Int)) -> Integer -> Integer
    primlike visited pq mx
      | d==n-1             = nextmx
      | S.member d visited = primlike visited nextpq mx
      | otherwise          = primlike (S.insert d visited) addedpq nextmx
          where
            addedpq         = foldl (flip S.insert) nextpq $ filter ((flip S.notMember) visited . snd) (dst!d)
            ((my,d),nextpq) = S.deleteFindMin pq
            nextmx          = max mx my
 
main = do
  n <- fst . fromJust . B.readInt <$> B.getLine
  l <- replicateM n $ map (fst . fromJust . B.readInteger) . B.words <$> B.getLine
  print $ solve n l
