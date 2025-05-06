# dotsh: Shell Script Collection
A personal collection of shell scripts

## Topic

- 🔐 **JWT**: docode ans inspect JSON Web Tokens

## 🛠️ Prerequisites

The script `jwtcheck.sh` requires the following tools to be installed:

- `jq` - for pretty-printing JSON
- `base64` - to decode base64-encoded JWT parts (use `base64 -D` on macOS)

## Usage

```bash
$ chmod +x jwtcheck.sh
$ ./jwtcheck.sh <TOKEN>
```

