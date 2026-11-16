# Homelab

Docker Compose stacks for my home server (Ubuntu 24.04, `kuchacore`).

## Stacks

| Stack | Services | Purpose |
|---|---|---|
| [`stacks/personal`](stacks/personal) | n8n, Postgres, Redis, Evolution API | Personal automations (Telegram bots, alerts, summaries) and a WhatsApp API |

## Usage

```bash
cd stacks/personal
cp .env.example .env
cp .env.evolution.example .env.evolution
# fill in the values, then:
docker compose up -d
```

## Secrets

Nothing secret lives in this repo. Each stack ships `.env.example` templates with every value blank; the real `.env` files stay on the server. `backups/` (workflow exports, credentials, database dumps) is git-ignored.
