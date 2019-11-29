#!/bin/bash
# Srinjayumar.co.in v0.1.4

while [ 1 ]; do
	echo -e "\nCRICKET BOOK"
	echo -e "==========\n"

	echo -e "Please select an option from the following: \
	         \n\t1) Insert\n\t2) Display All\n\t3) Search\n\t4) Delete\n\t5) Exit\n"
	echo "Enter your choice: "
	read choice

	case $choice in
		1)
			echo -e "\nINSERT:"
			echo -n "Enter the name: "
			read name
			echo -n "Enter the team name: "
			read team
			echo -n "Enter the batting average: "
			read average

			if [ grep name players.csv | wc -l ]; then
				echo -e "Do you want to overwrite the existing data."
				echo -e "Enter 1 for overwrite and anything else for skip"
				read choice

				if [ choice == 1 ]; then
					grep -F -v name players.csv > temp.csv && mv temp.csv players.csv
					echo -e "$name\t$team\t$average" >> players.csv
				else 
					echo "Success"
				fi
			else
				#echo "Sorry, no records found."
				echo -e "$name\t$team\t$average" >> players.csv
			fi;;

			#echo -e "$name\t$team\t$average" >> players.csv;;

		2)
			echo -e "\nALL RECORDS:"
			if [ -e players.csv ]; then
				echo -e "Name\tPhone no."
				cat players.csv
			else
				echo "Sorry, no records found."
			fi;;

		3)
			echo -e "\nSEARCH:"
			echo -n "Enter the query: "
			read query
			echo -n "Search by name or country (enter 1 for name, anything else for country): "
			read method

			retval=$(cat contacts.csv | awk -v q="$query" -v meth="$method" '{
				FS="\t"
				if( (meth == 1 && tolower($1) == tolower(q)) ||
				    (meth != 1 && tolower($2) == tolower(q)) )
				{
					print "Name: " $1
					print "Country: " $2
				}
			}')

			if [ -n "$retval" ]; then
				echo -e "\n$retval\n"
			else
				echo "Sorry, $query not found."
			fi
			echo "Press Enter to continue..."
			read something;;

		4)
			echo -e "\nDELETE:"
			echo -n "Enter the name: "
			read name

			grep -F -v name players.csv > temp.csv && mv temp.csv players.csv;;


		5)	exit;;

		*)
			echo "Invalid choice.";;
	esac
done