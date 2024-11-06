#!/bin/bash

# Construire l'image Docker pour Nginx
# docker buildx build \
# 	--platform linux/amd64 \
# 	--push \
# 	-t ghcr.io/lxup/recomend-map-nginx:latest nginx/.
# docker buildx build --platform linux/amd64 -t ghcr.io/lxup/recomend-map-nginx:latest nginx/.
# docker build \
# 	--platform linux/amd64 \
# 	--push \
# 	-t ghcr.io/lxup/recomend-map-nginx nginx/.
docker build -t ghcr.io/lxup/recomend-map-nginx nginx/.

# Afficher le message de réussite
echo "Image Docker pour Nginx construite avec succès."