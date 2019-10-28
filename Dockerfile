FROM python:3-alpine
MAINTAINER "EEA: IDM2 A-Team" <eea-edw-a-team-alerts@googlegroups.com>


RUN apk add --no-cache --virtual .run-deps git \
 && pip install pylint PyYAML \
 && mkdir -p /code

COPY pylint.cfg /etc/pylint.cfg
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["pylint"]
