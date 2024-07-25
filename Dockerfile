FROM ghcr.io/linuxserver/baseimage-alpine:3.20

ARG INPX_RELEASE

RUN \
  echo "**** install runtime dependencies ****" && \
  apk add --no-cache libgcc libstdc++ gcompat unzip && \
  echo "**** install inpx-web ****" && \
  if [ -z ${INPX_RELEASE+x} ]; then \
    INPX_RELEASE=$(curl -sX GET https://api.github.com/repos/bookpauk/inpx-web/releases/latest \
      | awk '/tag_name/{print $4;exit}' FS='[""]'); \
  fi && \
  mkdir -p /app/ && \
  echo "**** Downloading version ${INPX_RELEASE} ****" && \
  curl -o \
    /tmp/inpx-web.zip -L \
    "https://github.com/bookpauk/inpx-web/releases/download/${INPX_RELEASE}/inpx-web-${INPX_RELEASE}-linux.zip" && \
  unzip /tmp/inpx-web.zip -d /app && \
  echo "**** clean up ****" && \
  rm -rf \
    /config/* \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 12380

VOLUME /library
VOLUME /data
VOLUME /catalog.inpx
