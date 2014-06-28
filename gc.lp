role(1..4).
task(1..4).
person(1..2).

sod(1,2).
sod(1,4).
sod(2,3).
sod(2,4).

seq(1,2).
seq(2,3).
seq(2,4).

require(1,1).
require(2,1).
require(3,2).
require(4,3).

member(1,1).
member(2,1).
member(2,2).
member(3,1).
member(4,1).

sod(X,Y):-role(X;Y),sod(Y,X).
reach(X,Y):-task(X;Y),seq(X,Y).
reach(X,Z):-task(X;Y;Z),reach(X,Y),seq(Y,Z).
edge(X,Y):-role(X;Y),sod(X,Y),reach(X,Y).

1{ perform(R,P):person(P) }1:- role(R).
:-perform(R1,P),perform(R2,P),edge(R1,R2),role(R1;R2),person(P).

#hide.
#show edge(_,_),perform(_,_).

