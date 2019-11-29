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

			#number = grep name players.csv | wc -l

			#if [ number == 1 ]; then
			#grep -Fxq "$FILENAME" my_list.txt

			echo name

			grep -Fq $name players.csv

			if grep -Fq "$name" players.csv ;
			then
				echo -e "Do you want to overwrite the existing data."
				echo -e "Enter 1 for overwrite and anything else for skip"
				read choice

				if [ "$choice" == 1 ]; then
					grep -F -v "$name" players.csv > temp.csv && mv temp.csv players.csv
					echo -e "$name\t$average\t$team" >> players.csv
				else 
					echo "Success"
				fi
			else
				#echo "Sorry, no records found."
				echo -e "$name\t$average\t$team" >> players.csv
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
			read name

			#number = grep name players.csv | wc -l

			if grep -Fq "$name" players.csv
			then
				echo -e "Name\tAverage\tTeam"
				grep "$name" players.csv
				echo -e "Do you want to delete the existing data."
				echo -e "Enter 1 for delete and any other integer for skip"
				read choice

				if [ "$choice" == 1 ]; then
					grep -F -v "$name" players.csv > temp.csv && mv temp.csv players.csv
					#echo -e "$name\t$team\t$average" >> players.csv
				else 
					echo "Success"
				fi
			else
				echo "Sorry, no records found."
				#echo -e "$name\t$team\t$average" >> players.csv
			fi;;

			#echo "Press Enter to continue..."
			#read something;;

		4)
			echo -e "\nDELETE:"
			echo -n "Enter the name: "
			read name

			grep -F -v "$name" players.csv > temp.csv && mv temp.csv players.csv;;


		5)	exit;;

		*)
			echo "Invalid choice.";;
	esac
done