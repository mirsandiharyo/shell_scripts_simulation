directory="$(dirname "$0")/"
initFilename="F"
files=`exec ls $directory | grep $initFilename | sed 's/\([0-9]\+\).*/\1/g' | tr '\n' ' '`

echo "Files"
echo $files
echo ""

for file in $files
do
	filename=${file%.*} 
	fileId=${filename//[^0-9]/} 
  	value=$((fileId%400))
    if [[ $value != 0 ]]; then #can not be divided by 400
    	echo Remove $filename.ft3
    	rm $directory$filename.ft3
    fi
done

echo "Files are removed succesfully, here are the remaining files."
ls $directory 

