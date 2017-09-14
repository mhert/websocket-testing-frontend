FROM nginx:1.13.5-alpine

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

ENV BACKEND_URL ""

RUN apk add --no-cache \
    tini

COPY src/ /usr/share/nginx/html

COPY bin/ /usr/local/bin/
COPY docker-entrypoint.d/ /etc/docker-entrypoint.d/
