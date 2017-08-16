
backup_file() {
    local filename=$1
    if [[ -f $filename ]]; then
        echo backup $filename to ${filename}.orginal-"$(date +%Y%m%d%H%M%S)"
        cp $filename ${filename}.orginal-"$(date +%Y%m%d%H%M%S)"
    else
        echo $filename does NOT exist
    fi
}

# Usage
# backup_file /tmp/exports
# backup_file /tmp/nonexistfile

