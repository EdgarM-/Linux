##Calculadora 
function resta() {
	echo $(echo $1 - $2 | bc)
}
resta $1 $3


