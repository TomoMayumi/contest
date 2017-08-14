import Control.Applicative
import Data.List

rotates s = ro s $ reverse s
    where
        n            = length s
        ro ss []     = [ss]
        ro ss (y:ys) = ss:ro (take n (y:ss)) ys

main = do
    s <- getLine
    t <- getLine
    print $ case findIndex (==t) $ rotates s of
        Just a  -> a
        Nothing -> -1