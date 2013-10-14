set terminal pngcairo 
set output "blancas.png"
set ylabel "numero de lineas blancas"
set xlabel "archivo .py"
set title "grafica total lineas blancas"
plot "Blancas.txt" u 2:xtic(1) w histogram notitle 

