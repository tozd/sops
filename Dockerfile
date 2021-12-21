FROM golang:1.20

COPY . /go/src/github.com/tozd/sops
WORKDIR /go/src/github.com/tozd/sops

RUN CGO_ENABLED=1 make install
RUN apt-get update
RUN apt-get install -y vim python3-pip emacs
RUN pip install awscli
ENV EDITOR vim
