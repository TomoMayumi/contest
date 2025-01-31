gets
odd,even=gets.split.map(&:to_i).partition{|i|i.odd?}
odd.sort!
even.sort!
p [(odd[1]?odd[-1]+odd[-2]:-1),(even[1]?even[-1]+even[-2]:-1)].max
