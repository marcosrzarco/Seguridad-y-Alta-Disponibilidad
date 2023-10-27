apt-get update
apt-get install -y sshpass
echo "0 * / 1 * * * vagrant tar -cvf clientes.tar /vagrant/clientes" >> /etc/crontab
mkdir -p /home/vagrant/.ssh
chown vagrant:vagrant /home/vagrant/.ssh
ssh-keyscan -H 192.168.33.16 >> /home/vagrant/.ssh/known_hosts
echo "0 * / 1 * * * vagrant sshpass -p 'vagrant' rsync -avz -e ssh /home/vagrant/clientes.tar vagrant@192.168.33.16:/vagrant/bakcups" >> /etc/crontab
