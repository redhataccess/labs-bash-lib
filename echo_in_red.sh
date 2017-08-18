

echo_in_red() {
	local content=$1
	red='\033[0;31m'
	NC='\033[0m' # No Color
	echo -e "${red}${content}${NC}"
}

# Usage:
# echo_in_red "This is important"