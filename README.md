# disco-imagen


mkdir -p workspace/projects
cd workspace/projects
git clone https://github.com/entelecheia/disco-imagen.git

bash ./scripts/docker/build.sh


```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
```

## fix docker dns problem

1. Log into Ubuntu as a user with sudo privileges.

2. Open the /etc/default/docker file for editing :

    $ sudo nano /etc/default/docker

3. Add the following setting for Docker.

    DOCKER_OPTS="--dns 8.8.8.8"

4. Save and close the file.

5. Restart the Docker daemon :

    $ sudo systemctl restart docker
