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

set t / t0*t26 /;

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

d('Beispielvorgang1')= 5;
d('Beispielvorgang2')= 4;
d('Beispielvorgang3')= 2;
d('Beispielvorgang4')= 1;
d('Beispielvorgang5')= 1;
d('Beispielvorgang6')= 2;
d('Beispielvorgang7')= 2;
d('Beispielvorgang8')= 4;
d('Beispielvorgang9')= 4;
d('Beispielvorgang10')= 1;

k(i,r)=0;

k('Beispielvorgang1','Ressource1')= 2;
k('Beispielvorgang2','Ressource2')= 1;
k('Beispielvorgang3','Ressource3')= 2;
k('Beispielvorgang4','Ressource4')= 2;
k('Beispielvorgang5','Ressource5')= 2;
k('Beispielvorgang6','Ressource1')= 2;
k('Beispielvorgang7','Ressource2')= 1;
k('Beispielvorgang8','Ressource3')= 2;
k('Beispielvorgang9','Ressource4')= 2;
k('Beispielvorgang10','Ressource5')= 2;

KP('Ressource1')= 14;
KP('Ressource2')= 13;
KP('Ressource3')= 9;
KP('Ressource4')= 12;
KP('Ressource5')= 0;

