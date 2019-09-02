FROM node:10-alpine

RUN apk --update add git openssh && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/apk/*

WORKDIR /opt
ENV PATH="/opt/node_modules/.bin:${PATH}"

COPY package*.json ./
RUN npm ci \ 
  && npm cache clean --force

CMD ["semantic-release", "--plugins", "@semantic-release/commit-analyzer", "@semantic-release/release-notes-generator", "@semantic-release/github", "@semantic-release/git"]