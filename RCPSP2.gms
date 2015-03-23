* Ressourcenbeschraenkte Projektplanung in diskreter Zeit
* Zwei Modellvarianten:
* Variante 2: Minimierung der Kosten fuer Zusatzkapazitaet bei
*             gegebener Deadline

set
    i Vorgang
    t Periode
    r Ressource;

alias(t,tau);
alias(h,i);

set
    VN(h,i) Vorgaenger-Nachfolger-Relation zwischen h und i;

parameter
    d(i)    Dauer
    FE(i)   Fruehester Endzeitpunkt
    SE(i)   Spaetester Endzeitpunkt
    FA(i)   Fruehester Anfangszeitpunkt
    SA(i)   Spaetester Anfangszeitpunkt
    k(i,r)  Kapazitaetsbedarf von Vorgang i auf Ressource r
    KP(r)   Kapazitaet je Periode von Ressource r
    oc(r)   Kosten einer Einheit Zusatzkapazitaet
    ihilf
    Deadline
    MinimaleDauer   ;

binary variables
    x(i,t)  gleich 1 wenn Vorgang i in Periode t beendet wird;

free variables
    z       Zielfunktionswert;

positive variables
    O(r,t)  Zusatzkapazitaet von Ressource r in Periode t;

$include "RCPSP2_Input.inc";

* Zeitrechnung
* Achtung: Topologische Sortierung wird unterstellt

MinimaleDauer=0;
FA(i)=0;
FE(i)=d(i);

loop(i,
     loop(h$VN(h,i),
         if(FE(h)>FA(i),
             FA(i)=FE(h);
             FE(i)=FA(i)+d(i);
             if( FE(i)>MinimaleDauer,
                 MinimaleDauer = FE(i)
             );
         );
     );
);

SE(i)=max(MinimaleDauer, Deadline);
SA(i)=SE(i)-d(i);

for(ihilf=card(i) downto 1,
     loop(i$(ord(i)=round(ihilf)),
         loop(h$VN(i,h),
             if(SA(h)<SE(i),
                 SE(i)=SA(h);
                 SA(i)=SE(i)-d(i);
             );
         );
     );
);

display d, FA, FE, SA, SE, Deadline, MinimaleDauer;

Equations
    ZielfunktionKosten,
    JederVorgangEinmal(i)
    Projektstruktur(h,i)
    Kapazitaetsrestriktion(r,t)
    KapazitaetsrestriktionFlex(r,t);

ZielfunktionKosten..
    z=e=sum((r,t),oc(r)*O(r,t));

JederVorgangEinmal(i)..
    sum(t$(FE(i)<=ord(t)-1 and ord(t)-1 <= SE(i)), x(i,t)) =e= 1;

Projektstruktur(h,i)$VN(h,i)..
    sum(t$(FE(h)<=ord(t)-1 and ord(t)-1 <= SE(h)),
          (ord(t)-1)*x(h,t))  =l=
    sum(t$(FE(i)<=ord(t)-1 and ord(t)-1 <= SE(i)),
          (ord(t)-1-d(i))*x(i,t));

KapazitaetsrestriktionFlex(r,t)..
    sum(i,
    sum(tau$((ord(tau)-1 >= max(ord(t)-1, FE(i)))  and
              (ord(tau)-1 <= min(ord(t)-1+d(i)-1, SE(i)))),
          k(i,r)*x(i,tau)))=l=KP(r)+O(r,t);

model RCPSP2 /
    ZielfunktionKosten
    JederVorgangEinmal
    Projektstruktur
    KapazitaetsrestriktionFlex/;

RCPSP2.optcr=0.0;
RCPSP2.limrow=500;

solve RCPSP2 minimizing z using mip;

parameter
    zkr(r)  Berechnung Zusatzkosten;

zkr(r) = sum(t,O.l(r,t));

display x.l, O.l, zkr;

file outputfile1 / 'RCPSP2_solution_kosten.txt'/;
put outputfile1;

loop(r,
    put r.tl:0, '; ' zkr(r) /
);

putclose outputfile1;

file outputfile2 / 'RCPSP2_solution_x.txt'/;
put outputfile2;

loop(t,
loop(i,
     put x.l(i,t), ';' i.tl:0, ';' t.tl:0  /
);
);
putclose outputfile2;

file outputfile3 / 'RCPSP2_solution_zeit.txt'/;
put outputfile3;

loop(i,
     put i.tl:0, '; ' FA(i), ' ; ' SA(i), ' ; ' FE(i), ' ; ' SE(i) /
);
putclose outputfile3;

file outputfile4 /'RCPSP2_solution_zw.txt'/;
put outputfile4;

put 'Zielfunktionswert: ',z.l /
put '**********************'

putclose outputfile4;
