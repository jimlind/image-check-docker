#!/bin/sh
cd c && ./run-setup.sh
cd ../cplusplus && ./run-setup.sh
cd ../nodejs && ./run-setup.sh
cd ../php && ./run-setup.sh
cd ../python && ./run-setup.sh
cd ../python3 && ./run-setup.sh
cd ../rust && ./run-setup.sh

cd ../c && ctime="$(time ( ./run-command.sh ) 2>&1 1>/dev/null )"
echo "C timer: $ctime"

cd ../cplusplus && cplusplustime="$(time ( ./run-command.sh ) 2>&1 1>/dev/null )"
echo "C++ timer: $cplusplustime"

cd ../nodejs && nodejstime="$(time ( ./run-command.sh ) 2>&1 1>/dev/null )"
echo "Node.js timer: $nodejstime"

cd ../php && phptime="$(time ( ./run-command.sh ) 2>&1 1>/dev/null )"
echo "PHP timer: $phptime"

cd ../python && pythontime="$(time ( ./run-command.sh ) 2>&1 1>/dev/null )"
echo "Python timer: $pythontime"

cd ../python3 && python3time="$(time ( ./run-command.sh ) 2>&1 1>/dev/null )"
echo "Python3 timer: $python3time"

cd ../rust && rusttime="$(time ( ./run-command.sh ) 2>&1 1>/dev/null )"
echo "Rust timer: $rusttime"