
package_query() {
    if rpm -q $1 >/dev/null; then
        echo "Package $1 is currently installed, proceeding."
    else
        read -p "Package $1 is not installed, would you like to install it? (y/n) " choice
        while :
        do
            case "$choice" in
                y|Y) yum -y install "$1"; break;;
                n|N) echo "Package $1 required to continue, exiting..."; exit 1;;
                * ) read -p "Please enter 'y' or 'n': " choice;;
            esac
        done
    fi
    if ! rpm -q $1 >/dev/null; then
        echo "Package $1 failed to install, exiting..."; exit 1
    fi
}

# Usage
# package_query nfs4-acl-tools
