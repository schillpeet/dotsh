#!/bin/bash

command -v jq >/dev/null 2>&1 || { echo >&2 "jq is required but not installed."; exit 1; };
command -v base64 >/dev/null 2>&1 || { echo >&2 "base64 is required but not installed."; exit 1; };

read -p "Enter JWT: " jwt

echo "$jwt" | cut '.' -f2 | base64 -D | jq .
