
# start from CentOS latest image
FROM centos


MAINTAINER Daniel Schulz <danielschulz2005@hotmail.com>


# install libX11 -- iff needed and root allowed
# USER root
# RUN yum install libX11-devel -y



# create technical user instead of root and use it for
# entire base image here and further above in inheritance tree
RUN groupadd techniques && useradd ops -g techniques
USER ops


# mount root volume for software added soon
VOLUME /apps


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
