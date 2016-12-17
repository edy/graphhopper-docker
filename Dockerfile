FROM openjdk:8-jdk

WORKDIR /graphhopper

RUN mkdir -p /data \
 && mkdir -p /graphhopper \
 && wget -qO - https://github.com/graphhopper/graphhopper/archive/0.8.2.tar.gz |tar xfz - --strip-components=1 -C /graphhopper \
 && cd /graphhopper \
 && apt-get update \
 && apt-get install -y maven \
 && mvn clean install \
 && apt-get purge -y maven

COPY assets/config.properties /graphhopper/
COPY assets/start.sh /graphhopper/

VOLUME ["/data"]
EXPOSE 8989
