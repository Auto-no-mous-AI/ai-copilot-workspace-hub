# Developer Handbook

This handbook is the top-level guide for engineers working across the AI Copilot multi-repo workspace.

## Workspace entry point

1. Clone `ai-copilot-platform` for the main product runtime.
2. Clone `ai-copilot-docs` for the implementation book.
3. Clone this repo when you want the companion repos in one place.
4. Run `npm run bootstrap:workspace`.
5. Run `npm run smoke:workspace` after setup or after broad companion-repo changes.

## Repository map

| Repo | Purpose | Ownership note | Key docs |
| --- | --- | --- | --- |
| `ai-copilot-platform` | Core product runtime, admin UI, API, worker, local bootstrap, staging automation | Primary runtime source of truth | [README](https://github.com/Auto-no-mous-AI/ai-copilot-platform), [Deployment guide](https://github.com/Auto-no-mous-AI/ai-copilot-platform/blob/main/docs/deployment-guide.md) |
| `ai-copilot-docs` | GitBook-style developer documentation | Primary long-form docs source | [README](https://github.com/Auto-no-mous-AI/ai-copilot-docs) |
| `ai-copilot-sdk` | Core embeddable web SDK and browser loader | Standalone package and release owner for the web SDK | [README](https://github.com/Auto-no-mous-AI/ai-copilot-sdk), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-sdk/blob/main/docs/releasing.md) |
| `ai-copilot-sdk-react` | React wrapper over the core SDK | Standalone package and release owner for the React wrapper | [README](https://github.com/Auto-no-mous-AI/ai-copilot-sdk-react), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-sdk-react/blob/main/docs/releasing.md) |
| `ai-copilot-sdk-angular` | Angular wrapper over the core SDK | Standalone package and release owner for the Angular wrapper | [README](https://github.com/Auto-no-mous-AI/ai-copilot-sdk-angular), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-sdk-angular/blob/main/docs/releasing.md) |
| `ai-copilot-marketing-site` | Public Angular marketing website | Standalone public-site build and release owner | [README](https://github.com/Auto-no-mous-AI/ai-copilot-marketing-site), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-marketing-site/blob/main/docs/releasing.md) |
| `ai-copilot-examples` | Vanilla, React, and Angular example hosts | Example integrations and local bootstrap owner | [README](https://github.com/Auto-no-mous-AI/ai-copilot-examples), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-examples/blob/main/docs/releasing.md) |
| `ai-copilot-infra` | K8s, Terraform, secrets, and environment automation | Standalone infra building blocks owner | [README](https://github.com/Auto-no-mous-AI/ai-copilot-infra), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-infra/blob/main/docs/releasing.md) |
| `ai-copilot-observability` | Monitoring, alerting, dashboards, and runbooks | Standalone monitoring assets owner | [README](https://github.com/Auto-no-mous-AI/ai-copilot-observability), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-observability/blob/main/docs/releasing.md) |
| `ai-copilot-security` | Policies, controls, Rego checks, and threat models | Standalone security assets owner | [README](https://github.com/Auto-no-mous-AI/ai-copilot-security), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-security/blob/main/docs/releasing.md) |
| `ai-copilot-workspace-hub` | Companion repo bootstrap, smoke, and handbook | Cross-repo orchestration owner | [README](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub), [Releasing](https://github.com/Auto-no-mous-AI/ai-copilot-workspace-hub/blob/main/docs/releasing.md) |

## Common change paths

### Product runtime changes

Start in `ai-copilot-platform`.
Then validate any affected companion repo or docs path.

### Widget runtime and wrapper changes

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

Start in `ai-copilot-platform` for runtime deployment behavior.
Then follow through in:
- `ai-copilot-infra`
- `ai-copilot-observability`
- `ai-copilot-security`
when the change affects those delivery assets too.

## Validation checklist

- `npm run bootstrap:workspace`
- `npm run smoke:workspace`
- any repo-specific build or lint relevant to your change
- check the repo's `docs/releasing.md` if your change affects release flow
- update `ai-copilot-docs` if the developer contract changed

## Release model

- SDK repos publish npm packages and create GitHub Releases on tags.
- Marketing publishes a GHCR image and creates a GitHub Release on tags.
- Examples, infra, observability, security, and this hub publish artifact bundles and create GitHub Releases on tags.
- Platform remains the main runtime implementation even when companion repos publish adjacent artifacts.
