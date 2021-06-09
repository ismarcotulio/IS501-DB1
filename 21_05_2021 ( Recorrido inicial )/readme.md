@author jose.inestroza@unah.edu.hn
@version 0.1.0
@date 2021/05/20

----
----

Termux
----

- Descargar la aplicacion

    `$pkg install mariadb openssh nano neofetch `

Debian 10/ Ubuntu
----

- Descargar el paquete e instalarlo mediante el gestor de paquetes

    `sudo apt insta;; mysql-server`

    `sudo apt install default-mysql-server`

mysql
----

- Crear usuario
  
    `CREATE USER 'admin'@'%' IDENTIFIED by 'admin';`

    `GRANT ALL PRIRIVILEGES ON *.* TO 'admin'@'%'`;