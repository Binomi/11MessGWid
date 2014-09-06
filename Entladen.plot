reset
set terminal epslatex color
set output 'Entladen1.tex'
set xlabel 'Zeit [s]'
set ylabel '$\ln(Q/Q_0)$'
set key top right

set xrange[0:70]

f(x)=m*x+b
offset = 0.007
Q0 = 0.7765 - offset
sigma = 0.005

set fit logfile 'Entladen1.log'
fit f(x) 'Entladen1.dat' u 1:(log(($2-offset)/Q0)):(sigma/($2-offset)-log(Q0)) via m,b
p 'Entladen1.dat' u 1:(log(($2-offset)/Q0)):(sigma/($2-offset)-log(Q0)) w e t'Messwerte' ,\
f(x) lt -1 t'Regressionsgerade'

set output
!epstopdf Entladen1.eps
!rm Entladen1.eps

#=====================================================================
set output 'Entladen2.tex'

set xrange[0:360]

offset = 0.007
Q0 = 0.776 - offset

set fit logfile 'Entladen2.log'
fit f(x) 'Entladen2.dat' u ($1*60):(log(($2-offset)/Q0)):(sigma/($2-offset)-log(Q0)) via m,b
p 'Entladen2.dat' u ($1*60):(log(($2-offset)/Q0)):(sigma/($2-offset)-log(Q0)) w e t'Messwerte' ,\
f(x) lt -1 t'Regressionsgerade'

set output
!epstopdf Entladen2.eps
!rm Entladen2.eps