FROM nginx:alpine

ENV SERVER_REDIRECT_CODE=302

ADD run.sh /run.sh
ADD default.conf /etc/nginx/conf.d/default.conf

RUN chmod +x /run.sh

HEALTHCHECK --interval=10s --timeout=3s --start-period=3s --retries=3 \
    CMD curl -o /dev/null -s -w "%{http_code}\n" http://127.0.0.1:80 | grep -q "$SERVER_REDIRECT_CODE" || exit 1

CMD ["/run.sh"]
