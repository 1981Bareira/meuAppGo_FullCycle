FROM golang:1.17 AS buildando
WORKDIR /app
ADD . /app
RUN  CGO_ENABLED=0 GOOS=linux go build -o codeeducation
ENTRYPOINT ./meuAppGo

FROM scratch
WORKDIR /app
COPY --from=buildando /app /app
CMD ["./codeeducation"]


