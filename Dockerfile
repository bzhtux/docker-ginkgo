FROM golang:alpine
LABEL maintainer="Yannick Foeillet <yfoeillet@vmware.com>"

ARG GOOS=linux
ARG GOARCH=amd64
ARG GOPATH=$HOME/go

RUN apk add git make
RUN adduser -s /bin/sh -u 10000 -D app --home /go
RUN mkdir /.cache
RUN mkdir /.config
RUN mkdir -p /go/src
RUN chown -R 1000:1000 /.cache
RUN chown -R 1000:1000 /.config
RUN chown -R 1000:1000 /go
USER 1000
WORKDIR /go/src
RUN go install github.com/onsi/ginkgo/v2/ginkgo@v2.15.0

ENTRYPOINT ginkgo

