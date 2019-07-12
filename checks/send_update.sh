#!/bin/bash

check_dir="${PREPREFIX}/home/DG044579/regexLabDocker/checks"
for i in {0..3}
do
  result=$(curl W1562311:8080/submit -H "Content-Type: application/json" -d "{\"student\":\"$(cat /etc/student_name | tr -d '\n')\",\"checklist\":\"$(base64 "${check_dir}/checklist" | tr -d '\n')\",\"command_history\":\"$(base64 "${check_dir}/command_history" | tr -d '\n')\"}" -s 2> /dev/null)
  if [[ "${result}" == *"success"* ]]
  then
    break
  fi
done
