# Git Automation Script Guide

This guide explains how to use the PowerShell script for automating git operations in your project.

## Prerequisites

- Windows operating system
- Git installed and configured
- PowerShell 5.1 or higher

## Installation

1. Copy the `git-push-automation.ps1` script to your project directory
2. Ensure the script has execution permissions

To set execution permissions, run PowerShell as Administrator and execute:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Usage

The script automates the following git operations:
- Staging all changes
- Committing changes with a message
- Pushing changes to the remote repository

### Basic Usage

1. Open PowerShell in your project directory
2. Run the script with a commit message:

```powershell
.\git-push-automation.ps1 -CommitMessage "Your commit message here"
```

### Example

```powershell
.\git-push-automation.ps1 -CommitMessage "Update index.html with new features"
```

## Features

- Automatically detects if git is installed
- Verifies if the current directory is a git repository
- Checks for changes before attempting to commit
- Shows colored status messages for better visibility
- Automatically detects and uses the current branch name
- Provides error handling and informative messages

## Error Handling

The script includes error handling for common scenarios:
- Git not installed
- Not a git repository
- No changes to commit
- Push/commit failures

## Tips

1. Always run the script from your project's root directory
2. Provide meaningful commit messages
3. Make sure you have the necessary permissions to push to the remote repository
4. Check the output messages for any errors or warnings

## Troubleshooting

If you encounter issues:

1. Ensure git is properly installed and configured
2. Verify you have internet connection for pushing changes
3. Check if you have the necessary permissions for the repository
4. Make sure you're in the correct directory when running the script

## Support

If you need help or want to report issues, please create an issue in the project repository.
