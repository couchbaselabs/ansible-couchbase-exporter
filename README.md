# Couchbase Exporter Ansible Role

[![Ansible Role](https://img.shields.io//ansible/role/couchbaselabs.couchbase_exporter.svg)](https://galaxy.ansible.com/couchbaselabs/couchbase_exporter)
[![Ansible Quality](https://img.shields.io/ansible/quality/couchbaselabs.couchbase_exporter.svg)](https://galaxy.ansible.com/couchbaselabs/couchbase_exporter)
[![lint workflow](https://img.shields.io/github/workflow/status/couchbaselabs/ansible-couchbase-exporter/Lint/master.svg)]
[![GitHub Downloads](https://img.shields.io/github/downloads/couchbaselabs/ansible-couchbase-exporter/total.svg)](https://github.com/couchbaselabs/ansible-couchbase-exporter/tags)
[![License](https://img.shields.io/github/license/couchbaselabs/ansible-couchbase-exporter.svg)](https://www.apache.org/licenses/LICENSE-2.0)

## Description

Deploy [Couchbase Exporter](https://github.com/couchbase/couchbase-exporter) for Prometheus using ansible.

## Requirements

-   Ansible >= 2.9 (It might work on previous versions, but we cannot guarantee it)

## Role Variables

| **Name** | **Default Value** | **Description** |
| :--- | :--- | :--- |
| couchbase_exporter_verison | HEAD | The version of the Couchbase Exporter to install.   |
| couchbase_exporter_cb_username | Administrator | The Monitoring user to use, this is stored an an environment file |
| couchbase_exporter_cb_password | password | The password to use for the Monitoring User |
| couchbase_exporter_group | couchbase-exporter | The user group to use / create |
| couchbase_exporter_user | couchbase-exporter | The user to use / create and run the process as |
| couchbase_exporter_directory | `/opt/couchbase-exporter` | The installation directory for the exporter |
| couchbase_exporter_download_directory | `/tmp/couchbase-exporter` | The directory to download the exporter source to |
| couchbase_exporter_executable | couchbase-exporter | The name of the exporter executable |
| couchbase_exporter_server_address | `0.0.0.0` | The address to host the server on, default all interfaces |
| couchbase_exporter_server_port | `9091` | The port to host the server on |
| couchbase_exporter_backoff_limit | `5` | number of retries after panicking before exiting |
| couchbase_exporter_refresh_rate | `5` | How frequently to collect per_node_bucket_stats collector in seconds |
| couchbase_exporter_log_json | `true` | if set to true, logs will be JSON formatted |
| couchbase_exporter_log_level | info | log level (debug/info/warn/error) |
| couchbase_exporter_cb_address | `localhost` | The address where Couchbase Server is running, when running locally on a node, no reason to change. |
| couchbase_exporter_environment_file | `"{{ couchbase_exporter_directory }}/.env"` | The Environment File to create and store credentials in |
| go_version | `1.17.2` | The GoVersion to install |
| couchbase_exporter_token | `""` | bearer token that allows access to /metrics |
| couchbase_exporter_certificate | `""` | certificate file for exporter in order to serve metrics over TLS |
| couchbase_exporter_key | `""` | private key file for exporter in order to serve metrics over TLS |
| couchbase_exporter_ca | `""` | PKI certificate authority file |
| couchbase_exporter_client_certificate | `""` | client certificate file to authenticate this client with couchbase-server |
| couchbase_exporter_client_key | `""` | lient private key file to authenticate this client with couchbase-server |

## Installation

You can install this role with the `ansible-galaxy` command, and can run it
directly from the git repository.

You should install it like this:

```
ansible-galaxy install couchbaselabs.couchbase_exporter
```

## Example

### Playbook

Use it in a playbook as follows:

```yaml
- hosts: all
  roles:
    - couchbaselabs.couchbase_exporter
```

## License

This project is provided as is with no support and is licensed under Apache 2.0. See [LICENSE](/LICENSE) for more details.
