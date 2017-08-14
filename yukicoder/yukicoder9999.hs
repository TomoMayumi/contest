import Control.Applicative
import Control.Monad
import Control.Monad.ST
--import Data.Array
import Data.Array.Unboxed
import Data.Array.ST
import Data.Bits
import Data.Maybe
import qualified Data.Set as S

check i = runSTUArray $ do
  ar <- newArray ((0,0),(5,5)) 0  :: ST s (STUArray s (Int,Int) Int)
  forM_ [b|b<-[0..24],testBit i b] $ \b -> do
    i <- readArray ar (b`div`5,b`mod`5)
    writeArray ar (b`div`5,b`mod`5) (i+1)
    when (b`mod`5/=0) $ do
      i <- readArray ar (b`div`5,b`mod`5-1)
      writeArray ar (b`div`5,b`mod`5-1) (i+1)
    when (b`mod`5/=4) $ do
      i <- readArray ar (b`div`5,b`mod`5+1)
      writeArray ar (b`div`5,b`mod`5+1) (i+1)
    when (b`div`5/=0) $ do
      i <- readArray ar (b`div`5-1,b`mod`5)
      writeArray ar (b`div`5-1,b`mod`5) (i+1)
    when (b`div`5/=4) $ do
      i <- readArray ar (b`div`5+1,b`mod`5)
      writeArray ar (b`div`5+1,b`mod`5) (i+1)
  return ar

main = do
  m <- replicateM 5 $ map read . words <$> getLine
  let am = array ((0,0),(4,4)) [((i,j),m!!i!!j)|i<-[0..4],j<-[0..4]] :: UArray (Int,Int) Int
  print $ minimum $ map popCount $ filter ((am==).check) ([1..(2^25-1)]::[Int])


{-
rotates s = f s $ reverse s
  where
    n = length s
    f xs []     = [xs]
    f xs (y:ys) = xs:f (take n (y:xs)) ys

main = do
  _ <- getLine
  a <- map read . words <$> getLine
  b <- map ((`div`2).read) . words <$> getLine
  let
    pq = foldr S.insert S.empty $ zip3 a [0..] [0,1..]
    check m elevels =min m . last . fst . break (>m) . map fst $ scanl f (0,pq) elevels
    f (mn,tpq) elevel = (max mn (cnt+1),S.insert (level+elevel,cnt+1,id) gotpq)
      where
        ((level,cnt,id),gotpq) = S.deleteFindMin tpq
  print $ foldl check (10^4) $ rotates b
-}