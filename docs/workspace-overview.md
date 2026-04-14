# Workspace Overview

This repo is the single entry point for new developers who need the full multi-repo AI Copilot workspace.

## Bootstrap flow

1. clone this repo
2. run `npm run bootstrap:workspace`
3. the script clones or updates all child repos
4. it delegates local dependency installation and SDK/example setup to `ai-copilot-examples`

## Recommended daily workflow

- use the child repo that matches the change you are making
- use this repo when you need a fresh workstation bootstrap or a shared map of the platform
