import math

print "Primes up to a million"

pp = 2
ps = [pp]
pp += 1
ps.append(pp)
lim = 1000000
while pp < int(lim):
	pp += 2
	test = True
	sqrtpp = math.sqrt(pp)
	for a in ps:
		if a > sqrtpp: break
		if pp % a == 0:
			test = False
			break
	if test:
		ps.append(pp)

print len(ps)
