require 'open3'
 
testnum = 1000
 
def createinput
  return [*0..1000].sample*2
end
 
def endinput
  return "0"
end
 
 
src1 = ARGV[0]
src2 = ARGV[1]
 
testnum.times{|i|
  p i
  input = [createinput,endinput]*"\n"
  o1,e1,s1 = Open3.capture3("ruby #{src1}",:stdin_data=>input)
  o2,e2,s2 = Open3.capture3("ruby #{src2}",:stdin_data=>input)
  if o1!=o2
    puts "----"
    p [o1,o2]
    p input
    puts input
    break
  end
}