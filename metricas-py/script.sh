FUNCIONES_OUT="Funciones.txt"
TLINEAS_OUT="Total.txt"
COMMS_OUT="Comments.txt"
BLANKS_OUT="Blancas.txt"

if [ -f $FUNCIONES_OUT ]
then
    rm $FUNCIONES_OUT
fi

if [ -f $TLINEAS_OUT ]
then
    rm $TLINEAS_OUT
fi

if [ -f $COMMS_OUT ]
then
    rm $COMMS_OUT
fi

if [ -f $BLANKS_OUT ]
then
    rm $BLANKS_OUT
fi

SCRIPTS_IN=`zenity --file-selection --multiple --separator=" "`

# 
# Total de lineas de codigo 
# 

function t_lineas()
{ 
    echo $(abstorel $1) $(awk 'END { print NR}' $1) >> $TLINEAS_OUT 
} 

#

# Total de comentarios
#

function comment()
{
    echo $(abstorel $1) $(grep -c \# $1) >> $COMMS_OUT
}

#
# Total de definiciones de funciones
#

function funciones()
{
    echo $(abstorel $1) $(grep -c "def " $1) >> $FUNCIONES_OUT
}

#
# Total de lineas blancas
#

function lines()
{
    echo $(abstorel $1) $(grep -ce ^$ $1) >> $BLANKS_OUT
}
#
# Pasar de direccion absoluta a direccion relativa(http://stackoverflow.com/questions/2564634/bash-convert-absolute-path-into-relative-path-given-a-current-directory, de ahi se saco el script y se le hicieron pequeños cambios)
#

function abstorel()
{
    source=$(pwd)
    target=$1

    common_part=$source 
    result=""

    while [[ "${target#$common_part}" == "${target}" ]]; do
	common_part="$(dirname $common_part)"
	if [[ -z $result ]]; then
            result=".."
	else
            result="../$result"
	fi
    done

    if [[ $common_part == "/" ]]; then
	result="$result/"
    fi

    forward_part="${target#$common_part}"

    if [[ -n $result ]] && [[ -n $forward_part ]]; then
	result="$result$forward_part"
    elif [[ -n $forward_part ]]; then
	result="${forward_part:1}"
    fi

    echo $result
} 

for SCRIPT_IN in ${SCRIPTS_IN[@]}
do
	lines $SCRIPT_IN
	t_lineas $SCRIPT_IN
	comment $SCRIPT_IN
	funciones $SCRIPT_IN
done

if [ -f "comments.png" ]
then
    rm comments.png
fi

if [ -f "funciones.png" ]
then
    rm funciones.png
fi

if [ -f "blancas.png" ]
then
    rm blancas.png
fi

if [ -f "lineas.png" ]
then
    rm lineas.png
fi


GRAFICS_IN=`zenity --hide-column 2 --print-column 2 --list  --column "Grafica que desea sacar" --column "columna oculta" "Comentarios" "c" "Funciones" "f"  "Lineas en blanco" "l" "Total de lineas" "t" "Todas las anteriores" "a" --separator=" " --multiple`

for GRAFICS_IN in ${GRAFICS_IN[@]}
do
	if [ $GRAFICS_IN = "c" ];then
		gnuplot comments.gp
	fi
	if [ $GRAFICS_IN = "f" ];then
                gnuplot funciones.gp
        fi
	if [ $GRAFICS_IN = "l" ];then
                gnuplot lblanks.gp
        fi
	if [ $GRAFICS_IN = "t" ];then
                gnuplot lineas.gp
        fi

	if [ $GRAFICS_IN = "a" ];then
                gnuplot lineas.gp
                gnuplot lblanks.gp
		gnuplot comments.gp
		gnuplot funciones.gp
        fi
done

exit 0


