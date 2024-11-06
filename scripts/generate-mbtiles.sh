#!/bin/bash

# Chemin vers Tippecanoe
PATH_TO_TIPPECANOE="tippecanoe"

# Chemin vers Tile-join
PATH_TO_TILEJOIN="tile-join"

# Dossier contenant les fichiers GeoJSON
DIRECTORY_CONTAINING_GEOJSONS="./geojson"

# Liste des fichiers GeoJSON
LIST_OF_GEOJSON_FILES=($(find "$DIRECTORY_CONTAINING_GEOJSONS" -type f \( -iname "*.json" -o -iname "*.geojson" \)))

# Répertoire de sortie pour les fichiers MBTiles
OUTPUT_DIRECTORY="./tiles"

# Création du répertoire de sortie si nécessaire
mkdir -p "$OUTPUT_DIRECTORY"

# Boucle sur chaque fichier GeoJSON
for GEOJSON_FILE in "${LIST_OF_GEOJSON_FILES[@]}"; do
    # Nom sans extension pour le tileset et le fichier MBTiles
    NAME_WITHOUT_EXTENSION=$(basename "$GEOJSON_FILE" | sed 's/\.[^.]*$//')
    
    # Génération du fichier MBTiles
    echo "Générant $NAME_WITHOUT_EXTENSION.mbtiles..."
    $PATH_TO_TIPPECANOE -zg -o "$OUTPUT_DIRECTORY/$NAME_WITHOUT_EXTENSION.mbtiles" -f -n "$NAME_WITHOUT_EXTENSION" -l "$NAME_WITHOUT_EXTENSION" "$GEOJSON_FILE"
done

# echo "Jointure des tuiles..."
# # Jointure des tuiles
# rm -f "$OUTPUT_DIRECTORY/recomend-map.mbtiles"
# $PATH_TO_TILEJOIN -o "$OUTPUT_DIRECTORY/recomend-map.mbtiles" $(find "$OUTPUT_DIRECTORY" -type f -name "*.mbtiles")

# # Suppression des fichiers temporaires
# rm -f $(find "$OUTPUT_DIRECTORY" -type f -name "*.mbtiles" ! -name "recomend-map.mbtiles")
