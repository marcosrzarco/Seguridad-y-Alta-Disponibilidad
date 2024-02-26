# DOCUMENTACIÓN TRABAJO UT6 (Control básico de un servicio con kubernetes)
#### *Por Marcos Rivero Zarco*

Primero he descargado con curl el ejecutable

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

Después instalamos 
``` bash
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
Elegimos un driver para kubernetes, yo he escogido docker.

Después de instalar hacemos el minikube start y eliges el driver que quieras, yo no elijo nada porque por defecto utiliza docker.

```bash
minikube start
```

Para poder continuar hay que poder usar el comando kubectl que se instala ejecutando los siguientes comandos:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

```bash
 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```

Una vez podemos utilizar el comando kubectl para crear un deployment con un servicio primero tenemos que hacer lo siguiente:

```bash
kubectl get po -A
```

Ahora sí vamos a hacer un deployment con un servicio de ejemplo que proporciona la documentación oficial llamado hello-minikube:

```bash
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0


kubectl expose deployment hello-minikube --type=NodePort --port=8080
```

Una vez habiendo hecho el deploy y expuesto el puerto por donde queremos acceder a el podemos abrir el navegador e ir a https://localhost:8080

O podemos ejecutar el siguiente comando:

```bash
minikube service hello-minikube
```

Ahora por más que matemos procesos estos se iniciarán de nuevo automáticamente manteniendo el servicio activo incluso mientras nos echamos la siesta :).