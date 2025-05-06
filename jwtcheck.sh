#!/bin/bash

command -v jq >/dev/null 2>&1 || { echo >&2 "jq is required but not installed."; exit 1; };
command -v base64 >/dev/null 2>&1 || { echo >&2 "base64 is required but not installed."; exit 1; };

if [ -z "$1" ]; then
    echo "Usage: ./jwtcheck.sh <TOKEN>"
    exit 1
fi

jwt="$1"

#echo "$jwt" | cut -d '.' -f2 | base64 -d | jq .
payload=$(echo "$jwt" | cut -d '.' -f2)

# Padding hinzufügen falls nötig
mod=$((${#payload} % 4))
if [ $mod -eq 1 ]; then
    payload="${payload}==="
elif [ $mod -eq 2 ]; then
    payload="${payload}=="
elif [ $mod -eq 3 ]; then
    payload="${payload}="
fi

# Für macOS (BSD) verwenden wir -D und -i für die base64-Dekodierung
echo "$payload" | base64 -D | jq .
