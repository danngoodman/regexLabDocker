stty susp undef
trap 'echo -en "\nNice try, enter your name: "' INT HUP QUIT TERM
trap './initial.sh' STOP KILL
while [ ! -f "/etc/student_name" ]
do
  echo -n "Please enter your name: "
  read name
  if [ $(echo -n "${name}" | wc -c) -lt 3 ]
  then
    echo "I know your name is longer than that. Try again."
    continue
  fi
  if [ $(echo -n "${name}" | grep -c '^[a-zA-Z\., ]\+$') -ne 1 ]
  then
    echo "That name looks like jibberish."
    continue
  fi
  echo "${name}" > /etc/student_name
done
stty susp ""
