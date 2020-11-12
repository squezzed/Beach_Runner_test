TERRAINGENERATOR=/usr/local/bin/terraingenerator.app/Contents/MacOS/terraingenerator
PRIORITIES="Sand Earth_Cracked Soil Rock_White Rock_Gray Rock_Dark Rock_Black Dirt_Tan Dirt_Brown Dirt_Dark Snow_1 Snow_2 Water_Purple Water_Green Water_Deep Water Water_Shallows_Dirt Water_Shallows_Sand Ice Ice_Melting Hole_Black Hole_Brown Hole_Brown Mud_Brown Dirt_Roots Mudstone_Gray Mudstone_Brown Stone_White Stone_Tan Grass_Dark Grass_Light Grass_Dead Grass Gravel_1 Lava"
# PRIORITIES="Ice Ice_Melting Water Water_Shallows_Dirt Water_Shallows_Sand Snow_1 Sand"
INPUT="terrain-v7.tsx"
OUTPUT="terrain-map-v7.tsx"
# /usr/local/bin/terraingenerator.app/Contents/MacOS/terraingenerator --overwrite -o "terrain-map-ice-v4.tsx" -s "terrain-water-v4.tsx" -c Water Ice Snow_1 -p $PRIORITIES
# /usr/local/bin/terraingenerator.app/Contents/MacOS/terraingenerator --overwrite -o "terrain-map-sand-v4.tsx" -s "terrain-water-v4.tsx" -c Water Water_Shallows_Sand Sand -p $PRIORITIES

# Basic
$TERRAINGENERATOR --overwrite -o $OUTPUT -s $INPUT -c Water Grass Grass_Dark Dirt_Tan Dirt_Brown Sand -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Water Grass_Dead Dirt_Tan Dirt_Brown Sand -p $PRIORITIES

# Soil
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Grass Dirt_Tan Soil -p $PRIORITIES

# Dirt and stone
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Grass Grass_Dark Dirt_Tan Stone_Tan Stone_White Dirt_Roots Mud_Brown Mudstone_Brown Mudstone_Gray -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Rock_White Rock_Gray Rock_Dark Dirt_Roots Mud_Brown Mudstone_Brown Mudstone_Gray -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Grass_Dark Dirt_Tan Dirt_Brown Dirt_Dark Dirt_Roots Mud_Brown Gravel_1 -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Dirt_Tan Sand Earth_Cracked Stone_Tan -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Dirt_Tan Dirt_Brown Rock_Gray Rock_Dark Rock_Black -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Hole_Black Water -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Rock_Gray Rock_Dark Rock_Black Gravel_1 Lava -p $PRIORITIES
# $TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Rock_Gray Rock_Dark Rock_Black Hole_Black -p $PRIORITIES

# Holes
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Rock_Gray Hole_Black -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Rock_Dark Hole_Black -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Rock_Black Hole_Black -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Dirt_Tan Hole_Brown -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Dirt_Brown Hole_Brown -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Dirt_Dark Hole_Brown -p $PRIORITIES

# Water
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Water Water_Shallows_Sand Sand -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Water Water_Shallows_Dirt Dirt_Tan Dirt_Brown Grass Grass_Dark -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Water Water_Deep Dirt_Tan Dirt_Brown -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Grass_Dark Dirt_Dark Water_Green -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Grass_Dark Dirt_Dark Water_Purple -p $PRIORITIES


# Snow
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Dirt_Brown Snow_2 Snow_1 Water Ice -p $PRIORITIES
$TERRAINGENERATOR -o $OUTPUT -s $INPUT -c Snow_1 Ice_Melting -p $PRIORITIES


convert terrain-map-v7.png \( terrain-v7.png -gravity SouthWest -crop '512x352-0-0' \) -append terrain-map-v7.png
sed -e '/<\/tileset>/{r terrain-map-extras-v7.xml' -e 'd' -e '}' terrain-map-v7.tsx > terrain-map-v7.tsx.tmp
mv terrain-map-v7.tsx.tmp terrain-map-v7.tsx

