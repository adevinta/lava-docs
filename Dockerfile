# Copyright 2024 Adevinta

FROM golang:1.23.0-alpine3.20
RUN apk add bash sed curl jq git
VOLUME /lava-docs/
WORKDIR /lava-docs/
ENTRYPOINT ["/bin/bash"]
