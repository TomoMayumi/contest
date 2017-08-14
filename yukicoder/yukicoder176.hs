solve [a,b,t] = minimum $ (t`div`b+1)*b : map (\i-> t+(a-(t-i*b)`mod`a)`mod`a) [0..min a (t`div`b)]

main = print . solve . map read . words =<< getLine