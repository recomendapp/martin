#!/bin/bash

# Chemin vers Tippecanoe
PATH_TO_TIPPECANOE="tippecanoe"

# Dossier contenant les fichiers GeoJSON
DIRECTORY_CONTAINING_GEOJSONS="./geojson"

# Liste des fichiers GeoJSON
LIST_OF_GEOJSON_FILES=($(find "$DIRECTORY_CONTAINING_GEOJSONS" -type f \( -iname "*.json" -o -iname "*.geojson" \)))

# Répertoire de sortie pour le fichier MBTiles combiné
OUTPUT_DIRECTORY="./tiles"

# Création du répertoire de sortie si nécessaire
mkdir -p "$OUTPUT_DIRECTORY"

# Nom du fichier de sortie MBTiles combiné
OUTPUT_FILE="$OUTPUT_DIRECTORY/paradise_pictures.mbtiles"

# Construction de la commande Tippecanoe pour chaque fichier GeoJSON
TIPPECANOE_COMMAND=("$PATH_TO_TIPPECANOE" -zg -o "$OUTPUT_FILE" -f)
for GEOJSON_FILE in "${LIST_OF_GEOJSON_FILES[@]}"; do
    LAYER_NAME=$(basename "$GEOJSON_FILE" | sed 's/\.[^.]*$//')
    TIPPECANOE_COMMAND+=(-L "$LAYER_NAME:$GEOJSON_FILE")
done

# Exécution de la commande
echo "Génération du fichier MBTiles combiné avec plusieurs couches..."
"${TIPPECANOE_COMMAND[@]}"