
#!/bin/bash

while true
do
    echo "=========================="
    echo "     SYSTEM MENU"
    echo "=========================="
    echo "1. System Details"
    echo "2. Check Disk Space"
    echo "3. Check RAM Usage"
    echo "4. Current Users"
    echo "5. Active Processes"
    echo "6. Open Ports"
    echo "7. Failed Services"
    echo "8. Current Date & Time"
    echo "9. Exit"
    echo "=========================="

    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "System Details:"
            uname -a
            ;;
        2)
            echo "Disk Space:"
            df -h
            ;;
        3)
            echo "RAM Usage:"
            free -h
            ;;
        4)
            echo "Logged-in Users:"
            who
            ;;
        5)
            echo "Active Processes:"
            ps aux
            ;;
        6)
            echo "Open Ports:"
            if command -v ss >/dev/null 2>&1
            then
                ss -lntup
            elif command -v netstat >/dev/null 2>&1
            then
                netstat -lntup
            else
                echo "No port checking command found"
            fi
            ;;
        7)
            echo "Failed Services:"
            if command -v systemctl >/dev/null 2>&1
            then
                systemctl --failed
            else
                echo "Systemctl is unavailable"
            fi
            ;;
        8)
            echo "Date and Time:"
            date
            ;;
        9)
            echo "Program terminated. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice! Select between 1 and 9."
            ;;
    esac

    read -p "Press Enter to continue..."
done
