# coding: Shift_JIS

class Dice:

    # �R���X�g���N�^�F�C���X�^���X�������ɌĂяo�����
    def __init__(self,top,south,east,north,west,bottom):
        self.top        = top
        self.south      = south
        self.east       = east
        self.north      = north
        self.west       = west
        self.bottom     = bottom
    
    # ���߉�ǃ��\�b�h
    # ���߂ɑ΂��郁�\�b�h���Ăяo��
    def execCommand(self,command):
        func = self.__command_list.get(command)
        if func: func(self)

    # �_�C�X�̏�̖ڂ��擾
    def getTop(self):
        return self.top

    # �A�N�Z�X���������������\�b�h
    # "__"�ŊO������̎Q�ƕs�ƂȂ�
    def __rotNorth(self):
        tmp         = self.top
        self.top    = self.south
        self.south  = self.bottom
        self.bottom = self.north
        self.north  = tmp
    
    def __rotSouth(self):
        tmp         = self.top
        self.top    = self.north
        self.north  = self.bottom
        self.bottom = self.south
        self.south  = tmp
    
    def __rotWest(self):
        tmp         = self.top
        self.top    = self.east
        self.east   = self.bottom
        self.bottom = self.west
        self.west   = tmp

    def __rotEast(self):
        tmp         = self.top
        self.top    = self.west
        self.west   = self.bottom
        self.bottom = self.east
        self.east   = tmp
    
    def __rotLeft(self):
        tmp         = self.south
        self.south  = self.west
        self.west   = self.north
        self.north  = self.east
        self.east   = tmp

    def __rotRight(self):
        tmp        = self.south
        self.south = self.east
        self.east  = self.north
        self.north = self.west
        self.west  = tmp

    # �N���X�ϐ��F�C���X�^���X�ŋ��ʂƂȂ�ϐ�
    # �C���^�v���^����̂��߁A�N���X�̒�`�����{�����i�K�ŃN���X�ϐ����p�ӂ����
    __command_list = {
        "North" : __rotNorth,
        "South" : __rotSouth,
        "West" : __rotWest,
        "East" : __rotEast,
        "Left" : __rotLeft,
        "Right" : __rotRight,
    }

# �ڍא݌v�\�͌��㊈���ɂ����āAC�Ŏ����������ɑ΂���Python�Ŏ������Ă݂�
# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0069

# �C���X�^���X��
dice = Dice(1,2,3,5,4,6)
top_sum = dice.getTop()

command_num = int(input()) 
for count in range(command_num):
    command = str(input())
    dice.execCommand(command)
    top_sum += dice.getTop()

print("top_sum =",top_sum)
