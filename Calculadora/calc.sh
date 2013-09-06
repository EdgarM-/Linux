let A=$1
let B=$3

function division(){
	echo $(echo "$A/$B" | bc -l)
}

function multiplicacion(){
	echo $(echo "$A*$B" | bc)
}

multiplicacion
