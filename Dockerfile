# Copyright 2024 Adevinta

FROM golang:1.23.0-alpine3.20

RUN mkdir -p /lava-docs /lava /go-cache /go-mod-cache
RUN chmod 777 /go-cache /go-mod-cache

VOLUME /lava-docs /lava /go-cache /go-mod-cache

RUN apk add bash sed curl jq git

WORKDIR /lava-docs/
ENTRYPOINT ["/bin/bash"]
