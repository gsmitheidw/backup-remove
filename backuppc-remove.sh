#!/bin/bash
# Remove Data from backups in BackupPC 3.x (might work with 4.x?) for a variety
# of purposes such as right to be forgotten under EU GDPR.
#
# Requirements: 
# 1. Binaries: /usr/bin/pigz, /usr/bin/unpigz, /usr/bin/rename
# 2. Set Constants to match your data and paths
# 
# Note: Run at your own risk
#
# Graham Smith (gsmitheidw), November 2018.
#
#


# Constants
userdata='username'
pcpath='/var/lib/backuppc/pc/pc-name'
datadir='fdDrive/fHomeDir'

cd $pcpath


# Delete from Backups:

# For all backup folders
for backupdirs in */; do
        rm  -rf $pcpath/$backupdirs/$datadir/$userdata
done


# Delete from Logs:

for filename in XferLOG.*.z; do
	unpigz $filename
done

	# Remove lines mentioning criteria, case insensitive, inline
	echo "Removing lines matching criteria"
	sed -i '/f$studentnum/dI' XferLOG.*
	# Re-compress logs
	echo "Re-compressing logs.."
	pigz -n -z `ls XferLOG.*`
	# restore the original file extension:
	rename 's/\.zz$/\.z/' XferLOG.*

echo "Operation complete!"

