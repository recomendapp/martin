# Utiliser l'image de base maplibre/martin
FROM ghcr.io/maplibre/martin

# Copier les fichiers de configuration personnalisés dans l'image
COPY config.yaml /config/config.yaml

# Copier les dossier de tuiles dans l'image
COPY tiles /config/tiles

# Copier les dossier de sprites dans l'image
COPY sprites /config/sprites

# Exposer le port 3000 si nécessaire
EXPOSE 3000

# Commande à exécuter lors du démarrage du conteneur
CMD ["--config", "/config/config.yaml"]