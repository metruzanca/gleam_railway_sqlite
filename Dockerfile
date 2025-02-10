FROM ghcr.io/gleam-lang/gleam:v1.8.0-erlang-alpine

COPY . /build/

RUN cd /build \
    && gleam export erlang-shipment \
    && mv build/erlang-shipment /app \
    && rm -rf /build

WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["run"]