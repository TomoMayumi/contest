def getints;gets.split.map(&:to_i);end
w,h,m,n=getints
cam=(1..m).map{getints}
art=(1..n).map{getints}

art.each{|a,b|
  puts cam.any?{|x,y,t,d,r|
    dx=1.0*(a-x)
    dy=1.0*(b-y)
    th=Math.atan2(dy,dx)*180/Math::PI
    dist=Math.hypot(dx,dy)
    view=(t-d/2.0)..(t+d/2.0)

    dist<=r && (view.include?(th) || view.include?(th+360))
  } ? "yes" : "no"
}