HOST="its.snc.edu"
count=$(ping -c 4 $HOST | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
if [ $count -eq 0 ]; then
   # 100% failed
   reboot
fi
