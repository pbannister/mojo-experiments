
#
# 	Collect VirtualBox guest information for Ubuntu / USB
#

STAMP=`date +%Y.%M.%d-%H.%m.%S`
LOGS=logs
LOG=$LOGS/guest-$STAMP.log

USB_DEVICE="29dd:8001"

test -d $LOGS || mkdir -p $LOGS || {
	echo "Cannot create LOGS directory: $LOGS"
	exit 1
}

echo "LOG: $LOG"

(
	cat << XXXX
=========================================================================
System specific

---- uname -a
`uname -a`

---- id
`id`

---- lsusb -v -d $USB_DEVICE
`lsusb -v -d $USB_DEVICE`

XXXX

) 2>&1 | tee $LOG
