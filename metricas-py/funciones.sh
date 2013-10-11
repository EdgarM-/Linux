function funciones()
{
        echo $1 $(grep -c "def " $1) >> funciones.txt
}
funciones $1


