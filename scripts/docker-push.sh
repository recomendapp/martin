#!/bin/bash

# Générer les fichiers MBTiles
./scripts/generate-mbtiles.sh

# Construire l'image Docker pour Martin
./scripts/build-martin.sh

# Construire l'image Docker pour Nginx
./scripts/build-nginx.sh

# Push les images Docker
docker push ghcr.io/lxup/recomend-map-martin:latest
docker push ghcr.io/lxup/recomend-map-nginx:latest

# Afficher le message de réussite
echo "Images Docker poussées avec succès."