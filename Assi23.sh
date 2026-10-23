if [ "$EUID" -ne 0 ];
then
	echo "Please run this script with sudo / root privileges"
	exit 1
fi

while true
do
echo "1. Add New User || 2. Remove User || 3. Rename User || 4. Update Password || 5. Lock Account || 6. Unlock Account || 7. Show User Details || 8. Show User Groups || 9. List All Users || 10. Verify User || 11. Show Logged-in Users || 12. Change Login Shell || 13. Change Home Path || 14. Set Expiry Date || 15. Show Account Details || 16. Delete User with Home || 17. Exit"

read -p "Enter Your Choice : " ch

case $ch in

	1)
		read -p "Enter The Username : " username

		if id "$username" &>/dev/null
		then
			echo "User Already Exists"
		else
			useradd -m "$username"

			if [ "$?" -eq 0 ];
			then
				echo "User Added Successfully"
			else
				echo "Unable To Add User"
			fi
		fi
		;;

	2)
		read -p "Enter The Username : " usernm

		if id "$usernm" &>/dev/null
		then
			read -p "Confirm Delete $usernm (y/n) : " confirm

			if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ];
			then
				userdel "$usernm"

				if [ "$?" -eq 0 ];
				then
					echo "User Deleted Successfully"
				else
					echo "Unable To Delete User"
				fi
			else
				echo "User Deletion Cancelled"
			fi
		else
			echo "User Does Not Exist"
		fi
		;;

	3)
		read -p "Enter The Old Username : " oldName
		read -p "Enter The New Username : " newName

		if id "$oldName" &>/dev/null
		then
			usermod -l "$newName" "$oldName"

			if [ "$?" -eq 0 ];
			then
				echo "Username Changed Successfully"
			else
				echo "Username Change Failed"
			fi
		else
			echo "Old User Does Not Exist"
		fi
		;;

	4)
		read -p "Enter The Username : " userName

		if id "$userName" &>/dev/null
		then
			passwd "$userName"

			if [ "$?" -eq 0 ];
			then
				echo "Password Updated Successfully"
			else
				echo "Password Update Failed"
			fi
		else
			echo "User Does Not Exist"
		fi
		;;

	5)
		read -p "Enter The Username : " userName

		if id "$userName" &>/dev/null
		then
			usermod -L "$userName"

			if [ "$?" -eq 0 ];
			then
				echo "User Account Locked Successfully"
			else
				echo "Unable To Lock User Account"
			fi
		else
			echo "User Does Not Exist"
		fi
		;;

	6)
		read -p "Enter The Username : " userName

		if id "$userName" &>/dev/null
		then
			usermod -U "$userName"

			if [ "$?" -eq 0 ];
			then
				echo "User Account Unlocked Successfully"
			else
				echo "Unable To Unlock User Account"
			fi
		else
			echo "User Does Not Exist"
		fi
		;;

	7)
		read -p "Enter The Username : " username

		if id "$username" &>/dev/null
		then
			echo "----- User Information -----"
			id "$username"
			getent passwd "$username"
		else
			echo "User Does Not Exist"
		fi
		;;

	8)
		read -p "Enter The Username : " userName

		if id "$userName" &>/dev/null
		then
			gp=$(id -nG "$userName")
			echo "User Groups : $gp"
		else
			echo "No User/Group Found"
		fi
		;;

	9)
		echo "----- All System Users -----"
		cut -d: -f1 /etc/passwd
		;;

	10)
		read -p "Enter The Username : " userName

		if id "$userName" &>/dev/null
		then
			echo "User Exists"
		else
			echo "User Does Not Exist"
		fi
		;;

	11)
		echo "----- Currently Logged-in Users -----"
		w -h
		;;

	12)
		read -p "Enter The Username : " username
		read -p "Enter The Login Shell : " shell

		if id "$username" &>/dev/null
		then
			usermod -s "$shell" "$username"

			if [ "$?" -eq 0 ];
			then
				echo "User Shell Changed Successfully"
			else
				echo "User Shell Change Failed"
			fi
		else
			echo "User Does Not Exist"
		fi
		;;

	13)
		read -p "Enter The Username : " username
		read -p "Enter The New Home Directory : " home_dir

		if id "$username" &>/dev/null
		then
			usermod -d "$home_dir" -m "$username"

			if [ "$?" -eq 0 ];
			then
				echo "User Home Directory Changed Successfully"
			else
				echo "Home Directory Change Failed"
			fi
		else
			echo "User Does Not Exist"
		fi
		;;

	14)
		read -p "Enter The Username : " username
		read -p "Enter The Expiration Date (YYYY-MM-DD) : " expire_date

		if id "$username" &>/dev/null
		then
			chage -E "$expire_date" "$username"

			if [ "$?" -eq 0 ];
			then
				echo "User Account Expiry Date Set Successfully"
			else
				echo "Unable To Set Expiry Date"
			fi
		else
			echo "User Does Not Exist"
		fi
		;;

	15)
		read -p "Enter The Username : " username

		if id "$username" &>/dev/null
		then
			echo "----- Account Aging Information -----"
			chage -l "$username"
		else
			echo "User Does Not Exist"
		fi
		;;

	16)
		read -p "Enter The Username : " username

		if id "$username" &>/dev/null
		then
			read -p "Are You Sure Delete User With Home Directory (Y/N) : " confirm

			if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ];
			then
				userdel -r "$username"

				if [ "$?" -eq 0 ];
				then
					echo "User And Home Directory Deleted Successfully"
				else
					echo "User Deletion Failed"
				fi
			else
				echo "Delete Operation Cancelled"
			fi
		else
			echo "User Does Not Exist"
		fi
		;;

	17)
		echo "Exiting Program..."
		exit 0
		;;

	*)
		echo "Wrong Choice"
		;;

esac

done
