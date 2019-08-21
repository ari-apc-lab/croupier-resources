# Croupier Resources

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

> **NOTE:** Originally developed under the H2020 project [Croupier H2020 European Project](http://www.croupier.eu/): <https://github.com/ari-apc-lab/croupier>

## Contents

- [Examples](#blueprint-examples)
- [Infrastructure definitions](#infrastructure-definitions)
- [Scripts](#scripts)
- [Cloudify Manager Installation](#cloudify-manager-installation)
- [License](#license)
- [Legal disclaimer](#legal-disclaimer)

## Blueprint examples

Many simple examples can be found at `/examples` folder. Check the [examples readme](./README.md) for more information.

## Infrastructure definitions

Croupier GUI support the definition of infrastructures, so users doesn't have to know the specifics of each one. At `/infrastructure definitions` there are some examples.

## Scripts

- `force-cancel.sh`: Helps in cancelling an execution that is stucked.
- `stop-instance.sh`: Stops an execution.
- `package-blueprint.sh`: Packages a blueprint folder as a zip file.

## Cloudify manager installation

Croupier, as cloudify plugin, needs a remote Cloudify Manager server to work on.

### RPM

> **_NOTE:_** Requires a Centos 7 remote machine with at least 2 CPUs and 4 Gb of RAM (4 CPUs
and 12 Gb RAM recommended), reachable by the CLI, with requiretty disabled, and
no password for sudo command.

To install the orchestrator, just execute in the remote host:

`./rpm_install.sh
[HOST PRIVATE IP] [HOST PUBLIC IP] [Orchestrator NEW ADMIN PASSWORD]`

### Docker

In the _docker_ folder there is a _docker compose_ file to run the Cloudify
Manager attached with a VPN tunnel using fortinet VPN.

To use the VPN, place a VPN config file in the host machine and reference it in
the `.env` file. If VPN is not needed, just comment that part on the _docker
compose_ file.

> **_WARNING:_** The docker image cannot be configured for now; Therefore admin
> password is set to default and cannot be changed.

## License

Croupier is licensed under [Apache License, Version 2.0 (the License)](./LICENSE)

## Legal disclaimer

The open source software and source code are provide to you on an “AS IS” basis and Atos Spain SA disclaim any and all warranties and representations with respect to such software and related source code, whether express, implied, statutory or otherwise, including without limitation, any implied warranties of title, non-infringement, merchantability, satisfactory quality, accuracy or fitness for a particular purpose.

Atos Spain SA shall not be liable to make any corrections to the open source software or source code, or to provide any support or assistance with respect to it without any previously specify agreement.

Atos Spain SA disclaims any and all liability arising out of or in connection
with the use of this software and/or source code
