#!/usr/bin/env bash
# Serve the Greeting App over HTTP. MetaMask does not work on file:// pages by default.
# Usage: ./server.sh [port]   (default port: 8000)
set -euo pipefail

PORT="${1:-8000}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 is required but was not found." >&2
  exit 1
fi

if [[ -n "${CODESPACE_NAME:-}" ]]; then
  DOMAIN="${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-app.github.dev}"
  BASE_URL="https://${CODESPACE_NAME}-${PORT}.${DOMAIN}"
else
  BASE_URL="http://localhost:${PORT}"
fi

echo "Open one of these in a browser that has MetaMask:"
echo "  ethers.js: ${BASE_URL}/etherjs/app.html"
echo "  web3.js:   ${BASE_URL}/web3js/app.html"
echo "Press Ctrl+C to stop."
echo

exec python3 -m http.server "$PORT" --bind 127.0.0.1 --directory "$ROOT"
