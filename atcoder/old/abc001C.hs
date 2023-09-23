import Control.Applicative
import Data.Maybe
import Data.List
main = do
  [deg,dis] <- map read . words <$> getLine
  let w = fromJust $ findIndex (dis<) $ map ((+3).(*6)) [2,15,33,54,79,107,138,171,207,244,284,326,2000]
      dir = if w == 0
              then "C"
              else ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW","WSW","W","WNW","NW","NNW","N"] !! ((deg+112)`div`225)
  putStrLn $ unwords [dir,show w]