# DOCUMENTACIÓN TRABAJO UT5 (PROXY INVERSO)
#### *Por Marcos Rivero Zarco*

Voy a explicar como he hecho el trabajo dividiendolo en diferentes pasos:

## LANZAR INSTANCIA EC2 E INSTALAR PAQUETES
Lo primero que he hecho ha sido con mi cuenta (ya creada para la práctica anterior). He lanzado una nueva instancia EC2.

Después he abierto el puerto 80 para poder recibir peticiones http y que nginx las rediriga a cada uno de los docker según el subdominio al que se diriga la petición. También he instalado el paquete de nginx.

Para abrir el puerto 80 he instalado el paquete ufw ya que es un software que facilita mucho la gestión de reglas en sistemas basados en linux. Con este paquete solo usando dos comandos tendremos el puerto 80 abierto:

```bash 
sudo ufw allow 80
```

```bash 
sudo ufw enable
```

Para comprobar el estado:

```bash
sudo ufw status
```

Si todo ha salido correctamente este será el resultado:

To                         Action      From
--                         ------      ----
80                         ALLOW       Anywhere                  
80 (v6)                    ALLOW       Anywhere (v6)     

(Permite el tráfico del puerto 80 tanto para ipv4 como para ipv6).


