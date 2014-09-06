reset
set terminal epslatex color
set output 'Drosselspule.tex'
set xlabel 'Zeit [ms]'
set ylabel '$\ln(U)$'
set key top left

#set xrange[0:0.001]

f(x)=m*x+b

set fit logfile 'Drosselspule.log'
fit f(x) 'Drosselspule.dat' u 1:(log($2)):(0.1/$2) via m,b
g(x)=f(x/10**3)

p 'Drosselspule.dat' u ($1*10**3):(log($2)):(0.1/$2) w e t'Messwerte' ,\
g(x) lt -1 t'Regressionsgerade'

set output
!epstopdf Drosselspule.eps
!rm Drosselspule.eps

#====================================================================

set output 'Luftspule.tex'
set xlabel 'Zeit [$\mu$s]'


set fit logfile 'Luftspule.log'
fit f(x) 'Luftspule.dat' u 1:(log($2)):(0.1/$2) via m,b
g(x)=f(x/10**6)

p 'Luftspule.dat' u ($1*10**6):(log($2)):(0.1/$2) w e t'Messwerte' ,\
g(x) lt -1 t'Regressionsgerade'

set output
!epstopdf Luftspule.eps
!rm Luftspule.eps