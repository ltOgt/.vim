#!/bin/bash

# variables
f_v=0

# functions
function print_usage ()
{
	echo 'USAGE:'
	echo ""
}


# check parameters
while [[ $# -gt 0 ]]; do
	case "$1" in
		-p | --placeholder)
			# shift if not last parameter
			if [[ $# -eq 1 ]]; then
				echo "$1 requires a specification. Try --help."
				exit 1
			fi
			shift

			# shifted -> new $1; should be a number
			entry=$1
			numrgx="^[0-9]+$"
			if ! [[ $entry =~ $numrgx ]]; then
				echo "Entry option requires a number. Try --help."
				exit 1
			fi
			if [[ $entry -gt $steps ]]; then
				echo "Only $steps steps available. Entry option: $entry"
				exit 1
			fi
			echo "< trying to start at step $1"
			;;
		-v | --verbose)
			echo "< running verbose"
			f_v=1
			;;
		-h | --help)
			print_usage
			exit 0
			;;
		*)
			echo "<$1> not an option. Try --help."
			;;
	esac
	# shift out parsed option
	shift
done

# script
# TODO

echo "done"
exit 0

