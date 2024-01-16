ARG NODE_VERSION

FROM node:${NODE_VERSION}-alpine

RUN apk update && apk add --no-cache \
    bash \
    nano

RUN npm install -g marked

WORKDIR /data

USER node
