set r / 
Ressource1
Ressource2
Ressource3
Ressource4
Ressource5
/;

set i / 
2
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

set t / t0*t35 /;

VN(h,i)=no;

VN('2','Beispielvorgang2')=yes;
VN('2','Beispielvorgang3')=yes;
VN('2','Beispielvorgang4')=yes;
VN('Beispielvorgang2','Beispielvorgang5')=yes;
VN('Beispielvorgang3','Beispielvorgang6')=yes;
VN('Beispielvorgang4','Beispielvorgang7')=yes;
VN('Beispielvorgang5','Beispielvorgang8')=yes;
VN('Beispielvorgang6','Beispielvorgang8')=yes;
VN('Beispielvorgang7','Beispielvorgang9')=yes;
VN('Beispielvorgang8','Beispielvorgang10')=yes;
VN('Beispielvorgang9','Beispielvorgang10')=yes;

d('2')= 3;
d('Beispielvorgang2')= 4;
d('Beispielvorgang3')= 5;
d('Beispielvorgang4')= 4;
d('Beispielvorgang5')= 4;
d('Beispielvorgang6')= 4;
d('Beispielvorgang7')= 2;
d('Beispielvorgang8')= 1;
d('Beispielvorgang9')= 5;
d('Beispielvorgang10')= 3;

k(i,r)=0;

k('2','Ressource1')= 2;
k('Beispielvorgang2','Ressource2')= 2;
k('Beispielvorgang3','Ressource3')= 1;
k('Beispielvorgang4','Ressource4')= 1;
k('Beispielvorgang5','Ressource5')= 1;
k('Beispielvorgang6','Ressource1')= 2;
k('Beispielvorgang7','Ressource2')= 2;
k('Beispielvorgang8','Ressource3')= 1;
k('Beispielvorgang9','Ressource4')= 2;
k('Beispielvorgang10','Ressource5')= 1;

KP('Ressource1')= 12;
KP('Ressource2')= 17;
KP('Ressource3')= 4;
KP('Ressource4')= 3;
KP('Ressource5')= 5;

