#!/bin/bash
PPEXISTS="/opt/puppetlabs/bin"
if [ ! -d "$PPEXISTS" ]
then
  locale-gen en_US.UTF-8
  update-locale
  dpkg -i /tmp/environments/all/apps/puppetlabs-release-pc1-xenial.deb
  apt-get update
  apt-get install -y puppet-agent=1.7.1-1xenial
  
else
  echo "puppet instalado djow!"
fi
export PATH=/opt/puppetlabs/bin:$PATH

