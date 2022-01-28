FROM alpine:latest

ENV MKDOCS_VERSION=1.2.3 \
    PYTHONUNBUFFERED=1


RUN apk add --update \
    ca-certificates \
    python3 \
    python3-dev \
    py3-pip \
    build-base && \
    pip install --upgrade pip && \
    pip install mkdocs==${MKDOCS_VERSION} \
    mkdocs-material \
    mkdocs-minify-plugin \
    mkdocs-redirects \
    mkdocs-enumerate-headings-plugin && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

COPY rootfs /

CMD [ "mkdocs", "serve", "--dev-addr", "0.0.0.0:8000" ]
