FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="keenanflynn.com"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh

ENV LISTEN_PORT=8000
ENV LISTEN_PORT_SSL=443
ENV APP_HOST=app
ENV APP_PORT=9000

USER root

RUN mkdir -p /vol/static && \
    chmod 755 /vol/static && \
    mkdir -p /etc/nginx/ssl && \
    chmod 750 /etc/nginx/ssl && \
    chown nginx:nginx /etc/nginx/ssl && \
    touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

VOLUME /vol/static
VOLUME /etc/nginx/ssl

USER nginx

CMD ["/run.sh"]