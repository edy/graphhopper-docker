FROM openjdk:8-jdk

WORKDIR /data

RUN mkdir -p /data && \
	mkdir -p /graphhopper && \
	cd /graphhopper && \
	wget https://graphhopper.com/public/releases/graphhopper-web-0.6.0-bin.zip && \
	unzip *.zip && \
	rm *.zip

COPY assets/config.properties /graphhopper/
COPY assets/start.sh /graphhopper/

VOLUME ["/data"]
EXPOSE 8989
