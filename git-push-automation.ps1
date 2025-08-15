param(
    [Parameter(Mandatory=$true)]
    [string]$CommitMessage
)

# Function to check if git is installed
function Test-GitInstalled {
    try {
        git --version | Out-Null
        return $true
    }
    catch {
        Write-Host "Git is not installed. Please install Git first." -ForegroundColor Red
        return $false
    }
}

# Function to check if we're in a git repository
function Test-GitRepository {
    if (-not (Test-Path .git)) {
        Write-Host "Not a git repository. Please run this script from a git repository." -ForegroundColor Red
        return $false
    }
    return $true
}

# Main script
if (-not (Test-GitInstalled)) {
    exit 1
}

if (-not (Test-GitRepository)) {
    exit 1
}

try {
    # Get current branch name
    $currentBranch = git rev-parse --abbrev-ref HEAD

    # Check for changes
    $status = git status --porcelain
    if (-not $status) {
        Write-Host "No changes to commit." -ForegroundColor Yellow
        exit 0
    }

    # Stage all changes
    Write-Host "Staging changes..." -ForegroundColor Cyan
    git add .
    
    # Commit changes
    Write-Host "Committing changes..." -ForegroundColor Cyan
    git commit -m $CommitMessage
    
    # Push changes
    Write-Host "Pushing changes to remote repository..." -ForegroundColor Cyan
    git push origin $currentBranch
    
    Write-Host "Successfully pushed changes to remote repository!" -ForegroundColor Green
}
catch {
    Write-Host "An error occurred: $_" -ForegroundColor Red
    exit 1
}
