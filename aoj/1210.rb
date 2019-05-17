def roll(die,dir)
  case dir.chomp
  when "north"; die[:top],die[:south],die[:bottom],die[:north] = die[:south],die[:bottom],die[:north],die[:top]
  when "south"; die[:top],die[:south],die[:bottom],die[:north] = die[:north],die[:top]   ,die[:south],die[:bottom]
  when "east";  die[:top],die[:west], die[:bottom],die[:east]  = die[:west], die[:bottom],die[:east] ,die[:top]
  when "west";  die[:top],die[:west], die[:bottom],die[:east]  = die[:east], die[:top]   ,die[:west] ,die[:bottom]
  end
  return die
end


while (n=gets.to_i)>0
  die=[
    [:top,   1],
    [:bottom,6],
    [:north, 2],
    [:south, 5],
    [:east,  4],
    [:west,  3],
  ].to_h

  n.times{
    die = roll(die,gets)
  }

  p die[:top]
end