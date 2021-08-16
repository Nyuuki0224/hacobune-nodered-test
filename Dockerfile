# OS指定～パッケージリストアップデート

FROM ubuntu:20.04

LABEL version="0.1.0"
LABEL description="Dockerfileのテスト、Node-REDをVer指定なしでインストールする"

RUN apt-get update
RUN apt-get install -y tzdata

# Node.js,NPM,Node-REDインストール

RUN apt-get install -y nodejs npm
RUN node -v
RUN npm -v
RUN npm install -g --unsafe-perm node-red

# Node-Red起動
RUN node-red -- -u root -p 1880
