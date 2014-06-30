person(1..2).
role(1..4).
group(1..2).

% definition of workflow as paths
path(1,1,1,0,1).
path(2,1,0,1,0).

% task and required role
g_role(G,1):-path(G,1,R2,R3,R4). % task 1 require role 1
g_role(G,2):-path(G,R1,1,R3,R4).
g_role(G,3):-path(G,R1,R2,1,R4).
g_role(G,4):-path(G,R1,R2,R3,1).

member(1,1).
member(1,2).
member(2,1).
member(3,2).
member(4,2).

sod(1,2).
sod(1,3).
%sod(1,4).

% solving engine
sod(R1,R2):-role(R1;R2),sod(R2,R1).

1{perform(G,R,P):person(P)}1:-role(R),g_role(G,R).

:-role(R),person(P),group(G),perform(G,R,P),not member(R,P).
:-role(R1;R2),person(P1;P2),group(G),
  perform(G,R1,P1),perform(G,R2,P2),sod(R1,R2),P1=P2.

#hide.
#show perform(_,_,_).
