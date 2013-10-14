set terminal pngcairo 
set output "leneas.png"
set ylabel "numero de lineas"
set xlabel "archivo .py"
set title "grafica total lineas"
plot "Total.txt" u 2:xtic(1) w histogram notitle 

