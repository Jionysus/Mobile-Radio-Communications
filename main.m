% EIE531 Project - by ZHANG Yan, LIN Haoyu, LAI Danhui, LI Junxian
ID=[17087356,17084204,17095352,17089541];    % PolyU ID numbers of all group members
S=sum(ID);    % sum of the ID numbers
N=num2str(S);    % number of the sum in string
k0=str2double(N(length(N)));    % the sum's least significant digit
k1=str2double(N(length(N)-1));    % the sum's next significant digit

% Part 1 - Okumura model
hre=5:10;    % mobile's antenna height in meter
hte=50+50*k1;    % base station's antenna height in meter
fc=500;    % frequency in MHz
d=[1,6,11,16,21,26,31,36];    % distance in km
Amu=[18,24.5,28,28.5,30,32,34,36];    % median attenuation relative to free space in dB (according to [Oku68])
GAREA=8;    % gain due to the suburban type of area in dB (according to [Oku68])
[d,hre]=meshgrid(d,hre);    % replicate d and hre to the 2-D space
Amu=repmat(Amu,6,1);    % replicate Amu to the 2-D space
L50=oku(hre,hte,fc,d,Amu,GAREA);    % median path-loss value in dB
figure(1)
surf(d,hre,L50)    % to plot the Path Loss (dB) versus Distance (km) & Mobile Antenna Height (meters)
grid on
xlabel('Distance (km)')
ylabel('Mobile Antenna Height (meters)')
zlabel('Path Loss (dB)')
title('Part 1--Okumura model--Path Loss versus Distance & Mobile Antenna Height')

% Part 1 - Euro-COST model
fc=1800;    % frequency in MHz
hre=5:10;    % mobile's antenna height in meter
hte=50+10*k1;    % base station's antenna height in meter
d=1:13;    % distance in km
CM=0;    % for medium sized city and surburben areas in dB
[d,hre]=meshgrid(d,hre);    % replicate d and hre to the 2-D space
L50=euro(fc,hre,hte,d,CM);    % median path-loss value in dB
figure(2)
surf(d,hre,L50)    % to plot the Path Loss (dB) versus Distance (km) & Mobile Antenna Height (meters)
grid on
xlabel('Distance (km)')
ylabel('Mobile Antenna Height (meters)')
zlabel('Path Loss (dB)')
title('Part 1--Euro-COST model--Path Loss versus Distance & Mobile Antenna Height')

% Part 2 - Okumura model
hre=5:10;
hte=k1+10*hre;
d=k0+10;
fc=[100,200,300,500,700,1000];
Amu=[25.5,26,26.5,28,29,30];
GAREA=[5,6,7,8,8.5,9.5];
figure(3)
for i=1:6
    L50=oku(hre,hte,fc(i),d,Amu(i),GAREA(i));
    plot(hre,L50)    % to plot the Path Loss (dB) versus Mobile Antenna Height (meters) in 100MHz
    hold on
end
grid on
xlabel('Mobile Antenna Height (meters)')
ylabel('Path Loss (dB)')
title('Part 2--Okumura model--Path Loss versus Mobile Antenna Height')
legend('100MHz','200MHz','300MHz','500MHz','700MHz','1000MHz')

% Part 2 - Euro-COST model
fc=[1500,1650,1800,1850,1900,2000];
figure(4)
for i=1:6
    L50=euro(fc(i),hre,hte,d,CM);
    plot(hre,L50)    % to plot the Path Loss (dB) versus Mobile Antenna Height (meters) in 1500MHz
    hold on
end
grid on
xlabel('Mobile Antenna Height (meters)')
ylabel('Path Loss (dB)')
title('Part 2--Euro-COST model--Path Loss versus Mobile Antenna Height')
legend('1500MHz','1650MHz','1800MHz','1850MHz','1900MHz','2000MHz')