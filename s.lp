p(1..2).
t(1..2).
{c(T,P)}:-t(T),p(P).

s:-p(P),c(1,P).
e:-p(P),c(2,P).

% no task done by more than one person
:-p(P1;P2),t(Y),c(Y,P1),c(Y,P2),P1!=P2.
:-not s.
:-not e.



#hide.
#show c(X,Y).
