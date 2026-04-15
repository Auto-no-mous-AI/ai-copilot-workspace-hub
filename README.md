# AI Copilot Workspace Hub

[![CI](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/ci.yml/badge.svg)](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/ci.yml) [![Release](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/release.yml/badge.svg)](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/release.yml)

Parent orchestration workspace for the AI Copilot multi-repo program.

## What this repo does

This repo manages the companion repositories listed in `repos.json` and gives the team one place to:

- clone or update the companion repos into one workspace
- bootstrap local dependencies across SDKs, examples, and infra-related assets
- run a single smoke command across SDKs, examples, and the standalone marketing site
- document the repo map and recommended cross-repo developer flow

Use it alongside:

- `ai-copilot-platform` for the main runtime product
- `ai-copilot-docs` for the GitBook-style implementation guide

## Quick start

```bash
npm run bootstrap:workspace
npm run smoke:workspace
```

## What `bootstrap:workspace` actually does

- reads `repos.json`
- clones or fast-forwards each listed companion repo
- installs dependencies in `ai-copilot-examples`
- runs the examples repo's local bootstrap flow

## Key docs

- [Workspace overview](./docs/workspace-overview.md)
- [Developer handbook](./docs/developer-handbook.md)
- [Releasing](./docs/releasing.md)
