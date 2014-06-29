person(1..3).
role(1..4).
number(1..10).
 
%task(1).
%1{task(2),task(3)}1:-task(1).
%task(4):-task(2).

task(1).
task(2).
task(3).
task(4).

require(1,1).
require(2,2).
require(3,3).
require(4,4).

member(1,1).
member(2,1).
member(2,2).
member(3,2).
member(3,1).
member(4,2).
member(4,3).

sod(1,2).
sod(2,3).
sod(3,4).
sod(2,4).

sod(R1,R2):-role(R1;R2),sod(R2,R1).

edge(R1,R2):-role(R1;R2),sod(R1,R2),task(T1;T2),
  require(T1,R1),require(T2,R2).

job(R1,P1):-role(R1),person(P1),member(R1,P1).

edge_r(R1,R2,R3):-role(R1;R2;R3),edge(R1,R2),edge(R2,R3),R1!=R3.

safe_r(R1,R2,R3):-edge(R1,R2),edge(R2,R3),R1!=R3,
  job(R1,P1),job(R2,P2),job(R3,P3),P1!=P2,P2!=P3.

safe(R1,R2):-edge(R1,R2),
  role(R1;R2),person(P1;P2),job(R1,P1),job(R2,P2),P1!=P2.

violate:-role(R1;R2;R3),edge_r(R1,R2,R3),not safe_r(R1,R2,R3).
violate:-role(R1;R2),edge(R1,R2),not safe(R1,R2).
:-not violate.


#hide.
#show violate,safe(_,_),edge(_,_),job(_,_),task(_),edge_r(_,_,_),safe_r(_,_,_).

#option --true-negation.

