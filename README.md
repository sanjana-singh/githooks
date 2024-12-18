# Git Hooks

Git hooks are scripts that run automatically every time a particular event occurs in a Git repository. They let you customize Git's internal behavior and trigger customizable actions at key points in the development life cycle.

## Purpose

This document is useful to set up pre-commit hooks for your Drupal project locally. When you try to commit changes, the pre-commit hook will automatically:
1. Check if the code adheres to the Drupal coding standards using PHP_CodeSniffer.
2. Scan the code for any secrets using Gitleaks.

If any violations or secrets are found, the commit will be aborted, and you will need to fix the issues before committing again. To bypass the pre-commit hook, you can use the `--no-verify` option with your commit command.

### Prerequisite

Ensure you have a local setup of a Drupal project.

## Setup Instructions (Pre-commit Hook for Gitleaks and Coding Standards check)

### 1. Run the Script:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sanjana-singh/githooks/refs/heads/main/setup.sh)" || echo "Installation failed."


### 2. Gitleaks Setup (this step is required for Windows only)

A. We can see all the releases on [Releases · gitleaks/gitleaks](https://github.com/gitleaks/gitleaks/releases)  
B. Download a specific version file based on your system (e.g., [gitleaks_8.21.2_windows_x64.zip](https://github.com/gitleaks/gitleaks/releases/download/v8.21.2/gitleaks_8.21.2_windows_x64.zip)) and place it under any specific folder in your local.  
C. Set an environment variable for the path to the downloaded `.exe` file.  
D. Run `gitleaks --version` to make sure Gitleaks installed correctly.  

## How To Test
A. Gitleaks
  - Add a secret key in any file.
  - Commit the changes.
  - You will see notifications in GitBash indicating the detection of the secret.

B. PHPCS
   - Add extra spaces in any .php file.
   - Commit the changes.
   - You will see notifications in GitBash highlighting the coding standard violations.

