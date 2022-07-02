

---

### Deepstream Samples 

---

### Install Prerequisites:

- **Build Tools**: Install `cmake`, `make`, `m4`, `wget` and `gawk` if they are not available on your system.

- **Docker Engine**:
  - Install [docker engine](https://docs.docker.com/install). Minimum version required: `17.05`. Make sure you [setup](https://docs.docker.com/install/linux/linux-postinstall) docker to run as a regular user.
  - Intall [Nvidia Docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker). 
  - Setup docker proxy as follows if you are behind a firewall:

```bash
sudo mkdir -p /etc/systemd/system/docker.service.d
printf "[Service]\nEnvironment=\"HTTPS_PROXY=$https_proxy\" \"NO_PROXY=$no_proxy\"\n" | sudo tee /etc/systemd/system/docker.service.d/proxy.conf
sudo systemctl daemon-reload
sudo systemctl restart docker
```

### Build Service:

Use the following commands to build the DeepStream sample. 

```bash
```

### Run the Service:

```bash
```

---
