mkdir -p /vagrant/clientes
useradd -m -s /bin/bash antonio
useradd -m -s /bin/bash manolo
chown antonio:manolo /vagrant/clientes
chmod 750 /vagrant/clientes