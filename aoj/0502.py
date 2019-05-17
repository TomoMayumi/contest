# coding: Shift_JIS

class Dice:

    # コンストラクタ：インスタンス生成時に呼び出される
    def __init__(self,top,south,east,north,west,bottom):
        self.top        = top
        self.south      = south
        self.east       = east
        self.north      = north
        self.west       = west
        self.bottom     = bottom
    
    # 命令解読メソッド
    # 命令に対するメソッドを呼び出す
    def execCommand(self,command):
        func = self.__command_list.get(command)
        if func: func(self)

    # ダイスの上の目を取得
    def getTop(self):
        return self.top

    # アクセス制限をかけたメソッド
    # "__"で外部からの参照不可となる
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

    # クラス変数：インスタンスで共通となる変数
    # インタプリタ言語のため、クラスの定義を実施した段階でクラス変数が用意される
    __command_list = {
        "North" : __rotNorth,
        "South" : __rotSouth,
        "West" : __rotWest,
        "East" : __rotEast,
        "Left" : __rotLeft,
        "Right" : __rotRight,
    }

# 詳細設計能力向上活動において、Cで実装した問題に対してPythonで実装してみた
# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0069

# インスタンス化
dice = Dice(1,2,3,5,4,6)
top_sum = dice.getTop()

command_num = int(input()) 
for count in range(command_num):
    command = str(input())
    dice.execCommand(command)
    top_sum += dice.getTop()

print("top_sum =",top_sum)
