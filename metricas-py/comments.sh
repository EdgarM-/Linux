Out_comms="Comments.txt" 
function comment()
{
  echo $(grep -c \# $1) >> $Out_comms
}

comment $1
