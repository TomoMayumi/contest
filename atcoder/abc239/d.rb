require 'prime'
a,b,c,d=gets.split.map(&:to_i)

puts (a..b).any?{|i|
    (c..d).all?{|j|
        !(i+j).prime?
    }
} ? "Takahashi" : "Aoki"