# Sensu Go Checks

* [Create Assets](#crt-asts)
* [Package the dynamic runtime asset](#pkg-dn-rn)
    * [Asset definition](#ad)
    * [Check definition](#cd)
* [Create Assets and Checks](#crt-cks)

## Documentation

---

Official documetation of [Assets.](https://docs.sensu.io/sensu-go/latest/plugins/assets/)

Official documetation of [Checks.](https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/checks/)

## Create Assets <a name="crt-asts"></a>

---

The first step is to ensure that your directory structure is in place. As noted in [Example dynamic runtime asset structure][ex-st], your script could live in three potential directories in the project: `/bin`, `/lib`, or `/include`. For this example, put your script in the `/bin` directory.

Folders structure:

```sh
check_cpu_go
├── CHANGELOG.md
├── LICENSE
├── README.md
└── bin
  └── check_cpu.go
├── lib
└── include
```

1. Create the directory `check_cpu_go`:

```sh
mkdir -p check_cpu_go/bin
```

2. Copy the script into the `check_cpu_go/bin` directory: 

```sh
cp check_cpu.go check_cpu_go/bin/
```

3. Make sure that the script is marked as executable:

```sh
chmod +x check_cpu_go/bin/check_cpu.go 
```

## Package the dynamic runtime asset <a name="pkg-dn-rn"></a>

---

Dynamic runtime assets are archives, so packaging the asset requires creating a tar.gz archive of your project.

1. Create the tar.gz archive for linux and windows:

```sh
tar -C check_cpu_go -cvzf check_cpu_go_1.0_linux_amd64.tar.gz .
tar -C check_cpu_go -cvzf check_cpu_go_1.0_windows_amd64.tar.gz .
```

2. Generate a SHA512 sum for the tar.gz archives (this is required for the dynamic runtime asset to work):

```sh
sha512sum check_cpu_go_1.0_linux_amd64.tar.gz > sha512sum_check_cpu_go_linux.txt
sha512sum check_cpu_go_1.0_windows_amd64.tar.gz > sha512sum_check_cpu_go_windows.txt
```

From here, you can host your dynamic runtime asset wherever you’d like. To make the asset available via [Bonsai][bonsai], you’ll need to host it on `GitHub`. Learn more in [The “Hello World” of Sensu Assets][hst-ghb] on Discourse.

To host your dynamic runtime asset on a different platform like `Gitlab` or `Bitbucket`, upload your asset there. You can also use `Artifactory` or even `Apache` or `Nginx` to serve your asset. All that’s required for your dynamic runtime asset to work is the `URL` to the asset and the `SHA512` sum for the asset to be downloaded.

### Asset definition <a name="ad"></a>
---

```yml
---
type: Asset
api_version: core/v2
metadata:
  name: check_cpu_go
  namespace: default
  labels:
    version: 1.0
    type: go
spec:
  builds:
    - url: https://github.com/DevOpsAcademySS/DevOpsAcademySS/tree/IA-222-andre-use-terragrant-gcp/check_cpu_go_1.0_linux_amd64.tar.gz
      sha512: be5f9ca76d239e68183a2dc5371fdf75e80d8fecae99a377af0355721f3b03eecc9b8eb10841b57df8b84744f30f9f5a327838debaf1e91719ecf05f0163d082
      filters:
        - entity.system.os == 'linux'
        - entity.system.arch == 'amd64'
    - url: https://github.com/DevOpsAcademySS/DevOpsAcademySS/tree/IA-222-andre-use-terragrant-gcp/check_cpu_go_1.0_windows_amd64.tar.gz
      sha512: ade1afbab3147c9180dfc35f8d5b93fe696fe42cc754ad193944e523ecabaad35782cd068ec6593c6a9355ee0fdfafb8506b051fe1c6f3b2bef6d323a4932ee4
      filters:
        - entity.system.os == 'windows'
        - entity.system.arch == 'amd64'
```

### Check definition <a name="cd"></a>
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

## Create Assets and Checks <a name="crt-cks"></a>

---

Although Sensu agents attempt to execute any command defined for a check, successful check result processing requires adherence to a simple specification.

  *  Result data is output to `STDOUT` or `STDERR`.
      *  For service checks, this output is typically a human-readable message.
      *  For metric checks, this output contains the measurements gathered by the check.
  *  Exit status code indicates state.
      *  `0` indicates OK.
      *  `1` indicates WARNING.
      *  `2` indicates CRITICAL.
      *  Exit status codes other than `0`, `1`, and `2` indicate an `UNKNOWN` or custom status.


Create assets and checks via `sensuctl`:

```sh
sensuctl create -f check_go_go_manifest.yml
sensuctl create -f check_ram_python_manifest.yml
```

[ex-st]:https://docs.sensu.io/sensu-go/latest/plugins/assets/#example-dynamic-runtime-asset-structure
[bonsai]:https://bonsai.sensu.io/
[hst-ghb]:https://discourse.sensu.io/t/the-hello-world-of-sensu-assets/1422