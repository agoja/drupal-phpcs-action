FROM skilldlabs/docker-phpcs-drupal

RUN apk add --no-cache git

COPY entrypoint.sh \
     problem-matcher.json \
     /action/

RUN chmod +x /action/entrypoint.sh

ENTRYPOINT ["/action/entrypoint.sh"]
