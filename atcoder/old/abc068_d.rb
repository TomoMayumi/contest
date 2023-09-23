#puts n=50,([49+(k=gets.to_i)/n-a=k%n]*(n-a)+[99+(b=k-1)/n-b%n]*a)*" "
p n=50,*[n+l=n+(k=gets.to_i)/n-r=k%n]*r,*[l-1]*(n-r)