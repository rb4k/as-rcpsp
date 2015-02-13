set i / 
i1
i3
i4
/

j / 
j1
j2
j3
j4
/

l / 
l1
l2
l3
l4
l9
l10
l11
l12
l13
l14
l15
l16
/;

LI(l,i) = no;
LJ(l,j) = no;

LI( 'l1', 'i1') = yes;
LJ( 'l1', 'j1') = yes;

LI( 'l2', 'i1') = yes;
LJ( 'l2', 'j2') = yes;

LI( 'l3', 'i1') = yes;
LJ( 'l3', 'j3') = yes;

LI( 'l4', 'i1') = yes;
LJ( 'l4', 'j4') = yes;

LI( 'l9', 'i3') = yes;
LJ( 'l9', 'j1') = yes;

LI( 'l10', 'i3') = yes;
LJ( 'l10', 'j2') = yes;

LI( 'l11', 'i3') = yes;
LJ( 'l11', 'j3') = yes;

LI( 'l12', 'i3') = yes;
LJ( 'l12', 'j4') = yes;

LI( 'l13', 'i4') = yes;
LJ( 'l13', 'j1') = yes;

LI( 'l14', 'i4') = yes;
LJ( 'l14', 'j2') = yes;

LI( 'l15', 'i4') = yes;
LJ( 'l15', 'j3') = yes;

LI( 'l16', 'i4') = yes;
LJ( 'l16', 'j4') = yes;



Parameter
  A(i) /
i1  20.0
i3  21.0
i4  25.0
/


N(j) /
j1  15.0
j2  17.0
j3  22.0
j4  12.0
/


c(l) /
l1  6.0
l2  2.0
l3  6.0
l4  7.0
l9  8.0
l10  8.0
l11  1.0
l12  6.0
l13  4.0
l14  9.0
l15  5.0
l16  3.0
/

;
