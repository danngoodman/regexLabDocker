#!/bin/bash
add_to_lesson () 
{ 
    ( tail -1 ../checks/checklist | awk 'BEGIN{FPAT="\\[[^]]*\\]"} {print $1}' | awk 'BEGIN{FPAT="[a-zA-Z0-9]+"; ORS=""} {$4++;print "["$1" "$2", "$3" "$4"]"}';
    echo -n " ";
    cat /dev/clipboard | tr -d '\n';
    echo " incomplete" ) >> ../checks/checklist;
    less ../checks/checklist
}
echo "add_to_lesson defined!"
