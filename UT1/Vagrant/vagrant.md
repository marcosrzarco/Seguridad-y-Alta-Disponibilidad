# Explicación del trabajo de Vagrant
*Por Marcos Rivero Zarco*

## 1. Añadir una segunda interfaz de red
```vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "techchad2022/ubuntu2204"

  config.vm.network "private_network", type: "dhcp"
  config.vm.network "private_network", type: "dhcp"
end
```
En este primer archivo estoy configurando dos interfaces de red, cuando hacia el up al principio me daba el siguiente fallo:

```
A host only network interface you're attempting to configure via DHCP
already has a conflicting host only adapter with DHCP enabled. The
DHCP on this adapter is incompatible with the DHCP settings. Two
host only network interfaces are not allowed to overlap, and each
host only network interface can have only one DHCP server. Please
reconfigure your host only network or remove the virtual machine
using the other host only network.
```

Esto es porque ya tenia una interfaz de red en virtual box con dhcp así que la he borrado en virtual box y me ha creado las dos interfaces.

En **config.vm.box** le estamos diciendo que máquina virtual queremos, que en este caso es un Ubuntu 2204 del usuario techchad2022. Se descargará la máquina así que tenemos que tener conexión a internet.

Con **config.vm.network** lo que hacemos es configurar una nueva interafaz en virtual box, las declaro como privadas y de tipo dhcp (que es el que usa por defecto virtual box).

## 2. Ponerla en modo bridge
```vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "techchad2022/ubuntu2204"

  config.vm.network "private_network", type: "dhcp"
  config.vm.network "public_network", bridge: "Adaptador de LAN inalámbrica Wi-Fi" ##Este es el nombre específico de mi interfaz de red wifi.
end
```
En este caso he hecho lo mismo solo que esta vez en vez de dhcp es modo bridge, ahora hay que poner dos comillas y el nombre de la interfaz de red wifi que hay en el equipo, en mi caso el nombre es el que he puesto pero el vagrantfile no funciona en otro equipo que no tenga una interfaz con ese nombre exacto.

## 3. Añadir 2 mv en un sólo fichero
```vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "techchad2022/ubuntu2204"

  config.vm.define "vm1" do |vm1|
    vm1.vm.network "private_network", type: "dhcp"
  end

  config.vm.define "vm2" do |vm2|
    vm2.vm.network "private_network", type: "dhcp"
  end
end
```
**config.vm.define** es un comando que define las máquinas virtuales. Después las configuraciones que hacemos en una máquina tienen que tener el prefijo de su nombre por ejemplo a la primera la hemos llamado vm1 por lo que sus configuraciones tienen que empezar con vm1. La única configuración que tiene es la de una interfaz de red privada dhcp. 

## 4. Conectar esas 2 mv en una red interna
```vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "techchad2022/ubuntu2204"

  config.vm.network "private_network", type: "static", ip: "192.168.50.1", virtualbox__intnet: "redprivadavm1vm2"

  config.vm.define "vm1" do |vm1|
    vm1.vm.network "private_network", type: "static", ip: "192.168.50.2"
  end

  config.vm.define "vm2" do |vm2|
    vm2.vm.network "private_network", type: "static", ip: "192.168.50.3"
  end
end
```
En este caso he configurado primero una red privada con el comando **config.vm.network** y la he hecho estática para configurar yo las ips de manera manual. Le he dado la ip 192.168.50.1 y la he llamado "redprivadavm1vm2".

Después, igual que en el caso anterior, he creado dos máquinas virtuales pero esta vez he configurado las ips de manera estática para que coincidan con el rango de ips para equipos de la red que he definido antes.


## 5. Limitar el uso de ram a 512MB
```vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "techchad2022/ubuntu2204"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 512
  end
end
```
Para hacer este vagrantfile he usado el comando **config.vm.provider** para entrar en la configuración específica de esta máquina y he utilizado **vb.memory** para limitar la memoria a 512 (no especifico que son MB porque es la magnitud que utiliza por defecto).


## 6. Limitar el uso de cores a 1
```vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "techchad2022/ubuntu2204"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 1
  end
end
```
Es el mismo proceso pero en lugar de limitar la memoria con **vm.memory** limito los núcleos con **vm.cpus**.

## 7. Instalar el paquete git en una de las mv
```vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "techchad2022/ubuntu2204"

  config.vm.provision "shell", inline: "sudo apt-get update"
  config.vm.provision "shell", inline: "sudo apt-get install -y git"
end
```
Para instalar un paquete he utilizado el comando **config.vm.provision** para ejecutar un aprovisamiento (un aprovisionamiento consiste en guardar los comandos que la máquina deberá ejecutar cuando se ejecute) con los comandos necesarios para instalar git.





