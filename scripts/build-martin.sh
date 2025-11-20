#!/bin/bash

# Construire l'image Docker pour Martin
# docker buildx build \
# 	--platform linux/amd64 \
# 	--push \
# 	-t ghcr.io/lxup/recomend-map-martin:latest martin/.
# docker buildx build --platform linux/amd64 -t ghcr.io/lxup/recomend-map-martin:latest martin/.
# docker build \
# 	--platform linux/amd64 \
# 	--push \
# 	-t ghcr.io/lxup/recomend-map-martin martin/.
docker build -t ghcr.io/lxup/recomend-map-martin:latest martin/.

# Afficher le message de réussite
echo "Image Docker pour Martin construite avec succès."