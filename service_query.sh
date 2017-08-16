
service_query() {
    read -p "$1 daemon required to continue, Would you like to start it? (y/n) " choice
    while :
    do
        case "$choice" in
            y|Y ) systemctl start $1; systemctl enable $1; break;;
            n|N ) echo "ERROR: $1 daemon not started. Exiting..."; exit 1;;
            * ) read -p "Please enter 'y' or 'n': " choice;;
    esac
    done
}

# Usage
# service_query nfs-server