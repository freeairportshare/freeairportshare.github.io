FROM node:23.5.0-alpine3.21

LABEL maintainer="freeairportshare@gmail.com"
LABEL version="freeairportshare:v1"
LABEL description="Docker image for freeairportshare"

WORKDIR /workspace
COPY package.json package-lock.json yarn.lock /workspace/

RUN npm install hexo-cli -g && \
    npm ci

COPY . /workspace

RUN  npm run clean && npm run build

CMD [ "npm", "run", "server"]
# docker build -t freeairportshare .
# docker compose up -d