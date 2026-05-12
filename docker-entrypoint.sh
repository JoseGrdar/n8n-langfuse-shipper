#!/bin/sh
set -u
: "${SHIPPER_LOOP_SLEEP:=30}"
echo "[entrypoint] daemon loop starting, sleep between cycles: ${SHIPPER_LOOP_SLEEP}s"
while true; do
  n8n-shipper shipper "$@" || echo "[entrypoint] shipper exited with code $?, continuing after sleep"
  sleep "${SHIPPER_LOOP_SLEEP}"
done
