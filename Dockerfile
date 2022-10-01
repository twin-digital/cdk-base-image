ARG ALPINE_VERSION=3.16.2
ARG NODE_VERSION=16.17.1

FROM node:${NODE_VERSION}-alpine AS node

FROM alpine:${ALPINE_VERSION}

ENV ALPINE_VERSION=3.16.2
ENV NODE_VERSION=16.17.1

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

COPY container /

WORKDIR /app

ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
CMD [ "--help" ]
