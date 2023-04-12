FROM alpine:3

RUN apk --update --no-cache add bash netcat-openbsd \
    && addgroup http-echo \
    && adduser -S -G http-echo 1005

USER 1005
EXPOSE 8080

ENTRYPOINT ["bash"]
CMD ["-c", "trap exit INT TERM; while true; do echo -e \"HTTP/1.1 200 OK\n\n${MESSAGE:-ok}\" | nc -lN ${PORT:-8080}; done"]
