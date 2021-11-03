# Sensu Go Check CPU

## Table of Contents
---
*  [Overview](#ov)
*  [Usage examples](#ue)
*  [Installation](#inst)
    *  [Asset definition](#ad)
    *  [Check definition](#cd)

## Overview <a name="ov"></a>
---
This Check CPU check is written in Go, and it uses `github.com/shirou/gopsutil/cpu` package to do so.

## Usage examples <a name="ue"></a>
---


```sh
Usage:
  check_cpu [flags]

Flags:
  -h,        Show flags
  -c, float  Percent fo CPU usage for CRITICAL (default 90)
  -w, float  Percent fo CPU usage for WARNING (default 70)
```

## Installation <a name="inst"></a>
---

#### Asset definition <a name="ad"></a>
---

Copy and save next text in `check_cpu_go_asset.yml` file.

 > **NOTE**: Replace `sha512` to those tha are in `sha512sum_check_cpu_go_linux.txt` and `sha512sum_check_cpu_go_windows.txt`.

```yml
---
type: Asset
api_version: core/v2
metadata:
  name: check_cpu_go
  namespace: default
  labels:
    version: "1.0"
    type: go
spec:
  builds:
    - url: https://github.com/DevOpsAcademySS/DevOpsAcademySS/tree/IA-265-andre-sensu-go-monitoring-as-code/check_cpu_go_1.0_linux_amd64.tar.gz
      sha512: bc67b8f42f994636e882ea981d0c1e4e726bf057acdd44c327ee14c890fd9cd7c8248fdca6ddb01b58799f2898a9b64091a5247fb23f8b9eb41f3d23e1bf78b4
      filters:
        - entity.system.os == 'linux'
        - entity.system.arch == 'amd64'
    - url: https://github.com/DevOpsAcademySS/DevOpsAcademySS/tree/IA-265-andre-sensu-go-monitoring-as-code/check_cpu_go_1.0_windows_amd64.tar.gz
      sha512: ade1afbab3147c9180dfc35f8d5b93fe696fe42cc754ad193944e523ecabaad35782cd068ec6593c6a9355ee0fdfafb8506b051fe1c6f3b2bef6d323a4932ee4
      filters:
        - entity.system.os == 'windows'
        - entity.system.arch == 'amd64'

```

Add asset to your sensu with the folowing command:

```sh
sensuctl create -f check_cpu_go_asset.yml
```

Now you can you can use this asset in check.

[sa]:https://docs.sensu.io/sensu-go/latest/reference/assets/

#### Check definition <a name="cd"></a>
---

```yml
---
type: CheckConfig
api_version: core/v2
metadata:
  name: check_cpu
  namespace: default
spec:
  command: "check_cpu -w=70 -c=90"
  interval: 10
  publish: true
  runtime_assets:
    - check_cpu_go
  subscriptions:
    - system
```