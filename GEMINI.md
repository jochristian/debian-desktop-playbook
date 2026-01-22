# Project Context: Debian Desktop Ansible Playbook

## Overview
This project is an Ansible Playbook to deploy and configure a Debian 13 (Trixie) desktop environment. 
It supports multiple desktop environments (KDE, XFCE, Gnome) and installs various external applications.

## Key Files
- `main.yml`: The entry point for the playbook.
- `tasks/*.yml`: Individual task files for specific software or configurations.
- `vars/*.yml`: Variable definitions.

## Coding Style & Rules
1. **Idempotency**: All tasks must be idempotent.
2. **Debian Focus**: Targets Debian 13 "Trixie". Use `apt` module over `package` where possible.
3. **Modernized APT Sources**: Use the `DEB822` format (`.sources`) for all repository configurations.
4. **Sudo**: Tasks usually run with `become: true`.
5. **Formatting**: Use 2-space indentation for YAML.
6. **Tags**: Every import in `main.yml` must have a corresponding tag.
7. **Fresh Installs**: Assume a fresh Debian 13 installation. Do not write tasks for cleaning up legacy/old configurations unless specifically requested.

## User Preferences
- The user prefers "official repos" or "Flatpaks" over external scripts.
- Prefers official VS Code and Brave browser.
- External apps are only installed if `external: true`.
