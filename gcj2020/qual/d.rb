t,b=gets.split.map(&:to_i)
t.times{
  puts (1..10).map{|i|
    p i
    STDOUT.flush
    gets.to_i
  }*""
  STDOUT.flush
  break if gets[0]!=?Y
}