# disco-imagen


mkdir -p workspace/projects
cd workspace/projects
git clone https://github.com/entelecheia/disco-imagen.git

bash ./scripts/docker/build.sh



sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1