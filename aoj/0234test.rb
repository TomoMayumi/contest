#2�̃X�N���v�g�ɓ������͂�^���A
#���ʂ��قȂ�Ƃ��̓��͂�\������X�N���v�g

#�����̃X�N���v�g��AC����Ȃ����A�Ȃ�őʖڂȂ̂��킩��Ȃ��Ƃ���
#���ł�AC�ɂȂ����X�N���v�g�Əo�͂ɍ����o����͂�T�����߂Ɏg�p


require 'open3'
 
testnum = 1000
 
# ���̓p�^�[���쐬�i�Ăяo���x�ɈႤ����1�Z�b�g�𕶎���ŕԂ��j
def createinput
  w = [*3..10].sample
  h = [*3..10].sample
  f = 10000
  m = [*3..50].sample
  o = [*0..m].sample
  map = (1..h).map{(1..w).map{[*-10..-1,1..5].sample}*" "}*"\n"
  [[w,h]*" ",[f,m,o]*" ",map]*"\n"
end
 
# �����Z�b�g�󂯕t����ꍇ�̍Ō�̓���
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
