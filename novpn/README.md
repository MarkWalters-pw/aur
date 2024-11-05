# novpn

**novpn** is a command-line tool designed to route traffic through a specific network device using Linux network namespaces. It provides a simple way to manage network isolation for applications and services.

## Quick start

This tool was initially created to launch Steam without wireguard vpn to reduce ping in games, while other programs will still run with VPN. 

However `novpn` is not limited by steam, or wireguard. You can use it to launch any programs on any network devices.

```bash

# Assuming you have VPN (like wireguard) enabled
$ curl api.ipify.org
1.2.3.4  # <-- your vpn IP
$ novpn curl api.ipify.org
4.3.2.1  # <-- your true home IP

```

## Features

- Control traffic routing via specified network devices.
- Automatic setup of network namespaces.

## Installation

### Via AUR
```
$ yay -S novpn
```

### Manually
Download package from releases page

### Package it yourself
clone the repository, build and install the package:
   ```bash
   git clone https://github.com/USSURATONCACHI/novpn
   cd novpn
   makepkg -si
   ```

## Usage

To use the tool, invoke the `novpn` command followed by the desired command you want to run within the specified namespace:

```bash
$ novpn <command>
```

### Additional usage options
Create default configuration for `novpn`:
```bash
$ sudo novpn_ns configure_default
```

### Example

```bash
$ novpn curl api.ipify.org
```

## Configuration

Configuration is managed through the `/etc/novpn` file, which defines the following parameters:

(Following two are set up on install automatically)
- `DEV`: The network device to route traffic through (e.g., `enp5s0` in my case).
- `GATEWAY`: The gateway IP address for the device (`192.168.0.1` in my case).

(You can ignore following two)
- `NS`: The name of the network namespace (you can ignore that, default is `novpn_ns`).
- `SUBNET`: The subnet mask for the namespace (you can ignore that, default is `192.168.80.0/30`).

An example configuration might look like this:

```bash
DEV     enp5s0
GATEWAY 192.168.0.1
NS      novpn_ns
SUBNET  192.168.80.0/30
```

## Service Management

By default, systemd is used to manage network state (`systemctl enable/start/stop/disable novpn`).
You can also manually start and stop it with `sudo novpn_ns up` and `sudo novpn_ns down` 

## Dependencies

- `bash`
- `firejail`
- `iproute2`
- `iptables`
- `grep`
- `gawk`
- `coreutils`
- `systemd`
