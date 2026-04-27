# Codex Remote SSH Auth

This file documents the working setup for using multiple Codex accounts from a single remote SSH host while keeping all files under the `oliver` user.

## Quick Start

1. Connect from Kiana to the remote host as `oliver`.
2. In the remote terminal, run:

```bash
codex-auth switch
```

3. Pick the account you want.
4. Reload or reconnect the remote VS Code window:

- `Developer: Reload Window`
- `Remote-SSH: Reconnect Current Window`

## Daily Commands

```bash
codex-auth list
codex-auth switch
codex-auth switch work
```

If VS Code does not reflect the new account right away, reload the remote window:

- `Developer: Reload Window`
- `Remote-SSH: Reconnect Current Window`

## Goal

- Keep the filesystem and repo access anchored to `oliver`
- Switch Codex accounts without creating separate remote users
- Use VS Code Remote SSH as the access path from the local Mac

## Final Shape

- Local Mac: `Kiana`
- Remote SSH host: `Oliver` / `192.168.64.2`
- SSH user on the remote host: `oliver`
- Codex account switching: `codex-auth`

Do not use the temporary `codex-personal` or `codex-work` remote users for the final setup. Those were rolled back because they split the remote filesystem boundary.

## Remote Host Setup

Run these on the remote host as `oliver`:

```bash
command -v codex >/dev/null || npm install -g @openai/codex
npm install -g @loongphy/codex-auth
```

Verify the helper sees accounts:

```bash
codex-auth list
```

Add an account:

```bash
codex-auth login --device-auth
```

Repeat the login flow for the second account.

## Switching Accounts

From a terminal inside the remote VS Code window:

```bash
codex-auth switch
```

You can also switch directly:

```bash
codex-auth switch work
```

or by row number from `codex-auth list`.

After switching, reload or reconnect the remote window so the VS Code extension picks up the new active account:

- `Developer: Reload Window`
- `Remote-SSH: Reconnect Current Window`

## SSH Layout on Kiana

Keep a single SSH target for the VM. The intended shape is:

```ssh-config
Host 192.168.64.2
  HostName 192.168.64.2
  User oliver
```

If you prefer an alias such as `lume`, use that alias, but keep it mapped to `oliver` only.

## What Not to Use

- Do not use separate remote users for Codex account switching if the repo/files must stay under `oliver`
- Do not rely on VS Code profiles alone to separate Codex auth state
- Do not use `codex-auth` as a filesystem boundary; it only manages account state

## Troubleshooting

- If `ssh` lands in the wrong user, check `~/.ssh/config` on Kiana
- If VS Code still shows the old account after a switch, reload the remote window
- If `codex-auth list` shows no accounts, repeat the device login flow inside the remote `oliver` session

## Source References

- [Codex auth docs](https://developers.openai.com/codex/auth)
- [codex-auth repository](https://github.com/Loongphy/codex-auth)
- [VS Code Remote SSH docs](https://code.visualstudio.com/docs/remote/ssh)
