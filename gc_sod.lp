task(1..5).
person(1..2).
role(1..3).

seq(1,2).
seq(1,3).
seq(3,4).

require(1,1).
require(2,2).
require(3,3).
require(4,1).

member(1,1).
member(1,2).
member(2,2).
member(3,1).


sod(1,2).
sod(1,3).


reach(T1,T2):-task(T1;T2),seq(T1,T2).
reach(T1,T2):-task(T1;T2;T3),reach(T1,T3),seq(T3,T2).

sod(R1,R2):-role(R1;R2),sod(R2,R1).

brach(T1):-task(T1;T2;T3),seq(T1,T2),seq(T1,T3),T2!=T3.

edge(R1,R2):-task(T1;T2),role(R1;R2),reach(T1,T2),sod(R1,R2),
  require(T1,R1),require(T2,R2).
edge(R1,R1):-role(R1),task(T1),brach(T1),require(T1,R1).
edge(R1,R2):-role(R1;R2),edge(R2,R1).

link(I,R1,R2):-


#hide.
#show edge(_,_),node(_,_).
