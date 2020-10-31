#! /usr/bin/gawk -f

# Sorts by ascending order
# ROCINFO["sorted_in"] = "@ind_num_asc"
BEGIN{
	FS=","
	drunkCases=0
	totalCases=0
	friSatAccident=0
	totalCasesMI=0
	drunkCasesMI=0
	darkCasesMI=0
}
#Count total cases so we can calculate proportions
NR>1{totalCases+=1}

#Count drunk driving cases
NR>1 && $52>=1{drunkCases+=1}

#Count accidents on Friday or Saturday
NR>1 && ($15 == 6 || $15 == 7) {friSatAccident+=1}

#Count total Accident cases in michigan
NR>1 && $1 == 26 {totalMI+=1}

#Count total Drunk drivers in michigan accidents
NR>1 && $1 == 26 && $52 >= 1 {drunkCasesMI+=1} 

# Counts accidents in michigan that occured in the dark
NR>1 && $1 == 26 && ($36 == 2 || $36 == 3 || $36 == 6) {darkCasesMI+=1}

#array that holds number of people for each state code in a key where the key is the state code. 
NR>1{stateAccCount[$1]+=$9}
END{
	print "DD Proportion: " drunkCases/totalCases
	print "Friday/Saturday Proportion: " friSatAccident/totalCases
	print "MI DD Proportion: " drunkCasesMI/totalCasesMI
	print "MI Dark Proportion: " darkCasesMI/totalCasesMI
	print "State Code,# People"
	for (key in stateAccCount){
		print key","stateAccCount[key]
	}
}
