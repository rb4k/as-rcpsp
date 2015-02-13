* Ressourcenbeschraenkte Projektplanung in diskreter Zeit
* Zwei Modellvarianten:
* Variante 1: Minimierung der Projektdauer bei gegebenen Kapazitaeten
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


* Daten der Instanz

set r /A, B/;

set i / i1*i12/;

* Achtung: Erste Periode/erster Zeitpunkt muss 0 sein

set t /t0*t200/;


VN(h,i)=no;

* Achtung: Topologische Sortierung erforderlich

VN('i1','i2')=yes;
VN('i1','i5')=yes;
VN('i1','i8')=yes;
VN('i1','i10')=yes;
VN('i2','i3')=yes;
VN('i2','i6')=yes;
VN('i3','i4')=yes;
VN('i4','i7')=yes;
VN('i4','i12')=yes;
VN('i5','i6')=yes;
VN('i6','i7')=yes;
VN('i7','i12')=yes;
VN('i8','i9')=yes;
VN('i9','i12')=yes;
VN('i10','i11')=yes;
VN('i11','i12')=yes;

parameter
        d(i) /
         i1      3
         i2      2
         i3      4
         i4      2
         i5      3
         i6      4
         i7      2
         i8      3
         i9      5
         i10     3
         i11     2
         i12     2/;


Deadline=21;

k(i,r)=0;

k('i1','A')=1;
k('i2','A')=2;
k('i3','B')=1;
k('i4','A')=1;
k('i5','B')=1;
k('i6','A')=2;
k('i7','B')=1;
k('i8','A')=2;
k('i9','A')=1;
k('i10','A')=1;
k('i11','B')=1;
k('i12','A')=1;

KP('A')=2;
KP('B')=1;

oc('A')=15000;
oc('B')=10000;



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
    ZielfunktionZeit,
    ZielfunktionKosten,
    JederVorgangEinmal(i)
    Projektstruktur(h,i)
    Kapazitaetsrestriktionalt(r,t)
    KapazitaetsrestriktionFlexalt(r,t),
    Kapazitaetsrestriktion(r,t)
    KapazitaetsrestriktionFlex(r,t);

ZielfunktionZeit..
    z=e=sum(i$(ord(i)=card(I)),
        sum(t$(FE(i)<=ord(t)-1 and ord(t)-1 <= SE(i)),
             (ord(t)-1)*x(i,t)));

ZielfunktionKosten..
    z=e=sum((r,t),oc(r)*O(r,t));

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

KapazitaetsrestriktionFlex(r,t)..
    sum(i,
    sum(tau$((ord(tau)-1 >= max(ord(t)-1, FE(i)))  and
              (ord(tau)-1 <= min(ord(t)-1+d(i)-1, SE(i)))),
          k(i,r)*x(i,tau)))=l=KP(r)+O(r,t);

model RCPSP1 /
    ZielfunktionZeit
    JederVorgangEinmal
    Projektstruktur
    Kapazitaetsrestriktion/;

model RCPSP2 /
    ZielfunktionKosten
    JederVorgangEinmal
    Projektstruktur
    KapazitaetsrestriktionFlex/;

RCPSP1.optcr=0.0;
RCPSP1.limrow=500;

$ontext
x.fx('i1','t3')=1;
x.fx('i2','t5')=1;
x.fx('i3','t9')=1;
x.fx('i4','t11')=1;
x.fx('i5','t6')=1;
x.fx('i6','t10')=1;
x.fx('i7','t13')=1;
x.fx('i8','t6')=1;
x.fx('i9','t11')=1;
x.fx('i10','t6')=1;
x.fx('i11','t8')=1;
x.fx('i12','t15')=1;
$offtext

solve RCPSP1 minimizing z using mip;

display x.l;


RCPSP2.optcr=0.0;
RCPSP2.limrow=500;

solve RCPSP2 minimizing z using mip;
