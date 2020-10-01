FROM lsiobase/alpine:3.12

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	wget && \
 echo "***** install duplicacy ****" && \
 mkdir -p /app/duplicacy && \
 cd /app/duplicacy && \
 wget --quiet -O duplicacy-web "https://acrosync.com/duplicacy-web/duplicacy_web_linux_x64_1.1.0" && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.cache \
	/tmp/*

# add local files
COPY root/ /

EXPOSE 3875
