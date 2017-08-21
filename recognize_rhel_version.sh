recognize_rhel_version(){
	local rhel_version=`cat /etc/redhat-release`
	local rhel_regex='Red Hat Enterprise Linux Server release ([0-9])\.([0-9]) .*'
	local major_version
	local minor_version
	[[ $rhel_version =~ $rhel_regex ]] \
        &&  major_version=${BASH_REMATCH[1]} && minor_version=${BASH_REMATCH[2]} && echo "${major_version}-${minor_version}"\
        || echo "The current operating system is not Red Hat Enterprise Linux"

}

recognize_rhel_version

# for a in 'Apprentice Historian (Level 1)' 'Historian (Level 4)' 'Master Historian (Level 7)' ; do
#     set "$a"
#     echo " === $1 ==="
#     [[ $1 =~ (Apprentice|Master)?' '?(.*)' ('Level' '[0-9]+')' ]] \
#         && echo ${BASH_REMATCH[${#BASH_REMATCH[@]}-1]}
# done 

