import math

def primes(x):
    if x<2: return []
    primes = [i for i in range(x)]
    primes[1] = 0

    for prime in primes[:int(math.sqrt(x))+1]:
        if prime > 0:
            for not_prime in range( 2*prime, x, prime ): primes[not_prime] = 0

    return [prime for prime in primes if prime != 0]



while True:
    n = input()

    if n <= 0: break

    primelist = primes(n)

    print (len([prime for prime in primelist if (n-prime in primelist)])+1)/2
