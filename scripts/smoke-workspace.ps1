param(
  [switch]$SkipBootstrap,
  [switch]$IncludeDocker
)

$ErrorActionPreference = 'Stop'

$workspaceRoot = Split-Path -Parent $PSScriptRoot
$legacyWorkspaceRoot = Join-Path (Split-Path -Parent $workspaceRoot) 'ai-copilot-workspace'

function Resolve-RepoPath([string]$Name) {
  $localPath = Join-Path $workspaceRoot $Name
  if (Test-Path $localPath) {
    return $localPath
  }

  $legacyPath = Join-Path $legacyWorkspaceRoot $Name
  if (Test-Path $legacyPath) {
    return $legacyPath
  }

  return $localPath
}

$repos = @{
  sdk = Resolve-RepoPath 'ai-copilot-sdk'
  react = Resolve-RepoPath 'ai-copilot-sdk-react'
  angular = Resolve-RepoPath 'ai-copilot-sdk-angular'
  marketing = Resolve-RepoPath 'ai-copilot-marketing-site'
  examples = Resolve-RepoPath 'ai-copilot-examples'
}

foreach ($entry in $repos.GetEnumerator()) {
  if (-not (Test-Path $entry.Value)) {
    throw "Required repo is missing for smoke validation: $($entry.Value)"
  }
}

function Invoke-Step([string]$Name, [string]$Path, [string[]]$Commands) {
  Write-Host "==> $Name"
  Push-Location $Path
  try {
    foreach ($command in $Commands) {
      Write-Host "   -> $command"
      Invoke-Expression $command
      if ($LASTEXITCODE -ne 0) {
        throw "Command failed in ${Path}: $command"
      }
    }
  } finally {
    Pop-Location
  }
}

if (-not $SkipBootstrap) {
  Invoke-Step 'Bootstrap examples workspace' $repos.examples @('npm run bootstrap:local')
}

Invoke-Step 'Validate workspace manifest' $workspaceRoot @('node .\scripts\validate-manifest.mjs')
Invoke-Step 'Build core SDK' $repos.sdk @('npm run build', 'npm run lint')
Invoke-Step 'Build React SDK' $repos.react @('npm run build', 'npm run lint')
Invoke-Step 'Build Angular SDK' $repos.angular @('npm run build', 'npm run lint')
Invoke-Step 'Validate examples mock API' $repos.examples @('node --check .\shared-mocks\mock-api.mjs')
Invoke-Step 'Build vanilla example' (Join-Path $repos.examples 'vanilla-example') @('npm run build')
Invoke-Step 'Build React example' (Join-Path $repos.examples 'react-example') @('npm run build')
Invoke-Step 'Build Angular example' (Join-Path $repos.examples 'angular-example') @('npm run build')
Invoke-Step 'Build marketing site' $repos.marketing @('npm run build')

if ($IncludeDocker) {
  Invoke-Step 'Build marketing Docker image' $repos.marketing @('docker build -t ai-copilot-marketing-site:workspace-smoke .')
}

Write-Host ''
Write-Host 'Workspace smoke checks passed.'
