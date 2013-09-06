#Calculadora 

function sumar()
{
    echo $(echo "$1 + $2" | bc -l)
}
sumar $1 $3
