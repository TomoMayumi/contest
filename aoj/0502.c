/*
o=Hash[*%w(N BURLDF E RFDUBL W LFUDBR S FDRLUB R ULFBRD L URBFLD)]
while (n=gets.to_i)>0
    d=?0+t="UFRLBD"
    s=1
    n.times{d.tr!t,o[gets[0]];s+=d.index ?U}
    p s
end

*/


#include <stdio.h>

#define TOP    0
#define SOUTH  1
#define EAST   2
#define WEST   3
#define NORTH  4
#define BOTTOM 5

int change_pattern[][] = {
    {}
