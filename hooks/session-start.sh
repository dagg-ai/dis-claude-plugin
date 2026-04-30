#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PREAMBLE_FILE="${SCRIPT_DIR}/preamble.md"

if command -v jq >/dev/null 2>&1; then
    jq -Rs '{hookSpecificOutput: {hookEventName: "SessionStart", additionalContext: .}}' < "${PREAMBLE_FILE}"
else
    preamble=$(cat "${PREAMBLE_FILE}")

    escape_for_json() {
        local s="$1"
        s="${s//\\/\\\\}"
        s="${s//\"/\\\"}"
        s="${s//$'\n'/\\n}"
        s="${s//$'\r'/\\r}"
        s="${s//$'\t'/\\t}"
        printf '%s' "$s"
    }

    escaped=$(escape_for_json "$preamble")
    printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$escaped"
fi
