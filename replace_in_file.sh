
replaceInFile() {
    local search=$1
    local replace=$2
    local replaceFile=$3
    if [[ $(grep -e "${search}" $replaceFile) == "" ]]; then
      echo 1;
    else
      sed -i "s/${search}/${replace}/g" $replaceFile
      echo 0
    fi
}

# Usage:
# if [[ $(replaceInFile "searchString" "replaceString" /etc/hosts) == 1 ]]; then
#     echo "Do not find searchString in file  /etc/hosts"
# else
#     echo "Replace successfully."
# fi