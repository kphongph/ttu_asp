task(1..5).
person(1..3).
role(1..3).

seq(1,2).
1{seq(2,3),seq(2,4)}1:-seq(1,2).
seq(3,5):-seq(2,3).
seq(4,5):-seq(2,4).

require(1,1).
require(2,2).
require(3,1).
require(4,3).

%member(1,1).
member(1,2).
member(2,1).
member(2,2).
%member(2,3).

sod(1,2).
sod(1,3).

1{perform(T1,P):person(P)}1:-task(T1;T2),seq(T1,T2).

:- task(T1;T2),role(R1;R2),person(P1;P2),seq(T1,T2),
   perform(T1,P1),require(T1,R1),not member(R1,P1).

:- task(T1;T2;T3;T4),role(R1;R2),person(P1;P2),seq(T1,T3),seq(T2,T4),
   perform(T1,P1),perform(T2,P2),require(T1,R1),require(T2,R2),
   sod(R1,R2),P1=P2.

#hide.
#show perform(_,_).
