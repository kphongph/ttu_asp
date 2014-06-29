person(1..3).
role(1..4).

task(1).
1{task(2),task(3)}1:-task(1).

require(1,1).
require(2,2).
require(3,3).

member(1,1).
member(2,1).
member(2,3).
member(3,2).

sod(1,2).
sod(1,3).
sod(R1,R2):-role(R1;R2),sod(R2,R1).

edge(R1,R2):-role(R1;R2),task(T1;T2),sod(R1,R2),require(T1,R1),require(T2,R2).

1{job(R1,P):person(P)}1:-role(R1;R2),edge(R1,R2).

:-role(R),person(P),job(R,P),not member(R,P).
:-role(R1;R2),person(P1),edge(R1,R2),job(R1,P1),job(R2,P1).


#hide.
#show job(_,_),edge(_,_),task(_).

#option --true-negation.

