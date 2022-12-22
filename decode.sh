#!/bin/bash

# echo Here

# # $0 - The name of the script
# # $1 - The first argument sent to the script
# # $2 - The second argument sent to the script
# # $3 - The third argument... and so forth
# # $# - The number of arguments provided
# # $@ - A list of all arguments provided

# argument definition
while getopts s:t: flag
do
    case "${flag}" in
        v) video=${OPTARG};;
        s) seconds=${OPTARG};;
        t) topic=${OPTARG};;
    esac
done

# argument handling
if [ $# -eq 0 ];
then
  echo "$0: Missing arguments"
  exit 1
elif [ $# -gt 3 ];
then
  echo "$0: Too many arguments: $@"
  exit 1
fi


# decode for the specified time(seconds)
echo decoding frames at $seconds 

declare -i FPS=25
declare -i FRAMES_START=$seconds*$FPS
declare -i FRAMES_END=$FRAMES_START+$FPS
echo $FRAMES_START $FRAMES_END


#======TODO=======
#prepareFrames

for i in `seq $FRAMES_START $FRAMES_END`
do
  FRAME=$(printf '%04d' $i)
  echo $FRAME
  #TODO: CATCH ERROR FILE NOT EXIST 
  python bottomofthesea.py decode --video $video --seconds $seconds

done