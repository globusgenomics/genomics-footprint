#/bin/bash/

# get all txt files from the current directory
files=/scratch/data/completed/*.txt
fil=`echo $files | cut -f 1 -d " "`

#loop through the files and apply the awk command 
for i in $files
do
	name=`echo $i | rev |  cut -f 1 -d "/" | rev | cut -f 1 -d "."`
	name2=`echo "$name.edit.txt"`
	echo $name2
	awk -F '\t' '{print $0"\t""chr"$2":"$3"-"$4}' $i > $name2 &
done
