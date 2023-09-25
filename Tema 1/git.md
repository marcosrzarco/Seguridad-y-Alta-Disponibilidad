# Explicación del trabajo de GIT
*Por Marcos Rivero Zarco*

**Crear repostitorio local:**

Lo primero que hay que hacer es crear una nueva carpeta en el escritorio y lanzar git bash desde esa carpeta o navegar hasta ese directorio usando el comando cd.

Ahí iniciaremos el repositorio con un git init. Una vez iniciado configuramos nuestro nombre y email con los comandos git config user.name | user.email.

Antes de hacer nada tenemos que crear una cuenta en github para linkearla con nuestro repositorio local y así poder trabajar con repositorios remotos. Para ello solo tenemos que utilizar el siguiente comando: 


~~~
git remote add nombre(suele ser origin) <link del repositorio>
~~~

Ahora ya solo queda crear los archivos que queremos subir a nuestro repositorio con touch o con nano y en caso de que sean directorios con mkdir.

En mi caso yo he creado un readme.md, un .gitignore que almacena los archivos que queremos que git ignore y no tenga permisos para subir que va a ser credenciales.env y una captura con un git clone. 

Una vez creas un archivo (si quieres subirlos uno a uno) tienes que hacer un git add . (añadir todo lo que no esté añadido) o git "nombre del archivo", después hay que hacer el commit al que es recomendable ponerle un comentario (-m).

Por último voy a explicar como generar una clave público privada y usarla como método de inicio de sesión en github.

Para empezar debemos abrir la interfaz gráfica de git (git GUI):

[gitGUI](https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.geeksforgeeks.org%2Fworking-on-git-for-gui%2F&psig=AOvVaw2LVXrrCfPEBRcb_FSwLHxc&ust=1695751408929000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOC4tLSsxoEDFQAAAAAdAAAAABAE)

En help elegiremos la opción de mostrar ssh key. Ahora vamos a generar la clave con el botón generate key. Esta clave debemos copiarla y meternos en github.

En github dentro de la configuración de nuestra cuenta en el apartado de SSH key le damos a nueva clave ssh y le damos un nombre. Por último pegamos la clave que hemos generado anteriormente y ya podriamos iniciar sesión en github sin necesidad de usar nuestro usuario y contraseña (solo con el equipo con el que hemos seguido estos pasos).
