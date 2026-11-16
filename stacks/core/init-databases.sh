#!/bin/bash
# Runs once, on the first start of an empty Postgres volume.
# Creates a separate database and user for each app.
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname postgres <<-EOSQL
	CREATE USER n8n WITH PASSWORD '${N8N_DB_PASSWORD}';
	CREATE DATABASE n8n OWNER n8n;

	CREATE USER evolution WITH PASSWORD '${EVOLUTION_DB_PASSWORD}';
	CREATE DATABASE evolution OWNER evolution;
EOSQL
