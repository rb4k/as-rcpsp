set r / 
Ressource1
Ressource2
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
Beispielvorgang11
Beispielvorgang12
/;

set t / t0*t30 /;

VN(h,i)=no;

VN('Beispielvorgang1','Beispielvorgang2')=yes;
VN('Beispielvorgang1','Beispielvorgang5')=yes;
VN('Beispielvorgang1','Beispielvorgang8')=yes;
VN('Beispielvorgang1','Beispielvorgang10')=yes;
VN('Beispielvorgang2','Beispielvorgang3')=yes;
VN('Beispielvorgang2','Beispielvorgang6')=yes;
VN('Beispielvorgang3','Beispielvorgang4')=yes;
VN('Beispielvorgang4','Beispielvorgang7')=yes;
VN('Beispielvorgang4','Beispielvorgang12')=yes;
VN('Beispielvorgang5','Beispielvorgang6')=yes;
VN('Beispielvorgang6','Beispielvorgang7')=yes;
VN('Beispielvorgang7','Beispielvorgang12')=yes;
VN('Beispielvorgang8','Beispielvorgang9')=yes;
VN('Beispielvorgang9','Beispielvorgang12')=yes;
VN('Beispielvorgang10','Beispielvorgang11')=yes;
VN('Beispielvorgang11','Beispielvorgang12')=yes;
VN('Beispielvorgang6','Beispielvorgang9')=yes;

d('Beispielvorgang1')= 3;
d('Beispielvorgang2')= 2;
d('Beispielvorgang3')= 2;
d('Beispielvorgang4')= 2;
d('Beispielvorgang5')= 3;
d('Beispielvorgang6')= 5;
d('Beispielvorgang7')= 2;
d('Beispielvorgang8')= 2;
d('Beispielvorgang9')= 2;
d('Beispielvorgang10')= 3;
d('Beispielvorgang11')= 2;
d('Beispielvorgang12')= 2;

k(i,r)=0;

k('Beispielvorgang1','Ressource1')= 8;
k('Beispielvorgang2','Ressource1')= 8;
k('Beispielvorgang3','Ressource2')= 10;
k('Beispielvorgang4','Ressource1')= 8;
k('Beispielvorgang5','Ressource2')= 8;
k('Beispielvorgang6','Ressource1')= 9;
k('Beispielvorgang7','Ressource1')= 8;
k('Beispielvorgang8','Ressource2')= 10;
k('Beispielvorgang9','Ressource1')= 8;
k('Beispielvorgang10','Ressource1')= 9;
k('Beispielvorgang11','Ressource1')= 8;
k('Beispielvorgang12','Ressource1')= 8;

KP('Ressource1')= 10;
KP('Ressource2')= 10;

oc('Ressource1')= 7;
oc('Ressource2')= 6;

Deadline=18;
