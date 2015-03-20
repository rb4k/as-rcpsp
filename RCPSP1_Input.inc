set r / 
Ressource1
Ressource2
/;

set i / 
Vorgang1
Vorgang2
Vorgang3
Vorgang4
Vorgang5
Vorgang6
Vorgang7
Vorgang8
Vorgang9
Vorgang10
Vorgang11
Vorgang12
/;

set t / t0*t44 /;

VN(h,i)=no;

VN('Vorgang1','Vorgang2')=yes;
VN('Vorgang1','Vorgang5')=yes;
VN('Vorgang1','Vorgang8')=yes;
VN('Vorgang1','Vorgang10')=yes;
VN('Vorgang2','Vorgang3')=yes;
VN('Vorgang2','Vorgang6')=yes;
VN('Vorgang3','Vorgang4')=yes;
VN('Vorgang4','Vorgang7')=yes;
VN('Vorgang4','Vorgang12')=yes;
VN('Vorgang5','Vorgang6')=yes;
VN('Vorgang6','Vorgang7')=yes;
VN('Vorgang7','Vorgang12')=yes;
VN('Vorgang8','Vorgang9')=yes;
VN('Vorgang9','Vorgang12')=yes;
VN('Vorgang10','Vorgang11')=yes;
VN('Vorgang11','Vorgang12')=yes;
VN('Vorgang1','Vorgang11')=yes;

d('Vorgang1')= 3;
d('Vorgang2')= 2;
d('Vorgang3')= 4;
d('Vorgang4')= 5;
d('Vorgang5')= 3;
d('Vorgang6')= 5;
d('Vorgang7')= 3;
d('Vorgang8')= 5;
d('Vorgang9')= 2;
d('Vorgang10')= 4;
d('Vorgang11')= 5;
d('Vorgang12')= 3;

k(i,r)=0;

k('Vorgang1','Ressource1')= 8;
k('Vorgang2','Ressource1')= 8;
k('Vorgang3','Ressource2')= 10;
k('Vorgang4','Ressource1')= 8;
k('Vorgang5','Ressource2')= 8;
k('Vorgang6','Ressource1')= 9;
k('Vorgang7','Ressource1')= 8;
k('Vorgang8','Ressource2')= 10;
k('Vorgang9','Ressource1')= 8;
k('Vorgang10','Ressource1')= 9;
k('Vorgang11','Ressource1')= 8;
k('Vorgang12','Ressource1')= 8;

KP('Ressource1')= 10;
KP('Ressource2')= 10;

Deadline= 44;
