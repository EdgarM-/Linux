set terminal pngcairo 
set output "funciones.png"
set ylabel "numero de funciones"
set xlabel "archivo .py"
set title "grafica total funciones"
plot "Funciones.txt" u 2:xtic(1) w histogram notitle 

