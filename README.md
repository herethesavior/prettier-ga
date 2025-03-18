# Auto Format Code with Prettier on Pull Request for Salesforce Codebase

[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square)](https://github.com/prettier/prettier)

This GitHub repository includes a GitHub Action that automatically reformats code using [Prettier](https://prettier.io/) whenever a pull request is created or updated. The action targets relevant Salesforce-specific file types such as Apex, Visualforce, Lightning Web Components (LWC), and metadata files, ensuring consistent formatting across your Salesforce codebase.

## ✨ Features

- Automatically formats Salesforce code on pull request creation or update.
- Supports a wide range of Salesforce-related file types:
  - `.js`, `.ts`, `.jsx`, `.tsx` (JavaScript, TypeScript, JSX, TSX files for LWC and front-end code)
  - `.json` (metadata, configuration files)
  - `.css`, `.scss`, `.html` (stylesheets and HTML files for LWC)
  - `.cls` (Apex classes)
  - `.apexc`, `.trigger`, `.apex` (Apex classes and triggers)
  - `.cmp`, `.page`, `.component` (Aura components, Visualforce pages, and LWC)
  - `-meta.xml` (metadata XML files)
- Ensures consistent formatting and better code quality for Salesforce development teams.

## ⚙️ Workflow Details

This GitHub Action is triggered by the following event:

- `pull_request` (when a pull request is created or updated).

### Steps:

1. **Checkout the repository**: The action checks out the code in the pull request.
2. **Install Node.js and dependencies**: It installs Node.js (version 18) and project dependencies using `npm ci`.
3. **Fetch and format unformatted Salesforce files**: The action identifies files that have changed between the pull request base and head, and then runs Prettier to format those files.
4. **Commit formatted files**: If Prettier makes any changes, the action commits and pushes the formatted files back to the pull request.

## 📌 Requirements

- Node.js 18.x
- Prettier installed in your project
- A GitHub repository with pull request workflows enabled

## 📦 Prettier Plugins

Ensure that your Salesforce project’s `package.json` or related configuration includes the following Prettier plugins:

```json
"plugins": ["prettier-plugin-apex", "@prettier/plugin-xml"]
```

## 🛠️ How to Implement

### 1️⃣ Install Prettier and Required Plugins

Ensure Prettier and the necessary plugins are installed in your project:

```sh
npm install --save-dev prettier prettier-plugin-apex @prettier/plugin-xml
```

### 2️⃣ Create a `.prettierrc` Configuration File

Add a `.prettierrc` file at the root of your repository with the following configuration:

```json
{
  "trailingComma": "none",
  "endOfLine": "lf",
  "useTabs": false,
  "tabWidth": 2,
  "printWidth": 120,
  "plugins": ["prettier-plugin-apex", "@prettier/plugin-xml"],
  "overrides": [
    {
      "files": "*.{cls,apexc,trigger}",
      "options": {
        "printWidth": 120,
        "useTabs": false,
        "tabWidth": 4,
        "apexInsertFinalNewline": true
      }
    },
    {
      "files": "*.apex",
      "options": {
        "printWidth": 120,
        "useTabs": false,
        "tabWidth": 4,
        "apexInsertFinalNewline": true,
        "parser": "apex-anonymous"
      }
    },
    {
      "files": "**/lwc/**/*.html",
      "options": {
        "printWidth": 120,
        "parser": "lwc",
        "bracketSameLine": true
      }
    },
    {
      "files": "*.{cmp,page,component}",
      "options": {
        "printWidth": 120,
        "parser": "html",
        "bracketSameLine": true
      }
    },
    {
      "files": "*-meta.xml",
      "options": {
        "printWidth": 100,
        "tabWidth": 4,
        "useTabs": false,
        "bracketSameLine": true,
        "xmlSelfClosingSpace": false,
        "embeddedLanguageFormatting": "off",
        "xmlWhitespaceSensitivity": "preserve",
        "xmlSortAttributesByKey": true
      }
    }
  ]
}
```

### 3️⃣ Set Up the GitHub Action

Create a `.github/workflows/prettier-reformat.yaml` file with the following content:

```yaml
name: validate-pull-request
on:
  - pull_request
jobs:
  format-source-code:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
          ref: ${{ github.event.pull_request.head.sha }}

      - name: Install NodeJS
        uses: actions/setup-node@v3
        with:
          node-version: "18"
          cache: "npm"

      - name: Install dependencies
        run: npm ci

      - name: Get unformatted files
        id: changes
        run: |
          git diff -z --name-only --diff-filter=ACMRT origin/${{ github.event.pull_request.base.ref }}...origin/${{ github.event.pull_request.head.ref }} | \
          xargs -0 -I {} npx prettier --write "{}"

      - name: Commit formatted files
        run: |
          git config --local user.email "$(git log --format='%ae' HEAD^!)"
          git config --local user.name "$(git log --format='%an' HEAD^!)"
          git add .
          if [ -z "$(git status --porcelain)" ]; then
            exit 0
          fi
          git commit -m "chore: format source code with Prettier"
          git push origin HEAD:${{ github.event.pull_request.head.ref }}
```

### 4️⃣ Commit and Push the Changes

Commit and push these files to your repository. The GitHub Action will automatically format code when a pull request is created or updated.

```sh
git add .
git commit -m "chore: setup Prettier auto-formatting"
git push origin main
```

### 5️⃣ Verify Formatting on a Pull Request

Create or update a pull request to see the action in effect. The bot will automatically reformat your code if needed.
