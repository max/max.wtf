FROM alpine

RUN apk --update add \
  git \
  git-subtree \
  openssh \
  && rm -rf /var/lib/apt/lists/* \
  && rm /var/cache/apk/*

VOLUME /git
WORKDIR /git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
