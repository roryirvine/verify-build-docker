FROM ubuntu:14.04
RUN locale-gen en_GB.UTF-8
ENV LC_ALL     en_GB.UTF-8
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -q -y -o Dpkg::Options::="--force-confnew"
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --force-yes --no-install-recommends python-software-properties software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y --force-yes --no-install-recommends oracle-java8-installer oracle-java8-set-default
RUN apt-get clean
CMD ["/bin/bash"]
