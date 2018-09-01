% Okumura model function
function L50=oku(hre,hte,fc,d,Amu,GAREA)
wavelength=3*10^8/(fc*10^6);    % wavelength in meter
LF=-10*log10(wavelength^2./(4*pi*d*10^3).^2);    % free space propagation loss in dB
Ghte=20*log(hte/200);    % base station's antenna-height gain-factor in dB
Ghre=20*log(hre/3);    % mobile's antenna-height gain-factor in dB when 10m > hre > 3m
L50=LF+Amu-Ghte-Ghre-GAREA;    % median path-loss value in dB
end