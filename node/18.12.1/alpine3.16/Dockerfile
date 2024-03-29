FROM alpine:3.16

ENV NODE_VERSION 18.12.1

RUN addgroup -g 1000 node \
  && adduser -u 1000 -G node -s /bin/sh -D node \
  && apk add --no-cache \
  libstdc++ \
  && apk add --no-cache --virtual .build-deps \
  curl \
  && ARCH= && alpineArch="$(apk --print-arch)" \
  && case "${alpineArch##*-}" in \
  x86_64) \
  ARCH='x64' \
  CHECKSUM="b94b70fbd8d85e5874cc42dc12a02a1e6b4624d0d4a9bf62a88d122ac3f61bbe" \
  ;; \
  *) ;; \
  esac \
  && if [ -n "${CHECKSUM}" ]; then \
  set -eu; \
  curl -fsSLO --compressed "https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz"; \
  echo "$CHECKSUM  node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz" | sha256sum -c - \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs; \
  else \
  echo "Building from source" \
  # backup build
  && apk add --no-cache --virtual .build-deps-full \
  binutils-gold \
  g++ \
  gcc \
  gnupg \
  libgcc \
  linux-headers \
  make \
  python3 \
  # gpg keys listed at https://github.com/nodejs/node#release-keys
  && for key in \
  4ED778F539E3634C779C87C6D7062848A1AB005C \
  141F07595B7B3FFE74309A937405533BE57C7D57 \
  74F12602B6F1C4E913FAA37AD3A89613643B6201 \
  61FC681DFB92A079F1685E77973F295594EC4689 \
  8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
  C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
  890C08DB8579162FEE0DF9DB8BEAB4DFCF555EF4 \
  C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C \
  108F52B48DB57BB0CC439B2997B01419BD92F80A \
  ; do \
  gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys "$key" || \
  gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key" ; \
  done \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz" \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
  && tar -xf "node-v$NODE_VERSION.tar.xz" \
  && cd "node-v$NODE_VERSION" \
  && ./configure \
  && make -j$(getconf _NPROCESSORS_ONLN) V= \
  && make install \
  && apk del .build-deps-full \
  && cd .. \
  && rm -Rf "node-v$NODE_VERSION" \
  && rm "node-v$NODE_VERSION.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt; \
  fi \
  && rm -f "node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz" \
  && apk del .build-deps \
  # smoke tests
  && node --version \
  && npm --version

ENV YARN_VERSION 1.22.19

RUN apk add --no-cache --virtual .build-deps-yarn curl gnupg tar \
  && for key in \
  6A010C5166006599AA17F08146C2130DFD2497F5 \
  ; do \
  gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys "$key" || \
  gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key" ; \
  done \
  && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz.asc" \
  && gpg --batch --verify yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
  && mkdir -p /opt \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
  && apk add git python3 make g++ \
  && apk del .build-deps-yarn \
  # smoke test
  && yarn --version

# yarn 设置国内源
RUN yarn config set registry https://registry.npmmirror.com/ --global  && \
  yarn config set disturl https://npmmirror.com/package/dist --global && \
  yarn config set sass_binary_site https://cdn.npmmirror.com/binaries/node-sass --global  && \
  yarn config set electron_mirror https://registry.npmmirror.com/binary.html?path=electron/ --global  && \
  yarn config set puppeteer_download_host https://registry.npmmirror.com/binary.html --global  && \
  yarn config set chromedriver_cdnurl https://cdn.npmmirror.com/binaries/chromedriver --global  && \
  yarn config set operadriver_cdnurl https://cdn.npmmirror.com/binaries/operadriver --global  && \
  yarn config set phantomjs_cdnurl https://cdn.npmmirror.com/binaries/phantomjs --global  && \
  yarn config set selenium_cdnurl https://cdn.npmmirror.com/binaries/selenium --global  && \
  yarn config set node_inspector_cdnurl https://cdn.npmmirror.com/binaries/node-inspector --global

# npm 设置国内源
RUN npm set registry https://registry.npmmirror.com/ && \
  npm set disturl https://npmmirror.com/package/dist && \
  npm set sass_binary_site https://cdn.npmmirror.com/binaries/node-sass && \
  npm set electron_mirror https://registry.npmmirror.com/binary.html?path=electron/ && \
  npm set puppeteer_download_host https://registry.npmmirror.com/binary.html && \
  npm set chromedriver_cdnurl https://cdn.npmmirror.com/binaries/chromedriver && \
  npm set operadriver_cdnurl https://cdn.npmmirror.com/binaries/operadriver && \
  npm set phantomjs_cdnurl https://cdn.npmmirror.com/binaries/phantomjs && \
  npm set selenium_cdnurl https://cdn.npmmirror.com/binaries/selenium && \
  npm set node_inspector_cdnurl https://cdn.npmmirror.com/binaries/node-inspector && \
  npm cache clean --force
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

RUN npm install -g node-gyp

RUN apk add git