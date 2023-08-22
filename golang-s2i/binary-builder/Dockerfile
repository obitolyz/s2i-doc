FROM alpine:latest

ENV \
    # Path to be used in other layers to place s2i scripts into
    STI_SCRIPTS_PATH=/usr/libexec/s2i \
    APP_ROOT=/opt/app-root \
    # The $HOME is not set by default, but some applications needs this variable
    HOME=/opt/app-root \
    PATH=$HOME/bin:$PATH

LABEL maintainer kubesphere@yunify.com

LABEL io.k8s.description="Binary File Exec" \
      io.k8s.display-name="Binary" \
      io.kubesphere.tags="builder,binary" \
      io.openshift.s2i.scripts-url=image://$STI_SCRIPTS_PATH

RUN mkdir -p $STI_SCRIPTS_PATH $APP_ROOT/bin

WORKDIR ${HOME}

# RUN useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin \
#       -c "Default Application User" default && \
#   chown -R 1001:0 ${APP_ROOT}

RUN chown -R 1001:0 ${APP_ROOT}

COPY ./s2i/bin $STI_SCRIPTS_PATH

USER 1001