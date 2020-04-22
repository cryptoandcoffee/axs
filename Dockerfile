FROM ubuntu:16.04
RUN apt-get update ; apt-get install -yqq build-essential automake git
COPY ./mnsetup.sh .
RUN chmod +x mnsetup.sh ; ./mnsetup.sh
