# s2i-golang-runtime
FROM alpine:latest

ENV STI_SCRIPTS_PATH=/usr/libexec/s2i

LABEL io.openshift.s2i.scripts-url=image://${STI_SCRIPTS_PATH}

COPY ./s2i/bin/ $STI_SCRIPTS_PATH

USER 1001

WORKDIR /opt