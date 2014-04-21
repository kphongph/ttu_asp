task(1..2).
person(1..2).

% generate all possible task sequence 
2{perform(T,P):task(T):person(P)}.

require(1,1).
require(2,2).
member(1,1).
member(1,2).
member(2,2).

sod(1,2).

% CONSTRAINT

% 1. for each flow, no two persons perform in the same task
:- task(T),person(P1;P2),perform(T,P1),perform(T,P2),P1!=P2.

% 2. Task T require R to perform
:- person(P),task(T),require(T,R),perform(T,P),not member(R,P).

% 3. SOD
:- person(P),sod(R1,R2),
   perform(T1,P),require(T1,R1),
   perform(T2,P),require(T2,R2).

#hide.
#show perform(_,_).
