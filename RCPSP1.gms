* Ressourcenbeschraenkte Projektplanung in diskreter Zeit
* Zwei Modellvarianten:
* Variante 1: Minimierung der Projektdauer bei gegebenen Kapazitaeten

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
    ihilf
    Deadline
    MinimaleDauer   ;

binary variables
    x(i,t)  gleich 1 wenn Vorgang i in Periode t beendet wird;

free variables
    z       Zielfunktionswert;

$include "RCPSP1_Input.inc";

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

display d, FA, FE, SA, SE, MinimaleDauer;

Equations
    ZielfunktionZeit,
    JederVorgangEinmal(i)
    Projektstruktur(h,i)
    Kapazitaetsrestriktion(r,t);

ZielfunktionZeit..
    z=e=sum(i$(ord(i)=card(I)),
        sum(t$(FE(i)<=ord(t)-1 and ord(t)-1 <= SE(i)),
             (ord(t)-1)*x(i,t)));

JederVorgangEinmal(i)..
    sum(t$(FE(i)<=ord(t)-1 and ord(t)-1 <= SE(i)), x(i,t)) =e= 1;

Projektstruktur(h,i)$VN(h,i)..
    sum(t$(FE(h)<=ord(t)-1 and ord(t)-1 <= SE(h)),
          (ord(t)-1)*x(h,t))  =l=
    sum(t$(FE(i)<=ord(t)-1 and ord(t)-1 <= SE(i)),
          (ord(t)-1-d(i))*x(i,t));

Kapazitaetsrestriktion(r,t)..
    sum(i,
    sum(tau$((ord(tau)-1 >= max(ord(t)-1, FE(i)))  and
              (ord(tau)-1 <= min(ord(t)-1+d(i)-1, SE(i)))),
          k(i,r)*x(i,tau)))=l=KP(r);

model RCPSP1 /
    ZielfunktionZeit
    JederVorgangEinmal
    Projektstruktur
    Kapazitaetsrestriktion/;

RCPSP1.optcr=0.0;
RCPSP1.limrow=500;

solve RCPSP1 minimizing z using mip;

display z.l, x.l;

file outputfile1 / 'RCPSP1_solution_zeit.txt'/;
put outputfile1;

loop(i,
     put i.tl:0, '; ' FA(i), ' ; ' SA(i), ' ; ' FE(i), ' ; ' SE(i) /
);
putclose outputfile1;

file outputfile2 / 'RCPSP1_solution_x.txt'/;
put outputfile2;

loop(t,
loop(i,
     put x.l(i,t), ';' i.tl:0, ';' t.tl:0  /
);
);
putclose outputfile2;

file outputfile3 /'RCPSP1_solution_zw.txt'/;
put outputfile3;

put 'Zielfunktionswert: ',z.l /
put '**********************'

putclose outputfile3;
