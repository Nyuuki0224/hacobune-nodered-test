# OS指定
FROM ubuntu:20.04

# ラベル付与
LABEL version="0.1.1"
LABEL description="Dockerfileのテスト、Node-REDをVer指定なしでインストールする"

# 各種パッケージインストール(apt-get)
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    tzdata

# Node-REDインストール(NPM)
RUN npm install -g --unsafe-perm node-red

# Node-Red起動
ENTRYPOINT ["node-red", "--", "-u", "root", "-p", "1880"]
