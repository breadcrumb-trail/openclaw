#!/bin/sh
# Docker entrypoint script for OpenClaw gateway
# Supports environment variable configuration for bind mode and port

set -e

# Build gateway command arguments
GATEWAY_ARGS="--allow-unconfigured"

# Use OPENCLAW_GATEWAY_BIND env var if set, otherwise default to loopback
if [ -n "$OPENCLAW_GATEWAY_BIND" ]; then
  GATEWAY_ARGS="$GATEWAY_ARGS --bind $OPENCLAW_GATEWAY_BIND"
fi

# Execute gateway with constructed arguments
exec node dist/index.js gateway $GATEWAY_ARGS "$@"
