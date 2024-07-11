# Quick start

This guide is a brief introduction about how to start using Lava in
your projects.

## Install Lava

There are two supported options to install Lava:

- Binary distributions
- Source code

### Binary distributions

Install the latest Lava command with the following command:

```
$ curl -LsSf https://github.com/adevinta/lava/releases/latest/download/lava_linux_amd64.tar.gz \
	| tar -xz -C /usr/local/bin lava
```

Official binary distributions are available at
<https://github.com/adevinta/lava/releases>.

### Install from source

Install the latest Lava command with `go install`.

```
$ go install github.com/adevinta/lava/cmd/lava@latest
```

## Initialize a new Lava project

Lava requires a configuration file (usually named `lava.yaml`) that
defines the parameters of the security scan. For instance, enabled
security checks, scan targets and reporting parameters.

```
$ lava init
```

The `lava init` command produces a minimal configuration file that can
be used as base for further customization.


```yaml
lava: v0.0.0
checktypes:
  - https://github.com/adevinta/lava-resources/releases/download/checktypes/v0/checktypes.json
targets:
  - identifier: .
    type: Path
agent:
  parallel: 4
report:
  severity: high
log: error
```

For more details, see [Configuration file format](helpdoc/configuration.md).

## Run a local scan

Once the configuration file is in place, just run `lava scan`.

```
$ lava scan
STATUS

- vulcansec/vulcan-trivy → .: FINISHED
- vulcansec/vulcan-semgrep → .: FINISHED

SUMMARY

CRITICAL: 0
HIGH: 2
MEDIUM: 0
LOW: 1
INFO: 0

Number of excluded vulnerabilities not included in the summary table: 0

VULNERABILITIES

...
```

Note that depending on the container runtime being used, it might be
necessary to customize the environment variable `LAVA_RUNTIME`:

- `Dockerd`: Docker Engine (default)
- `DockerdDockerDesktop`: Docker Desktop
- `DockerdRancherDesktop`: Rancher Desktop (dockerd backend)
- `DockerdPodmanDesktop`: Podman Desktop (dockerd compatibility layer)

For more details, see [Run scan](commands/scan.md) and
[Environment variables](helpdoc/environment.md).

## Integrate Lava with GitHub Actions

Lava provides the GitHub Action
[adevinta/lava-action](https://github.com/adevinta/lava-action).

Create a new workflow in the `.github/workflows` directory in your
repository with the following content.

```yaml
name: Lava
on: [push, pull_request]
permissions:
  contents: read
jobs:
  lava:
    name: Lava
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Run Lava Action
        uses: adevinta/lava-action@v0
```
