person(1..2).
task(1..7).

% Workflow with sequence
1{seq(1,2)}1.
1{seq(2,3),seq(2,4)}1:-seq(1,2).
1{seq(3,5),seq(3,6)}1:-seq(2,3).
1{seq(4,6),seq(4,7)}1:-seq(2,4).

%1{perform(T1,P):person(P)}1:-seq(T1,T2),task(T1;T2).
%1{perform(T2,P):person(P)}1:-seq(T1,T2),task(T1;T2).

%:-perform(T,P1),perform(T,P2),person(P1;P2),task(T),P1!=P2.

#hide.
#show seq(_,_),perform(_,_).
