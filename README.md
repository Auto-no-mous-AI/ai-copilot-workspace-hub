# AI Copilot Workspace Hub

[![CI](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/ci.yml/badge.svg)](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/ci.yml) [![Release](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/release.yml/badge.svg)](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/release.yml)

Parent orchestration workspace for the AI Copilot multi-repo platform.

## What this repo does

- clones or updates the 8 platform repos into one workspace
- bootstraps local dependencies across SDKs, examples, and infra
- runs a single smoke command across SDKs, examples, and marketing
- documents the repo map and recommended developer flow

## Quick start

```bash
npm run bootstrap:workspace
npm run smoke:workspace
```

## Key docs

- [Workspace overview](./docs/workspace-overview.md)
- [Developer handbook](./docs/developer-handbook.md)
- [Releasing](./docs/releasing.md)
