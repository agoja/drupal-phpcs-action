FROM skilldlabs/docker-phpcs-drupal

COPY entrypoint.sh \
     problem-matcher.json \
     /action/

RUN chmod +x entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
