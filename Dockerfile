FROM offers/baseimage-java8:0.0.0

ENV SCALA_VERSION 2.11.8
ENV SCALA_TGZ http://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz
ENV PATH $PATH:/opt/scala-$SCALA_VERSION/bin

RUN curl -sSL $SCALA_TGZ -o scala.tgz \
    && tar -xzf scala.tgz -C /opt/ \
    && rm scala.tgz

ENV SBT_VERSION  0.13.12
ENV SBT_JAR      https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar

ADD  $SBT_JAR  /usr/local/bin/sbt-launch.jar  
COPY sbt.sh    /usr/local/bin/sbt

RUN sbt
