#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# install common tools
apt-get update
# apt-get upgrade -y
apt-get install -y curl apt-transport-https

# add mono(vs channel) source
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/ubuntu vs-xenial main" | tee /etc/apt/sources.list.d/mono-official-vs.list

# vscode source
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# add node 8.x source and setup
curl -sL https://deb.nodesource.com/setup_8.x > setup_8.x
chmod +x setup_8.x && ./setup_8.x && rm setup_8.x

# install our packages
apt-get install -y --no-install-recommends mono-devel msbuild code git-core nodejs
# cleanup
apt-get remove -y curl apt-transport-https
apt-get purge -y curl apt-transport-https
apt-get autoremove
rm -rf /var/lib/apt/lists/*
