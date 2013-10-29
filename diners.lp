person(mrA; mrsA; mrB; mrsB; mrC; mrsC; mrD; mrsD).
couple(mrA, mrsA).
couple(mrB, mrsB).
couple(mrC, mrsC).
couple(mrD, mrsD).
couple(P1,P2) :- couple(P2,P1).
chair(0..7).
man(mrA; mrB; mrC; mrD).

1 {place(P, C) : person(P)} 1 :- chair(C).
1 {place(P, C) : chair(C)} 1 :- person(P).

on_left(P1,P2) :- place(P1,C1), place(P2,C2), C1 = (C2 + 1) \ 8.
opposite(P1,P2) :- place(P1,C1), place(P2,C2), C1 = (C2 + 4) \ 8.
between(P,P1,P2) :- on_left(P1,P), on_left(P,P2).
between_couple(P) :- between(P,P1,P2), couple(P1,P2).
between_men(P) :- between(P,P1,P2), man(P1), man(P2).
insult_hostess(P) :- between_men(P).
hostess(mrsD).
place(mrsD,0).

:- not on_left(mrB,mrsA).
:- not opposite(mrB,mrsC).
:- not 1{between_couple(P)}1.
:- between_couple(P), not hostess(P).
:- not 1{between_men(P)}1.

#hide.
#show place/2.
#show insult_hostess/1.
