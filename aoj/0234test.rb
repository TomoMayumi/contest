#2つのスクリプトに同じ入力を与え、
#結果が異なるときの入力を表示するスクリプト

#自分のスクリプトがACされないが、なんで駄目なのかわからないときに
#すでにACになったスクリプトと出力に差が出る入力を探すために使用


require 'open3'
 
testnum = 1000
 
# 入力パターン作成（呼び出す度に違う入力1セットを文字列で返す）
def createinput
  w = [*3..10].sample
  h = [*3..10].sample
  f = 10000
  m = [*3..50].sample
  o = [*0..m].sample
  map = (1..h).map{(1..w).map{[*-10..-1,1..5].sample}*" "}*"\n"
  [[w,h]*" ",[f,m,o]*" ",map]*"\n"
end
 
# 複数セット受け付ける場合の最後の入力
def endinput
  return "0 0"
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
