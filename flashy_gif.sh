#!/usr/bin/bash




while getopts i::c:q: OPT; do
    case $OPT in
	i|+c)
	    # input image
	    image="$OPTARG"
	    ;;
	c|+c)
	    # colorize percentage
	    c_value="$OPTARG"
	    ;;
	q|+q)
	    # quantity of images in GIF
	    q_value="$OPTARG"
	    ;;
	*)
	    echo "usage: ${0##*/} [+-c ARG] [+-q ARG} [--] ARGS..."
	    exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1





# make images

for iteration in {1..25};
do
    rand1="$(shuf -i 1-255 -n 1)";
    rand2="$(shuf -i 1-255 -n 1)";
    rand3="$(shuf -i 0-255 -n 1)";
    convert "$image" -fill "rgb($rand1,$rand2,$rand3)" -colorize "$c_value%" "$RANDOM.png";
done




# compile images into GIF
echo "compiling into gif"
convert -delay 5 -loop 0 *.png "$RANDOM".gif




