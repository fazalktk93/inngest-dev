# Inngest Dev Server — DigitalOcean App Platform Template

This repo deploys the official **Inngest Dev Server** (`inngest/inngest`) on
DigitalOcean App Platform and points it at your app’s `/api/inngest`.

## What you need

- An app (Next.js/Express/etc.) that exposes `/api/inngest` and is publicly reachable.
- Its public URL, e.g. `https://my-app.ondigitalocean.app/api/inngest`.

## Environment variables

- `TARGET_URL` (required): public URL to your app’s `/api/inngest`.

## Deploy options

### A) One-click template (Deploy to DO)
1. Edit `.do/deploy.template.yaml` and set `TARGET_URL`.
2. Push to GitHub.
3. Add this button to your README (optional):

[![Deploy to DO](https://www.deploytodo.com/do-btn-blue.svg)](
https://cloud.digitalocean.com/apps/new?repo=https://github.com/fazalktk93/inngest-dev/tree/main&spec=.do/deploy.template.yaml
)

When clicked, App Platform preloads `.do/deploy.template.yaml`. Confirm `TARGET_URL` and deploy.

### B) CLI (doctl)

```bash
# set once
doctl auth init
# deploy
doctl apps create --spec app.yaml
# update later
doctl apps update <APP-ID> --spec app.yaml
