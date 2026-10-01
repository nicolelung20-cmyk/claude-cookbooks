#!/bin/bash
set -euo pipefail

# Only run in Claude Code on the web.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"
uv sync --all-extras
echo 'export PATH="$CLAUDE_PROJECT_DIR/.venv/bin:$PATH"' >> "$CLAUDE_ENV_FILE"
