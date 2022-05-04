FROM caddy

COPY ./website /usr/src/pages
COPY ./config/Caddyfile /etc/caddy/Caddyfile

EXPOSE 80
CMD [ "caddy", "run", "-config", "/etc/caddy/Caddyfile" ]
