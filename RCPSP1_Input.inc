set r / 
Ressource1
Ressource2
Ressource3
Ressource4
Ressource5
/;

set i / 
Beispielvorgang1
Beispielvorgang2
Beispielvorgang3
Beispielvorgang4
Beispielvorgang5
Beispielvorgang6
Beispielvorgang7
Beispielvorgang8
Beispielvorgang9
Beispielvorgang10
/;

set t / t0*t30 /;

VN(h,i)=no;

VN('Beispielvorgang1','Beispielvorgang2')=yes;
VN('Beispielvorgang1','Beispielvorgang3')=yes;
VN('Beispielvorgang1','Beispielvorgang4')=yes;
VN('Beispielvorgang2','Beispielvorgang5')=yes;
VN('Beispielvorgang3','Beispielvorgang6')=yes;
VN('Beispielvorgang4','Beispielvorgang7')=yes;
VN('Beispielvorgang5','Beispielvorgang8')=yes;
VN('Beispielvorgang6','Beispielvorgang8')=yes;
VN('Beispielvorgang7','Beispielvorgang9')=yes;
VN('Beispielvorgang8','Beispielvorgang10')=yes;
VN('Beispielvorgang9','Beispielvorgang10')=yes;

d('Beispielvorgang1')= 4;
d('Beispielvorgang2')= 4;
d('Beispielvorgang3')= 3;
d('Beispielvorgang4')= 4;
d('Beispielvorgang5')= 3;
d('Beispielvorgang6')= 1;
d('Beispielvorgang7')= 4;
d('Beispielvorgang8')= 2;
d('Beispielvorgang9')= 3;
d('Beispielvorgang10')= 2;

k(i,r)=0;

k('Beispielvorgang1','Ressource1')= 1;
k('Beispielvorgang2','Ressource2')= 2;
k('Beispielvorgang3','Ressource3')= 1;
k('Beispielvorgang4','Ressource4')= 2;
k('Beispielvorgang5','Ressource5')= 2;
k('Beispielvorgang6','Ressource1')= 1;
k('Beispielvorgang7','Ressource2')= 1;
k('Beispielvorgang8','Ressource3')= 2;
k('Beispielvorgang9','Ressource4')= 2;
k('Beispielvorgang10','Ressource5')= 1;

KP('Ressource1')= 13;
KP('Ressource2')= 15;
KP('Ressource3')= 0;
KP('Ressource4')= 11;
KP('Ressource5')= 4;

