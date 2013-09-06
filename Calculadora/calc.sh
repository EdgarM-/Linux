function division(){
	echo $(echo "$1/$2" | bc -l)
}

function multiplicacion(){
	echo $(echo "$1*$2" | bc)
}

multiplicacion $1 $3
