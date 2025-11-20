FROM ghcr.io/maplibre/martin

COPY config.yaml /config.yaml
COPY tiles /tiles
COPY sprites /sprites

EXPOSE 3000

CMD ["--config", "/config.yaml"]