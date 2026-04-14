# Workspace Overview

This repo is the single entry point for new developers who need the full multi-repo AI Copilot workspace.

## Bootstrap flow

1. clone this repo
2. run `npm run bootstrap:workspace`
3. run `npm run smoke:workspace`
4. the scripts clone or update all child repos and validate the core developer path

## Key docs

- [Developer handbook](./developer-handbook.md)
- [Releasing](./releasing.md)

## Recommended daily workflow

- use the child repo that matches the change you are making
- use this repo when you need a fresh workstation bootstrap, a smoke pass, or a shared map of the platform
