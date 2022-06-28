# Couchbase Exporter Ansible Role

<p align="center">

  <a href="https://github.com/couchbaselabs/ansible-couchbase-exporter/graphs/contributors" alt="Contributors">
    <img src="https://img.shields.io/github/license/couchbaselabs/ansible-couchbase-exporter" />
  </a>

  <!--
  <a href="https://galaxy.ansible.com/couchbaselabs/exporter" alt="Ansible Role">
    <img src="https://img.shields.io/ansible/role/{roleId}" />
  </a>

  <a href="https://galaxy.ansible.com/couchbaselabs/exporter" alt="Ansible Quality Score">
    <img src="https://img.shields.io/ansible/quality/{roleId}" />
  </a>

  <a href="https://galaxy.ansible.com/couchbaselabs/exporter" alt="Downloads">
    <img src="https://img.shields.io/ansible/role/d/{roleId}" />
  </a>
  -->

  <a href="https://github.com/couchbaselabs/ansible-couchbase-exporter/releases" alt="GitHub tag (latest by date)">
    <img src="https://img.shields.io/github/v/tag/couchbaselabs/ansible-couchbase-exporter" />
  </a>

  <a href="https://github.com/couchbaselabs/ansible-couchbase-exporter/actions" alt="GitHub Workflow Status">
    <img src="https://img.shields.io/github/workflow/status/couchbaselabs/ansible-couchbase-exporter/Lint" />
  </a>

  <a href="https://github.com/couchbaselabs/ansible-couchbase-exporter/commits/main" alt="GitHub last commit">
    <img src="https://img.shields.io/github/last-commit/couchbaselabs/ansible-couchbase-exporter" />
  </a>

  <a href="https://github.com/couchbaselabs/ansible-couchbase-exporter/graphs/contributors" alt="GitHub last commit">
    <img src="https://img.shields.io/github/contributors/couchbaselabs/ansible-couchbase-exporter" />
  </a>

</p>


## Description

Deploy [CMOS Exporter](https://github.com/couchbaselabs/cmos-prometheus-exporter) for generating Prometheus metrics for Couchbase Server 6.x.  The CMOS Exporter will retrieve all of the Couchbase 6.x metrics and reformat them to match the metrics exposed by Couchbase Server 7.x for a seamless monitoring transition while upgrading.


## Requirements

-   Ansible >= 2.10 (It might work on previous versions, but we cannot guarantee it)
-   jmespath on deployer machine. If you are using Ansible from a Python virtualenv, install _jmespath_ to the same virtualenv via pip.
-   gnu-tar on Mac deployer host (`brew install gnu-tar`)


## Role Variables

All variables which can be overridden are stored in [defaults/main.yml](defaults/main.yml) file as well as in table below.  The only values necessary to change would be the `couchbase_username` and `couchbase_password`.

| **Name**           | **Default Value** | **Description**                    |
| :-------------- | :------------- | :-----------------------------------|
| `cmos_exporter_version` | `latest` | The version of the CMOS exporter to install |
| `cmos_exporter_user` | `cmos-exporter` | The name of the user to create to run the process |
| `cmos_exporter_user_group` | `cmos-exporter` | The name of the user group |
| `cmos_exporter__user_shell` | `/usr/sbin/nologin` | By default `/usr/sbin/nologin` is used to prevent the user from logging in, if you're using an existing user account this should be `/bin/bash`   |
| `cmos_exporter__user_createhome` | `false` | Whether or not to create the home directory for the user  |
| `cmos_exporter_install_dir` | `/opt/cmos-exporter/bin` | The directory for the binary to be placed in |
| `cmos_exporter_binary` | `cmos-exporter` | The name of the binary to use |
| `cmos_exporter_conf_dir` | `/etc/cmos-exporter` | The configuration directory |
| `cmos_exporter_conf_file` | `config.yml` | The name of the config file |
| `cmos_exporter_local_tmp_dir` | `/tmp/cmos-exporter` | The temp directory on the Ansible Controller to download the release to |
| `cmos_exporter_log_level` | `info` | The log level to use |
| `couchbase_host` | `localhost` | The Couchbase server address, this should really be left to localhost as that is where the exporter is installed |
| `couchbase_management_port` | `8091` | The Couchbase Management port |
| `couchbase_username` | `Administrator` | The Couchbase username |
| `couchbase_password` | `password` | The Couchbase password |
| `couchbase_ssl` | `false` | Whether or not to use ssl |
| `cmos_exporter_bind_address` | `0.0.0.0` | The address to bind to |
| `cmos_exporter_bind_port` | `9091` | The port to bind to |
| `cmos_exporter_fake_collections` | `true` | Whether or not to fake scopes/collections |


## Installation

You can install this role with the `ansible-galaxy` command, and can run it
directly from the git repository.

You should install it like this:

```
ansible-galaxy install git+https://github.com/couchbaselabs/ansible-couchbase-exporter.git
```

## Example

### Playbook

Use it in a playbook as follows:

```yaml
- hosts: all
  roles:
    - couchbaselabs.couchbase_exporter
```

## Useful Commands

### Manage the Service

It may be necessary from time to time to start, stop, restart, or get the status of the `td-agent-bit` service.

```bash
sudo systemctl start cmos-exporter
sudo systemctl status cmos-exporter
sudo systemctl restart cmos-exporter
```

### Viewing Standard Out

Since the exporter writes to stdout for logging, those messages can be viewed through `journalctl`

##### Most Recent Messages

```bash
sudo journalctl -r -u cmos-exporter
```

##### Follow Messages

```bash
sudo journalctl -f -u cmos-exporter
```

## License

This project is provided as is with no support and is licensed under Apache 2.0. See [LICENSE](/LICENSE) for more details.
