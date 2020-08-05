FROM alpine:latest
COPY scripts/docker-entrypoint.sh /
RUN set -xe && apk add --no-cache squid && chmod +x /docker-entrypoint.sh
COPY config/squid.conf /etc/squid/squid.conf
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD [""]
