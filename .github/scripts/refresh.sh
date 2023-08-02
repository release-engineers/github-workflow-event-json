#!/usr/bin/env bash

set -e -o pipefail

ARTIFACTS_LIMIT=100
ARTIFACTS=$(gh api /repos/re-organization-sandbox/sandbox-repo/actions/artifacts --paginate --jq ".artifacts[]")

WORK_DIR=$(mktemp -d)
trap 'rm -rf "$WORK_DIR"' EXIT

for DOWNLOAD_URL in $(echo "$ARTIFACTS" | jq -r ".archive_download_url" | head -n "$ARTIFACTS_LIMIT"); do
    gh api "$DOWNLOAD_URL" | bsdtar -xvf - -C "$WORK_DIR"
    EVENT_NAME=$(jq -r ".event_name" < "$WORK_DIR/context_github.json")
    EVENT_ACTION=$(jq -r ".event.action" < "$WORK_DIR/context_github.json")
    EVENT_PATH="on/$EVENT_NAME"
    if [ "$EVENT_ACTION" != "null" ]; then
      EVENT_PATH="on/$EVENT_NAME/$EVENT_ACTION"
    fi
    rm -rf "$EVENT_PATH" || true
    mkdir -p "$EVENT_PATH"
    cp -r "$WORK_DIR/" "$EVENT_PATH"
    cp -r .github/scripts/README.md.base "$EVENT_PATH/README.md"
done
