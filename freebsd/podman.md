
# pull debian
docker pull --arch amd64 --os linux debian:testing-slim


# pf
# /etc/pf.conf - Podman bridge NAT config for FreeBSD

# Define interfaces
ext_if="wlan0"          # change to your actual internet interface
pod_if="cni-podman0"    # Podman bridge created by CNI

# NAT: let containers go out via the host
nat on $ext_if from $pod_if:network to any -> ($ext_if)

# Allow all traffic on loopback and Podman bridge
set skip on lo
pass quick on lo
pass quick on $pod_if

# Allow outbound internet traffic
pass out on $ext_if inet from ($ext_if) to any keep state


# run
doas pfctl -f /etc/pf.conf
doas pfctl -e

# run debian
echo 'APT::Cache-Start "100000000";' > /etc/apt/apt.conf.d/00aptitude

# run in podman devuan container
mkdir -p /etc/apt/apt.conf.d
echo 'APT::Cache-Start "100000000";' > /etc/apt/apt.conf.d/70cache
rm -rf /var/lib/apt/lists/*
apt clean
apt update