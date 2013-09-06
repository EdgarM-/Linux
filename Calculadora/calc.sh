# Calculadora

function division()
{
	echo $(echo "$1/$2" | bc -l)
}

function multiplicacion()
{
	echo $(echo "$1*$2" | bc)
}

function sumar()
{
	echo $(echo "$1 + $2" | bc -l)
}

function resta() {
	echo $(echo "$1 - $2" | bc)
}

