FROM ubuntu:19.10
RUN mkdir /home/regex_labs
WORKDIR /home/regex_labs
RUN apt-get update
RUN apt-get install -y git
RUN git clone "https://github.com/danngoodman/regexLabDocker"
RUN mv regexLabDocker/lab* . 
RUN mv regexLabDocker/checks/ /bin
RUN mv regexLabDocker/initial.sh /bin/initial
RUN cat regexLabDocker/alias.sh >> ~/.bashrc
RUN echo "/bin/initial" >> ~/.bashrc
RUN rm -rf regexLabDocker
