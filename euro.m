% Euro-COST model function
function L50=euro(fc,hre,hte,d,CM)
ahre=(1.1*log10(fc)-0.7)*hre-(1.56*log10(fc)-0.8);  % correction factor for a small- to medium-sized city in dB
L50=46.3+33.9*log10(fc)-13.82*log10(hte)-ahre+(44.9-6.55*log10(hte))*log10(d*10^3)+CM;   % median path-loss value in dB
end