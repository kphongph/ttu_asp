person(1..2).
role(1..4).

task(1).
1{task(2),task(3)}1:-task(1).
task(4):-task(2).

%task(3).

require(1,1).
require(2,2).
require(3,3).
require(4,4).

member(1,1).
member(1,2).
member(2,2).
member(3,1).
member(4,1).

sod(1,2).
sod(1,3).
sod(2,4).
sod(1,4).

r_role(R):-role(R),task(T),require(T,R).
edge(R1,R2):-role(R1;R2),r_role(R1;R2),sod(R1,R2).

1{job(R,P):person(P)}1:-role(R), r_role(R).

:-person(P),role(R),job(R,P),not member(R,P).
:-role(R1;R2),r_role(R1;R2),
 person(P1;P2),job(R1,P1),job(R2,P2),edge(R1,R2),P1=P2.


#hide.
%#show edge(_,_),r_role(_),job(_,_).
#show task(_).
