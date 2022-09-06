### Build
FROM node:16-alpine as build

WORKDIR /app

# build dependencies for bigint-buffer
RUN apk update --no-cache && \
    apk add alpine-sdk python3

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

### Final image
FROM node:16-alpine as deploy

ENV USER=app
ENV GROUP=app
ENV UID=10001
ENV GID=20001

RUN apk update --no-cache && \
    apk add dumb-init && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules

RUN addgroup -g $GID -S $GROUP && \
    adduser -u $UID -S $USER -G $GROUP

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["node", "dist/main"]
