# backup-remove
Remove data from backups in BackupPC and it's logs

## Introduction:
I backup userdata with [BackupPC](https://backuppc.github.io/backuppc/) and under GDPR we had a request for deletion under EU "Right to be forgotten".

There doesn't seem to be any obvious method for doing this in BackupPC and as future requests are expected, it makes sense to automate the process. 

## Requirements and usage:

1. Binaries: pigz, unpigz, rename
2. Set Constants in the script to match your data and paths

## Notes:
* There is no error checking at present
* Tested with BackupPC 3.x on Debian Stretch
* Binaries listed in Requrements were obtained from official Debian repository sources. 
* Some of the switches for sed/rename may differ on other Linux/Unix. In particlar *BSD and OSX are not GNU sed by default
* The reason for pigz is because the logs are compressed in Zlib in Perl by BackupPC. This is different compression to gzip.

## Todo:
* Some basic error checking on paths, binaries
* Utilise more CPU cores using GNU parallel, pigz will by default but sed will not.
* Give options to remove mention of text rather than full line removal from logs. 
