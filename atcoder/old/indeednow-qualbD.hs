import Control.Applicative
import Control.Monad
import Control.Monad.ST
import Data.Int
import Data.Maybe
import Data.Array.ST
import qualified Data.ByteString.Char8 as B

solve n c a = runST $ do
  ans  <- newArray (1,c) 0 :: ST s (STUArray s Int Int64)
  last <- newArray (1,c) 0 :: ST s (STUArray s Int Int64)
  forM_ (zip a [1..]) $ \(d,i) -> do
    v <- readArray ans d
    l <- readArray last d
    writeArray ans d $ v+(n-i+1)*(i-l)
    writeArray last d i
  getElems ans

main = do
  n:c:a <- map (fst . fromJust . B.readInt) . B.words <$> B.getContents
  mapM_ print $ solve (fromIntegral n) c a