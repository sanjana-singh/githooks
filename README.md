# Git Hooks

Git hooks are scripts that run automatically every time a particular event occurs in a Git repository. They let you customize Git's internal behavior and trigger customizable actions at key points in the development life cycle.

## Purpose

This document is useful to set up pre-commit hooks for your Drupal project locally. When you try to commit changes, the pre-commit hook will automatically:
1. Check if the code adheres to the Drupal coding standards using PHP_CodeSniffer.
2. Scan the code for any secrets using Gitleaks.

If any violations or secrets are found, the commit will be aborted, and you will need to fix the issues before committing again. To bypass the pre-commit hook, you can use the `--no-verify` option with your commit command.

### Prerequisite

Ensure you have a local setup of a Drupal project.

## Setup Instructions (Pre-commit Hook for Gitleaks and Drupal Coder)

All the below commands need to be run under the profile folder (e.g., `pfecpfarthritis\app\profiles\pfecpfarthritis_profile`).

### 1. Install Husky

A. Run `npm install --save-dev husky`  
B. If `package.json` file is not present in the repo, then run `npm init -y` to create it.  
C. Run `npx husky init`: It creates `.pre-commit` file under `.husky` folder.

### 2. Gitleaks Setup

A. We can see all the releases on [Releases · gitleaks/gitleaks](https://github.com/gitleaks/gitleaks/releases)  
B. Download a specific version file based on your system (e.g., `gitleaks_8.21.2_windows_x64.zip`) and place it under any specific folder in your local.  
C. Set an environment variable for the path to the downloaded `.exe` file.  
D. Run `gitleaks --version` to make sure Gitleaks installed correctly.

### 3. Pre-commits scripts

A. Upload the shared files and folder inside `.husky` folder and then run the following commands to make sure the pre-commits directory and the scripts inside it are executable:
   chmod +x .git/hooks/pre-commits/*
   chmod +x .git/hooks/pre-commit

## How To Test
A. Gitleaks
I. Add a secret key (e.g., $client_secret<vscode_annotation details='%5B%7B%22title%22%3A%22hardcoded-credentials%22%2C%22description%22%3A%22Embedding%20credentials%20in%20source%20code%20risks%20unauthorized%20access%22%7D%5D'> =</vscode_annotation> 'AIzaSyD88A45fYZnb2dLBTD-MqEU9BZLvjE8AQQ';) in any file.
II. Commit the changes.
III. You will see notifications in GitBash indicating the detection of the secret.

B. PHPCS
I. Add extra spaces in any .php file.
II. Commit the changes.
III. You will see notifications in GitBash highlighting the coding standard violations.

References
How to Add Commit Hooks to Git with Husky to Automate Code Tasks
