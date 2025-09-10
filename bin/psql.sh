#!/usr/bin/env bash
set -euo pipefail
docker compose exec -e PGPASSWORD=postgres -e PGUSER=postgres -e PGDATABASE=app postgres psql --pset expanded=auto -h postgres "$@"
