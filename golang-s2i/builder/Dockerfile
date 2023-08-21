# golang-builder
FROM golang:1.18.10
LABEL maintainer "Chris Collins <collins.christopher@gmail.com>"

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOCACHE=/tmp \
    STI_SCRIPTS_PATH=/usr/libexec/s2i \
    SOURCE_DIR=/go/src/app \
    APP_ROOT=/opt/app-root

LABEL io.k8s.description="Builder image for compiling and testing Go applications" \
      io.k8s.display-name="golang-builder" \
      io.openshift.s2i.scripts-url=image://${STI_SCRIPTS_PATH}
      
# Copy the s2i scripts into the golang image
# These scripts describe how to build & run the application, and extract artifacts 
# for downstream builds
COPY ./s2i/bin/ $STI_SCRIPTS_PATH

# The $SOURCE_DIR is dependent on the upstream golang image, based on the 
# $GOPATH, etc. variable set there
#
# Allow random UIDs to write to the $SOURCE_DIR (for OKD/OpenShift)
RUN mkdir -p $SOURCE_DIR \
      && chmod 755 $SOURCE_DIR \
      && mkdir -p $APP_ROOT \
      && chmod 755 $APP_ROOT \
      && chown -R 1001:0 $SOURCE_DIR \
      && chown -R 1001:0 $APP_ROOT \
      && chmod -R 755 $STI_SCRIPTS_PATH \
      && chown -R 1001:0 $STI_SCRIPTS_PATH

WORKDIR $SOURCE_DIR

# Drop root (as is tradition)
USER 1001


CMD ["/usr/libexec/s2i/usage"]
