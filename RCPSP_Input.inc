set i / 
Beispielvorgang-1
Beispielvorgang-2
Beispielvorgang-3
Beispielvorgang-4
Beispielvorgang-5
Beispielvorgang-6
Beispielvorgang-7
Beispielvorgang-8
Beispielvorgang-9
Beispielvorgang-10
Beispielvorgang-11
Beispielvorgang-12
Beispielvorgang-13
Beispielvorgang-14
Beispielvorgang-15
Beispielvorgang-16
Beispielvorgang-17
Beispielvorgang-18
Beispielvorgang-19
Beispielvorgang-20
Beispielvorgang-21
Beispielvorgang-22
Beispielvorgang-23
Beispielvorgang-24
Beispielvorgang-25
Beispielvorgang-26
Beispielvorgang-27
Beispielvorgang-28
Beispielvorgang-29
Beispielvorgang-30
/

set t0*t200 /

set r / 
Ressource-1
Ressource-2
Ressource-3
Ressource-4
Ressource-5
Ressource-6
Ressource-7
Ressource-8
Ressource-9
Ressource-10
/;

VN(h,i)=no;

VN('Beispielvorgang-1','Beispielvorgang-2')=yes;
VN('Beispielvorgang-1','Beispielvorgang-3')=yes;
VN('Beispielvorgang-1','Beispielvorgang-4')=yes;
VN('Beispielvorgang-2','Beispielvorgang-5')=yes;
VN('Beispielvorgang-3','Beispielvorgang-6')=yes;
VN('Beispielvorgang-4','Beispielvorgang-7')=yes;
VN('Beispielvorgang-5','Beispielvorgang-8')=yes;
VN('Beispielvorgang-6','Beispielvorgang-8')=yes;
VN('Beispielvorgang-7','Beispielvorgang-9')=yes;
VN('Beispielvorgang-8','Beispielvorgang-10')=yes;
VN('Beispielvorgang-9','Beispielvorgang-10')=yes;
VN('Beispielvorgang-1','Beispielvorgang-1')=yes;

d('Beispielvorgang-1')= 2;
d('Beispielvorgang-2')= 3;
d('Beispielvorgang-3')= 4;
d('Beispielvorgang-4')= 5;
d('Beispielvorgang-5')= 6;
d('Beispielvorgang-6')= 7;
d('Beispielvorgang-7')= 8;
d('Beispielvorgang-8')= 9;
d('Beispielvorgang-9')= 10;
d('Beispielvorgang-10')= 11;
d('Beispielvorgang-11')= 12;
d('Beispielvorgang-12')= 13;
d('Beispielvorgang-13')= 14;
d('Beispielvorgang-14')= 15;
d('Beispielvorgang-15')= 16;
d('Beispielvorgang-16')= 17;
d('Beispielvorgang-17')= 18;
d('Beispielvorgang-18')= 19;
d('Beispielvorgang-19')= 20;
d('Beispielvorgang-20')= 21;
d('Beispielvorgang-21')= 22;
d('Beispielvorgang-22')= 23;
d('Beispielvorgang-23')= 24;
d('Beispielvorgang-24')= 25;
d('Beispielvorgang-25')= 26;
d('Beispielvorgang-26')= 27;
d('Beispielvorgang-27')= 28;
d('Beispielvorgang-28')= 29;
d('Beispielvorgang-29')= 30;
d('Beispielvorgang-30')= 31;

k(i,r)=0;

k('Beispielvorgang-1','Ressource-1')= 6;
k('Beispielvorgang-2','Ressource-9')= 7;
k('Beispielvorgang-3','Ressource-8')= 8;
k('Beispielvorgang-4','Ressource-5')= 9;
k('Beispielvorgang-5','Ressource-4')= 10;
k('Beispielvorgang-6','Ressource-5')= 11;
k('Beispielvorgang-7','Ressource-3')= 12;
k('Beispielvorgang-8','Ressource-6')= 13;
k('Beispielvorgang-9','Ressource-2')= 14;
k('Beispielvorgang-10','Ressource-8')= 15;
k('Beispielvorgang-11','Ressource-10')= 16;
k('Beispielvorgang-12','Ressource-9')= 17;
k('Beispielvorgang-13','Ressource-4')= 18;
k('Beispielvorgang-14','Ressource-9')= 19;
k('Beispielvorgang-15','Ressource-7')= 20;
k('Beispielvorgang-16','Ressource-9')= 21;
k('Beispielvorgang-17','Ressource-8')= 22;
k('Beispielvorgang-18','Ressource-6')= 23;
k('Beispielvorgang-19','Ressource-9')= 24;
k('Beispielvorgang-20','Ressource-5')= 25;
k('Beispielvorgang-21','Ressource-7')= 26;
k('Beispielvorgang-22','Ressource-6')= 27;
k('Beispielvorgang-23','Ressource-6')= 28;
k('Beispielvorgang-24','Ressource-2')= 29;
k('Beispielvorgang-25','Ressource-2')= 30;
k('Beispielvorgang-26','Ressource-8')= 31;
k('Beispielvorgang-27','Ressource-3')= 32;
k('Beispielvorgang-28','Ressource-10')= 33;
k('Beispielvorgang-29','Ressource-6')= 34;
k('Beispielvorgang-30','Ressource-1')= 35;

KP('Ressource-1')= 105;
KP('Ressource-2')= 40;
KP('Ressource-3')= 35;
KP('Ressource-4')= 40;
KP('Ressource-5')= 74;
KP('Ressource-6')= 0;
KP('Ressource-7')= 0;
KP('Ressource-8')= 32;
KP('Ressource-9')= 0;
KP('Ressource-10')= 53;

