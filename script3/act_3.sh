[root@quickstart /]# cat act_3.sh 
#!/bin/bash
# This script will give size of folder in GB of specified path (here ~/)
# If you need the actual size you can run following command (need to uncomment when run)
#du -csh ~/
du -BG ~/

