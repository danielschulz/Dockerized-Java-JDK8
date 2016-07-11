
# start from CentOS latest image

FROM centos


MAINTAINER Daniel Schulz <danielschulz2005@hotmail.com>



# add JDK and maven tar-gz-archives

ADD jdk-8u91-linux-x64.tar.gz /apps/sw/infrastructure/java/jdk8
ADD apache-maven-3.3.9-bin.tar.gz /apps/sw/infrastructure/maven



# set environment variables and add to path

ENV JDK_HOME /apps/sw/infrastructure/java/jdk8/jdk1.8.0_91
ENV JAVA_HOME $JDK_HOME/jre
ENV MVN_HOME /apps/sw/infrastructure/maven/apache-maven-3.3.9



# add important environment variables to path

ENV PATH $JAVA_HOME/bin:$JDK_HOME/bin:$MVN_HOME/bin:$PATH


# default command for entry in this image is `/bin/bash`

CMD ["/bin/bash"]
