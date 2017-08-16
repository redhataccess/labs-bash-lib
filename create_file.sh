
create_file(){
    local filename=$1
    if [[ ! -f $filename ]]; then
        touch $filename;
        echo "Touch file $filename"
    else
        echo "File $filename has alreay existed."
    fi
}

# Usage
create_file /tmp/exports
create_file /tmp/nonexist
