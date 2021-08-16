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

# Node-Red自動起動設定
RUN npm install -g pm2
RUN pm2 start node-red -- -u root
RUN pm2 save
RUN pm2 startup systemd -u root
