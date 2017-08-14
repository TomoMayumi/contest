import Control.Applicative
import qualified Data.Set as S

rotates s = f s $ reverse s
  where
    n = length s
    f xs []     = [xs]
    f xs (y:ys) = xs:f (take n (y:xs)) ys

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine
  b <- map ((`div`2).read) <$> words <$> getLine
  let
    pq = foldr S.insert S.empty $ zip3 a [0,0..] [0,1..]
    check m elvs =min m $ last $ fst $ break (>m) $ map fst $ scanl f (0,pq) elvs
    f (mn,tpq) elv = (max mn (cnt+1) ,S.insert (lv+elv,cnt+1,id) gotpq)
      where
        ((lv,cnt,id),gotpq) = S.deleteFindMin tpq
  print $ foldl check (10^4) $ rotates b