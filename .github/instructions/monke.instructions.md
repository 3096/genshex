---
applyTo: "monke/**"
---

# Monke Instructions: Violentmonkey Script Manager

## Project Overview
This repository hosts multiple userscripts for Violentmonkey inside the `monke/` directory. It uses a "Bundle Script" architecture to allow users to install all scripts at once via a single master file.

## Core Rules for Code Generation
- **Naming Convention**: All individual scripts must end with `.user.js` and be placed in `monke/`.
- **Metadata Block**: Every script must start with a valid [Violentmonkey Metadata Block](https://violentmonkey.github.io/api/metadata-block/).
- **The Bundle Method**:
    - There is a master file named `monke/bundle.user.js`.
    - The bundle's `@match` patterns should reflect the union of all child script `@match` patterns (i.e., the bundle only runs where its children run).
    - To add a new script to the collection, add a `@require` line to the `monke/bundle.user.js` metadata pointing to the RAW GitHub URL of the new `.user.js` file.
    - Update the bundle's `@match` if the new script targets different URLs.
    - **Crucial**: Whenever any script in the repo is updated, you MUST increment the `@version` number in `monke/bundle.user.js` to force Violentmonkey to refresh its cache and auto-update the required scripts.
- **Versioning**: All `@version` numbers must follow [Semantic Versioning](https://semver.org/) (`MAJOR.MINOR.PATCH`). Increment PATCH for bug fixes, MINOR for new features or non-breaking changes, and MAJOR for breaking changes.

## Userscript Standards
- **Compatibility**: Use modern ES6+ syntax as supported by current browsers.
- **Sandbox**: Default to `@grant none` unless specific `GM_*` APIs are requested.
- **Match Rules**: Always ask for the specific `@match` pattern for the target site to avoid global execution where unnecessary.

## Workflow
1. Create/Modify specific `.user.js` files in their respective folders under `monke/`.
2. Update the version and dependencies in `monke/bundle.user.js`.
3. Commit both to GitHub to trigger the update for end-users.
