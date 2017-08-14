import Data.List
main = print . minimum . map (read::String->Int) . tail . words =<< getContents