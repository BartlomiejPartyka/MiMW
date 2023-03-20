clc
clear
clf
//Dane zadania
//Wymiary belki: L1, L2, L3, L4
//siła skupiona P
//obciążenie równomierne q
disp('Program zad1 ')
P = input('Podaj wartość siły skupionej P[kN] ')
q = input('Podaj wartość obciążania równomiernego 1[kN/m] ')
L1 = input('Podaj długość odcinka L1[m] ')
while L1 < 0
    disp('BŁĄD! Długość nie może być ujemna. Wporowadź dane jeszcze raz ')
    L1 = input('Podaj długość odcinka L1[m] ')
end
L2 = input('Podaj długość odcinka L2[m] ')
while L2 < 0
    disp('BŁĄD! Długość nie może być ujemna. Wporowadź dane jeszcze raz ')
    L2 = input('Podaj długość odcinka L2[m] ')
end
L3 = input('Podaj długość odcinka L3[m] ')
while L3 < 0
    disp('BŁĄD! Długość nie może być ujemna. Wporowadź dane jeszcze raz ')
    L3 = input('Podaj długość odcinka L3[m] ')
end
L4 = input('Podaj długość odcinka L4[m] ')
while L4 < 0
    disp('BŁĄD! Długość nie może być ujemna. Wporowadź dane jeszcze raz ')
    L4 = input('Podaj długość odcinka L4[m] ')
end
//Reakcje
//W wypadkowa
disp('Wypadkowa: ')
W = q * L3
disp(W)
disp('Reakcja w podporze RB: ')
Rb = ((P * (L1 + L2 + L3) + W * (L3/2)))/(L2 + L3)
disp(Rb)
disp('Reakcja w podporze RD: ')
Rd = P + W - Rb
disp(Rd) 
disp('suma Py: ')
Py = P + W - Rb - Rd
disp(Py)
//tnące
//przediał 
x1 = linspace(0, L1, 101)
function y1 = tnaca1(x1)
    y1 = -P
    //disp("T1:")
    //disp(y1)
endfunction
x2 = linspace(0, L2, 101)
function y2 = tnaca2(x2)
    y2 = Rb - P
    //disp("T2:")
    //disp(y2)
endfunction
x3 = linspace(0, L3, 101)
function y3 = tnaca3(x3)
    y3 = Rb - P - q * x3
    //disp("T3:")
    //disp(y3)
endfunction
x4 = linspace(0, L4, 101)
function y4 = tnaca4(x4)
    y4 = Rb - P - (q * L3) + Rd
    //disp("T4:")
    //disp(y4)
endfunction
for i=1:101 
    T1(1, i) = tnaca1(x1(i))
    T2(1, i) = tnaca2(x2(i))
    T3(1, i) = tnaca3(x3(i))
    T4(1, i) = tnaca4(x4(i))
end
T = [T1 T2 T3 T4]
XTOT=[x1 L1+x2 L1+L2+x3 L1+L2+L3+x4] //!!! Zbior punktow przedzialu x2 musimy odsunac o L1
subplot(2,1,1) //okno 2wiersze 1 kolumna, rysunek gorny
plot(XTOT,T,'color','blue')
//subplot(2,1,2) //okno 2wiersze 1 kolumna, rysunek dolny
//plot(XTOT,M,'color','purple')
