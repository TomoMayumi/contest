import Control.Applicative
import Data.List

main = print . maximum . map (read::String->Int) . words =<< getLine