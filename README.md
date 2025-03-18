# Auto Format Code with Prettier on Pull Request for Salesforce Codebase

[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square)](https://github.com/prettier/prettier)

This GitHub repository includes a GitHub Action that automatically reformats code using [Prettier](https://prettier.io/) whenever a pull request is created or updated. The action targets relevant Salesforce-specific file types such as Apex, Visualforce, Lightning Web Components (LWC), and metadata files, ensuring consistent formatting across your Salesforce codebase.

## Features

- Automatically formats Salesforce code on pull request creation or update.
- Supports a wide range of Salesforce-related file types:
  - `.js`, `.ts`, `.jsx`, `.tsx` (JavaScript, TypeScript, JSX, TSX files for LWC and other related front-end code)
  - `.json` (metadata, configuration files)
  - `.css`, `.scss`, `.html` (stylesheets and HTML files for LWC)
  - `.cls` (Apex classes)
  - `.apexc`, `.trigger`, `.apex` (Apex classes and triggers)
  - `.cmp`, `.page`, `.component` (Aura components, Visualforce pages, and LWC)
  - `-meta.xml` (metadata XML files)
- Ensures consistent formatting and better code quality for Salesforce development teams.

## Workflow Details

The GitHub Action is triggered by the following event:
- `pull_request` (when a pull request is created or updated).

### Steps:
1. **Checkout the repository**: The action checks out the code in the pull request.
2. **Install Node.js and dependencies**: It installs Node.js (version 18) and project dependencies using `npm ci`.
3. **Fetch and format unformatted Salesforce files**: The action identifies files that have changed between the pull request base and head, and then runs Prettier to format those files.
4. **Commit formatted files**: If Prettier makes any changes to the code, the action commits and pushes the formatted files back to the pull request.

## How It Works

This action uses `git diff` to identify modified files in the pull request, specifically targeting Salesforce-related files. It then runs Prettier to format those files. If any files are formatted, the action commits the changes and pushes them back to the pull request branch.

## Requirements

- Node.js 18.x
- Prettier installed in your project
- A GitHub repository with pull request workflows enabled

## Prettier Plugins

Ensure that your Salesforce project’s `package.json` or related configuration includes the following Prettier plugins for Salesforce files:

```json
"plugins": ["prettier-plugin-apex", "@prettier/plugin-xml"]
