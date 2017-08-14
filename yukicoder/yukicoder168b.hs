import Control.Applicative
import Control.Monad
import Control.Monad.ST
import Data.Maybe
import Data.Either
import Data.List
import Data.Array.ST
import qualified Data.ByteString.Char8 as B

unionfind :: (Int,Int) -> [Either Int (Int,Int)] -> [Int]
unionfind bounds@(lower,upper) queryList = runST $ do
  un <- newListArray bounds [lower..upper] :: ST s (STUArray s Int Int)
  let 
      f ret x = do
        t <- either find union x
        return (t:ret)
      find n = do
        nn <- readArray un n
        if n==nn then return (Just n) else do
          Just nnn <- find nn
          writeArray un n nnn
          return (Just nnn)
      union (a,b) = do
        Just aa <- find a
        Just bb <- find b
        bbb <- readArray un bb
        writeArray un aa bbb
        return Nothing
  reverse . catMaybes <$> foldM f [] queryList

unionfindcheck :: (Int,Int) -> [Either Int (Int,Int)] -> Bool
unionfindcheck bounds@(lower,upper) queryList = runST $ do
  un <- newArray bounds (-1) :: ST s (STUArray s Int Int)
  let 
      f True  _ = return True
      f False x = do
        either find union x
        Just a <- find lower
        Just b <- find upper
        return (a==b)
      find n = do
        nn <- readArray un n
        if (-1==nn) then return (Just n) else do
          Just nnn <- find nn
          writeArray un n nnn
          return (Just nnn)
      union (a,b) = do
        Just aa <- find a
        Just bb <- find b
        bbb <- readArray un bb
        writeArray un aa bbb
        return Nothing
  foldM f False queryList

hypot2 x y = x*x+y*y

solve n ls = bsearch 0 150000000
  where
    lsWithIndex = zip [0..] ls
    dst = [((i,j),hypot2 (xi-xj) (yi-yj))|(i,[xi,yi])<-lsWithIndex,(j,[xj,yj])<-lsWithIndex,i<j]
    bsearch l r
      | l>=r      = l*10
      | check     = bsearch l c
      | otherwise = bsearch (c+1) r
        where
          c       = (l+r)`div`2
          check   = unionfindcheck (0,n-1) $ map (Right . fst) $ filter ((100*c*c>=).snd) dst
--          check   = a==b
--          [a,b]   = unionfind (0,n-1) $ (map (Right . fst) $ filter ((100*c*c>=).snd) dst)++(map Left [0,n-1])

main = do
  n  <- fst . fromJust . B.readInt <$> B.getLine
  ls <- replicateM n $ map (fst . fromJust . B.readInt) . B.words <$> B.getLine
  print $ solve n ls