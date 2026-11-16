# Homelab

Docker Compose stacks for my home server (Ubuntu 24.04, `kuchacore`). Apps are published under subdomains of `icarokucha.com` through a Cloudflare Tunnel, so no ports are opened on the router.

## Stacks

| Stack | Services | Address |
|---|---|---|
| [`stacks/core`](stacks/core) | n8n (+ task runner), Evolution API, Postgres 18, Redis, Cloudflare Tunnel | `n8n.icarokucha.com`, `evolution.icarokucha.com` |
| [`stacks/portainer`](stacks/portainer) | Portainer CE | LAN only, port 9443 |

## Setup on a fresh server

```bash
git clone https://github.com/icaroLK/homelab.git ~/homelab

# Portainer
cd ~/homelab/stacks/portainer
docker volume create portainer_data
docker compose up -d

# n8n + Evolution
cd ~/homelab/stacks/core
cp .env.example .env
# fill in .env (secrets: openssl rand -hex 32), then:
docker compose up -d
```

Postgres creates one database and user per app on first start (`init-databases.sh`).

## Updating

Change the version in `.env`, then:

```bash
docker compose pull && docker compose up -d
```

## Secrets

Nothing secret lives in this repo. Each stack ships a `.env.example` with every secret blank; the real `.env` stays on the server. `backups/` is git-ignored.
