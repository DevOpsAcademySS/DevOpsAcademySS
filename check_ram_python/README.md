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
This Check RAM check is written in Python, and it uses `psutil` package to get info about RAM.

## Usage examples <a name="ue"></a>
---


```sh
usage: check_ram.py [-h] [-w WARNING] [-c CRITICAL]

optional arguments:
  -h, --help            show this help message and exit
  -w WARNING, --warning WARNING
                        Percent of RAM usage for WARNING message (default 70)
  -c CRITICAL, --critical CRITICAL
                        Percent of RAM usage for CRITICAL message (default 90)
```

## Installation <a name="inst"></a>
---

#### Asset definition <a name="ad"></a>
---

Copy and save next text in `check_ram_asset.yml` file.

 > **NOTE**: Replace `sha512` to those tha are in `sha512sum_check_ram_linux.txt`.

```yml
---
type: Asset
api_version: core/v2
metadata:
  name: check_ram_python
  namespace: default
  labels:
    version: "1.0"
    type: python
spec:
  builds:
    - url: https://github.com/DevOpsAcademySS/DevOpsAcademySS/tree/IA-265-andre-sensu-go-monitoring-as-code/check_ram_python_1.0_linux_amd64.tar.gz
      sha512:
      filters:
        - entity.system.os == 'linux'
        - entity.system.arch == 'amd64'

```

Add asset to your sensu with the folowing command:

```sh
sensuctl create -f check_ram_asset.yml
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
  name: check_ram
  namespace: default
spec:
  command: "check_ram.py -w 70 -c 90"
  interval: 10
  publish: true
  runtime_assets:
    - check_ram_python
  subscriptions:
    - system

```