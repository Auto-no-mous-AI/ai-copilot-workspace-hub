# AI Copilot Workspace Hub

[![CI](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/ci.yml/badge.svg)](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/ci.yml) [![Release](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/release.yml/badge.svg)](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/actions/workflows/release.yml)

Parent orchestration workspace for the AI Copilot multi-repo platform.

## What this repo does

- clones or updates the 8 platform repos into one workspace
- bootstraps local dependencies across SDKs, examples, and infra
- documents the repo map and recommended developer flow

## Repositories managed

- `ai-copilot-sdk`
- `ai-copilot-sdk-react`
- `ai-copilot-sdk-angular`
- `ai-copilot-marketing-site`
- `ai-copilot-examples`
- `ai-copilot-infra`
- `ai-copilot-observability`
- `ai-copilot-security`

## Quick start

```bash
npm run bootstrap:workspace
```

## CI And Release

- Manual CI trigger is available through the `CI` workflow in GitHub Actions.
- Release instructions live in [docs/releasing.md](./docs/releasing.md).
