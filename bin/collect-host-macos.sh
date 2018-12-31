
STAMP=`date +%Y.%m.%d-%H.%M.%S`
LOGS=logs
LOG=$LOGS/host-$STAMP.log

VM_NAME="FPGA development"

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

---- ioreg (MacOS)
`ioreg -p IOUSB -n "Mojo V3@00300000"`

XXXX

	cat << XXXX
=========================================================================
VBoxManage -- host specific

---- version
`VBoxManage -version`

---- extpacks
`VBoxManage list extpacks`

---- usbhost
`VBoxManage list usbhost`

---- usbfilters
`VBoxManage list usbfilters`

---- vms
`VBoxManage list vms`

---- showvminfo
`VBoxManage showvminfo "$VM_NAME"`

XXXX


	cat << XXXX
=========================================================================
Capture the latest log from the VM.

XXXX

	VBoxManage showvminfo "$VM_NAME" --log 0


	cat << XXXX
=========================================================================
XXXX

) 2>&1 | tee $LOG

