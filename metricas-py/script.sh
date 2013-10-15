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

function t_lineas(){ 
    echo $1 $(awk 'END { print NR}' $1) >> $TLINEAS_OUT 
} 

#
# Total de comentarios
#

function comment()
{
  echo $1 $(grep -c \# $1) >> $COMMS_OUT
}

#
# Total de definiciones de funciones
#

function funciones()
{
        echo $1 $(grep -c "def " $1) >> $FUNCIONES_OUT
}

#
# Total de lineas blancas
#

function lines()
{
  echo $1 $(grep -ce ^$ $1) >> $BLANKS_OUT
}

for SCRIPT_IN in ${SCRIPTS_IN[@]}
do
	lines $SCRIPT_IN
	t_lineas $SCRIPT_IN
	comment $SCRIPT_IN
	funciones $SCRIPT_IN
done

exit 0
