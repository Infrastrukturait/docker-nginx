FROM nginx:1.23.2-alpine

COPY nginx-auto-reloader.sh /usr/local/bin/nginx-auto-reloader.sh
COPY ./docker-entrypoint.d/ /docker-entrypoint.d/

RUN chmod +x /usr/local/bin/nginx-auto-reloader.sh /docker-entrypoint.d/*.sh \
    && apk --no-cache add inotify-tools

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
