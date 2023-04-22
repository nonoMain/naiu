bash_lib_define_colors ()
{
	if [[ -z ${NO_COLOR+x} ]]; then
		RED='\033[0;31m'
		GREEN='\033[0;32m'
		YELLOW='\033[0;33m'
		BLUE='\033[0;34m'
		PURPLE='\033[0;35m'
		CYAN='\033[0;36m'
		WHITE='\033[0;37m'
		NC='\033[0m' # No Color
	else
		RED=''
		GREEN=''
		YELLOW=''
		BLUE=''
		PURPLE=''
		CYAN=''
		WHITE=''
		NC=''
	fi
	MSG_COLOR=$CYAN
	OK_COLOR=$GREEN
	ERROR_COLOR=$RED
	WARNING_COLOR=$YELLOW
}
bash_lib_define_colors
SKIP_FAILED_ITERATION=false

## Massages

# @brief echo the given text as a message
# @param $1 the text to echo
echo_msg ()
{
	echo -e "[ ${MSG_COLOR}MSG${NC} ] $1"
}

# @brief echo the given text as an ok message
# @param $1 the text to echo
echo_ok_msg ()
{
	echo -e "[ ${OK_COLOR}OK${NC} ] $1"
}

# @brief echo the given text as a warning message
# @param $1 the text to echo
echo_warning_msg ()
{
	echo -e "[ ${WARNING_COLOR}WAR${NC} ] $1"
}

# @brief echo the given text as an error message
# @param $1 the text to echo
echo_error_msg ()
{
	echo -e "[ ${ERROR_COLOR}ERR${NC} ] $1"
}

# @brief waits until any key is pressed
# @param $1 the text to echo (optional)
wait_for_any_key_press ()
{
	read -n 1 -s -r -p "$1"
	echo
}

local_skip_failed_flag ()
{
	SKIP_FAILED_ITERATION=true
}

handle_failed_iteration ()
{
	if $SKIP_FAILED_ITERATION; then
		echo_warning_msg "$1" # always returns true
	else
		false
	fi

}

perform_command_with_single_line_arg_on_file ()
{
	local cmd=$1; shift
	local action=$1; shift
	local file=$1; shift
	local title=""
	while read -r line; do
		if [[ "$line" =~ ^#.* ]]; then
			title="$line"
		elif [[ "$line" =~ ^$ ]]; then
			continue
		else
			printf "[ ${MSG_COLOR}MSG${NC} ] ${action} F:%-30s %-25s P:%-25s\n" "$(basename $file)" "$title" "$line"
			$cmd "$line"
		fi
	done < "$file"
}
