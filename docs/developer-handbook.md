# Developer Handbook

This handbook is the top-level guide for engineers working across the AI Copilot multi-repo workspace.

## Workspace entry point

1. Clone this repo.
2. Run `npm run bootstrap:workspace`.
3. Run `npm run smoke:workspace` after setup or after broad changes.

## Repository map

| Repo | Purpose | Key docs |
| --- | --- | --- |
| `ai-copilot-sdk` | Core embeddable web SDK and browser loader | [README](https://github.com/Auto-no-mous-AI/ai-copilot-sdk), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-sdk/blob/main/docs/releasing.md) |
| `ai-copilot-sdk-react` | React wrapper over the core SDK | [README](https://github.com/Auto-no-mous-AI/ai-copilot-sdk-react), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-sdk-react/blob/main/docs/releasing.md) |
| `ai-copilot-sdk-angular` | Angular wrapper over the core SDK | [README](https://github.com/Auto-no-mous-AI/ai-copilot-sdk-angular), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-sdk-angular/blob/main/docs/releasing.md) |
| `ai-copilot-marketing-site` | Public Angular marketing website | [README](https://github.com/Auto-no-mous-AI/ai-copilot-marketing-site), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-marketing-site/blob/main/docs/releasing.md) |
| `ai-copilot-examples` | Vanilla, React, and Angular example hosts | [README](https://github.com/Auto-no-mous-AI/ai-copilot-examples), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-examples/blob/main/docs/releasing.md) |
| `ai-copilot-infra` | K8s, Terraform, secrets, and environment automation | [README](https://github.com/Auto-no-mous-AI/ai-copilot-infra), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-infra/blob/main/docs/releasing.md) |
| `ai-copilot-observability` | Monitoring, alerting, dashboards, and runbooks | [README](https://github.com/Auto-no-mous-AI/ai-copilot-observability), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-observability/blob/main/docs/releasing.md) |
| `ai-copilot-security` | Policies, controls, Rego checks, and threat models | [README](https://github.com/Auto-no-mous-AI/ai-copilot-security), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-security/blob/main/docs/releasing.md) |

## Common change paths

### Widget runtime changes

Start in `ai-copilot-sdk`.
Then validate:
- `ai-copilot-sdk-react`
- `ai-copilot-sdk-angular`
- `ai-copilot-examples`
- `npm run smoke:workspace`

### Example and onboarding changes

Start in `ai-copilot-examples`.
Use the workspace smoke command to make sure SDK and marketing builds still pass.

### Release workflow changes

Update the relevant repo's `.github/workflows/*.yml` and `docs/releasing.md`.
If the change affects release-note structure, also update `.github/release.yml`.

### Deployment changes

Start in `ai-copilot-infra`.
If monitoring or controls change too, follow through in:
- `ai-copilot-observability`
- `ai-copilot-security`

## Validation checklist

- `npm run bootstrap:workspace`
- `npm run smoke:workspace`
- any repo-specific build or lint relevant to your change
- check the repo's `docs/releasing.md` if your change affects release flow

## Release model

- SDK repos publish npm packages and create GitHub Releases on tags.
- Marketing publishes a GHCR image and creates a GitHub Release on tags.
- Examples, infra, observability, security, and this hub publish artifact bundles and create GitHub Releases on tags.
