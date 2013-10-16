set terminal pngcairo 
set output "comments.png"
set ylabel "numero de comentarios"
set xlabel "archivo .py"
set title "Grafica total comentarios"
plot "Comments.txt" u 2:xtic(1) w histogram notitle 

