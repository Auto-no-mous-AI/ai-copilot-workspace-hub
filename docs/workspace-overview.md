# Workspace Overview

This repo is the shared entry point for developers who need the companion repositories around the main AI Copilot product.

## What this repo owns

`ai-copilot-workspace-hub` owns:

- the companion repo manifest in `repos.json`
- workspace bootstrap and smoke scripts
- the top-level cross-repo handbook
- shared release notes guidance for this orchestration repo

It does not replace:

- `ai-copilot-platform` as the runtime source of truth
- `ai-copilot-docs` as the long-form implementation book

## Bootstrap flow

1. clone this repo
2. run `npm run bootstrap:workspace`
3. run `npm run smoke:workspace`
4. the scripts clone or update all listed companion repos and validate the core developer path

## Key docs

- [Developer handbook](./developer-handbook.md)
- [Releasing](./releasing.md)

## Recommended daily workflow

- use the child repo that matches the change you are making
- use this repo when you need a fresh workstation bootstrap, a cross-repo smoke pass, or a shared map of the companion repos
