FROM ubuntu:19.10
CMD git clone "https://github.com/danngoodman/regexLabDocker"
CMD mv regexLabDocker/lab* . 
CMD mv regexLabDocker/checks/ /bin
CMD mv regexLabDocker/initial.sh /bin/initial
cmd rm regexLabDocker/dockerfile regexLabDocker/alias.sh
