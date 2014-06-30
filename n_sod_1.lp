task(1..5).
person(1..3).
role(1..3).
number(1..8).

seq(1,2).
seq(1,3).

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

graph(N,R):-role(R),number(N).

#hide.
#show graph(_,_).
