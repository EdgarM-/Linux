#
# Total de lineas de codigo
#

TLINEAS_OUT="Total.txt"

function t_lineas(){
    echo $1 $(awk 'END { print NR}' $1) >> $TLINEAS_OUT
}

t_lineas $1
