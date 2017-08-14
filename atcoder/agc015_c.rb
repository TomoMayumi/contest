UF=Hash.new{|_,k|k}
def u a,b;UF[f a]=UF[f b]end
def f c;c==UF[c]?c:UF[c]=f(UF[c])end