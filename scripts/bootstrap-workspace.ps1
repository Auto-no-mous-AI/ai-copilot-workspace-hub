param(
  [string]$WorkspaceRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$manifestPath = Join-Path $WorkspaceRoot 'repos.json'
$repos = Get-Content $manifestPath -Raw | ConvertFrom-Json

foreach ($repo in $repos) {
  $target = Join-Path $WorkspaceRoot $repo.name
  if (-not (Test-Path $target)) {
    git clone $repo.url $target
    if ($LASTEXITCODE -ne 0) { throw "Failed to clone $($repo.name)" }
  } else {
    Push-Location $target
    try {
      git pull --ff-only
      if ($LASTEXITCODE -ne 0) { throw "Failed to update $($repo.name)" }
    } finally {
      Pop-Location
    }
  }
}

$examplesPath = Join-Path $WorkspaceRoot 'ai-copilot-examples'
Push-Location $examplesPath
try {
  npm install
  if ($LASTEXITCODE -ne 0) { throw 'Failed to install workspace hub root scripts in examples repo.' }
  npm run bootstrap:local
  if ($LASTEXITCODE -ne 0) { throw 'Failed to run examples bootstrap.' }
} finally {
  Pop-Location
}

Write-Host 'Workspace bootstrap completed.'
