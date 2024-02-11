FROM golang:1-alpine

COPY . /go/src/github.com/amdonov/lite-idp
WORKDIR /go/src/github.com/amdonov/lite-idp
RUN go build .

FROM alpine

COPY --from=0 /go/src/github.com/amdonov/lite-idp/lite-idp /usr/bin/lite-idp

# Copy certs and config file.
COPY config.yaml /etc/lite-idp/
COPY certs/ /etc/lite-idp/certs/

ENTRYPOINT ["lite-idp"]
CMD ["serve"]
