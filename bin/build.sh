#!/bin/bash

clear
echo "======================================"
echo "     EuclidOS JSON Generator"
echo "======================================"

validate_codename() {
    [[ "$1" =~ ^[a-zA-Z0-9]+$ ]]
}

validate_vendor() {
    [[ "$1" =~ ^[A-Z][a-zA-Z0-9]*$ ]]
}

while true; do
    read -p "• Enter your codename: " CODENAME
    if validate_codename "$CODENAME"; then break
    else echo "Codename must contain letters and numbers only"; fi
done

while true; do
    read -p "• Enter your vendor name: " VENDOR
    if validate_vendor "$VENDOR"; then break
    else echo "First letter must be capital and single word"; fi
done

read -p "• Enter your device Model: " MODEL
ACTIVE=true

while true; do
    read -p "• Do you maintain this device alone? (yes/no): " SINGLE
    SINGLE=$(echo "$SINGLE" | tr '[:upper:]' '[:lower:]')
    if [[ "$SINGLE" == "yes" || "$SINGLE" == "no" ]]; then break
    else echo "Please type yes or no"; fi
done

if [[ "$SINGLE" == "yes" ]]; then
    read -p "• Enter your telegram username (without @): " TG_USER
    TG_JSON="\"$TG_USER\""
else
    while true; do
        read -p "• How many maintainers?: " NUM
        if [[ "$NUM" =~ ^[0-9]+$ && "$NUM" -ge 2 ]]; then break
        else echo "Enter a valid number >=2"; fi
    done
    TG_JSON="["
    for ((i=1;i<=NUM;i++)); do
        read -p "• Enter username $i: " USER
        TG_JSON="$TG_JSON\"$USER\""
        if [[ $i -lt $NUM ]]; then TG_JSON="$TG_JSON, "; fi
    done
    TG_JSON="$TG_JSON]"
fi

read -p "• Telegram group (full link or username): " TG_GROUP
if [[ "$TG_GROUP" != https://* ]]; then
    TG_GROUP="https://t.me/$TG_GROUP"
fi

STEP1_JSON=$(cat <<EOF
{
    "codename": "$CODENAME",
    "vendor": "$VENDOR",
    "model": "$MODEL",
    "active": $ACTIVE
}
EOF
)

STEP2_JSON=$(cat <<EOF
{
  "data": [
    {
      "codename": "$CODENAME",
      "vendor": "$VENDOR",
      "model": "$MODEL",
      "tg_uname": $TG_JSON,
      "support_group": "$TG_GROUP"
    }
  ]
}
EOF
)

echo "Generating your json file in"
sleep 1
echo "3."
sleep 1
echo "2.."
sleep 1
echo "1..."
sleep 1
clear

echo "--- Step 1. Insert the object from temp/device_list.json into the devices[] array in sources/device_list.json ---"
echo "$STEP1_JSON"
echo
echo "--- Step 2. Move your $CODENAME.json from bin/temp/ to sources/devices/ ---"
echo "$STEP2_JSON"
echo

TEMP_DIR="temp"
mkdir -p "$TEMP_DIR"

echo "$STEP1_JSON" > "$TEMP_DIR/device_list.json"
echo "$STEP2_JSON" > "$TEMP_DIR/$CODENAME.json"

echo "• JSON saved in"
echo "  File 1: $TEMP_DIR/device_list.json"
echo "  File 2: $TEMP_DIR/$CODENAME.json"
