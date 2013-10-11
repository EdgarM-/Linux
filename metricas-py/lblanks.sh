blanks_out="Blancas.txt"
function lines()
{
  echo $(grep -ce ^$ $1) >> $blanks_out
}

lines $1

