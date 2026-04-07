#!/bin/bash
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(dirname "$(dirname "$(dirname "$(realpath "$0")")")")}"
# Clean install to ensure native optional deps (e.g. @tailwindcss/oxide) are installed
# for the current platform. npm has a bug where they can be missing after a plain install.
rm -rf node_modules package-lock.json
npm install
