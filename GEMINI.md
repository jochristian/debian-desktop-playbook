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
3. **Sudo**: Tasks usually run with `become: true`.
4. **Formatting**: Use 2-space indentation for YAML.
5. **Tags**: Every import in `main.yml` must have a corresponding tag.

## User Preferences
- The user prefers "official repos" or "Flatpaks" over external scripts.
- External apps (like Brave) are only installed if `external: true`.
