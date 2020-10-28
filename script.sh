#array of problem sizes to run
numofPrblems=(8 16 32) 

#for each input file in arguments
for file in $@
do
	for val in "${numofPrblems[@]}"
	do
		#run the passed file for each numofPrblems as an parameter, output to file
		python3 $file.py $numofPrblems >> $file.out

	done
done
