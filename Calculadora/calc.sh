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

case "$2" in 
"+") 
sumar  $1 $3
;;
"-")
resta $1 $3
;;
"x")
multiplicacion $1 $3
;;
"/")
division $1 $3
;;
*)
echo "Usage: $0 num1 {+|-|x|/} num2"
esac


