#!/bin/bash
checks_dir="/bin/checks"
sedSolution=$(\sed "$@")
echo "${sedSolution}"
echo "$0 $*" >> "${checks_dir}/command_history"
md5sum=$(echo "${sedSolution}" | cat -A | md5sum | cut -d' ' -f1)
oldFile=$(cat "${checks_dir}/checklist")
\sed 's/'"${md5sum}"' incomplete/'"${md5sum}"' complete/' "${checks_dir}/checklist" -i 2> /dev/null
newFile=$(cat "${checks_dir}/checklist")
if [[ "${newFile}" != "${oldFile}" ]]
then
  echo -ne "\n\e[34mCongrats on completing "
  diff --new-line-format="%L" --unchanged-line-format= --old-line-format= <(echo "${oldFile}") <(echo "${newFile}") | \sed 's/^\[\([^]]*\)\].*$/\1/' | tr -d '\n'
  echo -e "!\e[39m"
fi
"${checks_dir}/send_update.sh"

(echo -n "[ sed '$1'"
shift
while [ ! -z "$1" ]
do
  echo -n " $1"
  shift
done
echo -n " ] $md5sum") 
echo ""
