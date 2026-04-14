# Releasing

## CI workflow

- Workflow: `CI`
- Trigger: push to `main`, pull requests to `main`, or manual `workflow_dispatch`
- Purpose: validate the workspace manifest and bootstrap scripts

## Release workflow

- Workflow: `Release Bundle`
- Trigger: manual dispatch or a `v*` tag
- Purpose: publish the orchestration scripts and docs as a downloadable artifact bundle
