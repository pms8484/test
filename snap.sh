#!/bin/bash
filename='bkp_snap_'$(date +"%m-%d-%Y-%T")
filename=`/usr/bin/echo $filename | /usr/bin/sed s/:/_/g;`
echo Backing up at $filename
cd ..
# cfg  BKP cfg files 
#estar/tpe/cfg ; bkp all cfg
find cfg -name "*" -exec tar -uvf BKP/$filename.tar '{}' \;
find estar/tpe/cfg -name "*" -exec tar -uvf BKP/$filename.tar '{}' \;

# logs/starengine ; bkp all logs
# logs/starweb ; bkp all syncsend logs
find logs/starengine -name "*" -exec tar -uvf BKP/$filename.tar '{}' \;
find logs/starweb -name "*syncsend*" -exec tar -uvf BKP/$filename.tar '{}' \;

# lib ; BKP all common libs
cd lib
tar -uvf BKP/$filename.tar "*so*"
tar -uvf BKP/$filename.tar "*dwo*" 
tar -uvf BKP/$filename.tar "*dbg*" 
cd ..

#estar/tpe/servers ; BKP tpe binaries
find estar/tpe/servers/common -name "*" -exec tar -uvf BKP/$filename.tar '{}' \;
find estar/tpe/servers/loadbalsrv -name "*" -exec tar -uvf BKP/$filename.tar '{}' \;
find estar/tpe/servers/msgservice -name "*" -exec tar -uvf BKP/$filename.tar '{}' \;
find estar/tpe/servers/plugins -name "*" -exec tar -uvf BKP/$filename.tar '{}' \;
find estar/tpe/servers/tpeserver -name "*" -exec tar -uvf BKP/$filename.tar '{}' \;

# starengine/commonconf BKP engine configs engines
# starengine/engines BKP engine configs
# starengine/bin BKP engine binaries.
cd starengine/commonconf
tar -uvf BKP/$filename.tar *
cd ../..
cd starengine/bin 
tar -uvf BKP/$filename.tar *
cd ../..
find starengine/engines -name "*" -exec tar -uvf BKP/$filename.tar '{}' \;
cd BKP