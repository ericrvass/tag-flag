payloadFound="false"
value=""
for var in "$@"
do
  if [ $payloadFound = "true" ]
  then
    #echo "readfile"
    value=$(cat $var)
    payloadFound="false"
  fi

  if [ $var = "-payload" ]
  then
    #echo "found"
    payloadFound="true"
  fi
done
phantomjs-1.6.1-linux-x86_64-dynamic/bin/phantomjs hastags.js $value