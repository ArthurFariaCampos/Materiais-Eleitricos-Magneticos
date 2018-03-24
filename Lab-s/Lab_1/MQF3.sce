//Exemplo: Ajuste de Modelo por Mínimos Quadrados
//Caso com 3 Funções-base Não-Ortogonais
//%Programa:MQF3.sce

clear;
N = 12;
xp = linspace(-4,4,N);
fp = 3*cos(xp) - 2*sin(2*xp) + 10;

plot(xp,fp,'or');

//Funções Base Não- (Necessariamente) Ortogonais
g1 = cos(xp);
g2 = sin(2*xp);
g3 = ones(1,N);

a11 = sum(g1.*g1);
a12 = sum(g1.*g2);
a13 = sum(g1.*g3);
a21 = sum(g2.*g1);
a22 = sum(g2.*g2);
a23 = sum(g2.*g3);
a31 = sum(g3.*g1);
a32 = sum(g3.*g2);
a33 = sum(g3.*g3);

b1 = sum(fp.*g1);
b2 = sum(fp.*g2);
b3 = sum(fp.*g3);

A = [ a11 a12 a13; a21 a22 a23; a31 a32 a33 ];
b = [b1; b2; b3];

alfa = A\b;
disp(alfa);

M = 100;
xc = linspace(min(xp),max(xp),M);
gc1 = cos(xc);
gc2 = sin(2*xc);
gc3 = ones(1,M);

fc = alfa(1)*gc1 + alfa(2)*gc2 + alfa(3)*gc3;
plot(xc,fc,'b');

EQT = sum((fp - (alfa(1)*g1 + alfa(2)*g2 + alfa(3)*g3)).^2);
disp(EQT,'EQT = ');
