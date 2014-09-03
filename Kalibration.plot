reset
set terminal epslatex color
set output 'Kalibration.tex'
set xlabel 'Ladung [$\mu$C]'
set ylabel 'Skalen-Teile'
set key top left

#set xrange[0:0.001]

f(x)=m*x+b

set fit logfile 'Kalibration.log'
fit f(x) 'Kalibration.dat' u ($1*1.238/10**10):2 via m,b
p 'Kalibration.dat' u ($1*1.238/10**10):2 t'Messwerte' ,\
f(x) lt -1 t'Regressionsgerade'

set output
!epstopdf Kalibration.eps
