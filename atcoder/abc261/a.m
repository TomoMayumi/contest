[a,b,c,d] = scanf("%d %d %d %d","C");
r = min([b,d]);
l = max([a,c]);
disp(max([r-l,0]));