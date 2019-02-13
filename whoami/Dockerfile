FROM golang:alpine3.6 AS binary
ADD . /app
WORKDIR /app
RUN go build -o http

FROM alpine:3.6
WORKDIR /app
ENV PORT 80
EXPOSE 80
COPY --from=binary /app/http /app
CMD ["/app/http"]