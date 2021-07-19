@author mruizq@unah.hn
@version 0.1.0
@date 2021/07/18

analisys antes de codear
----
----

- Primero, deberemos crear una estructura de tablas de base de datos utilizando sentencias de la API indexedDB.
- Luego, siguiendo la logica de la API deberemos utilizar sentencias que nos permitan realizar acciones de manipulacion de datos.
- Despues, agregamos la correspondiente funcionalidad a cada componente de la vista HTML haciendo uso de sentencias de la API.
- finalmente, ante cualquier cambio se actualizan las vistas y se muestran los datos.

Para mostrar datos
-----
- Asumimos que haciendo uso de sentencias de indexedDB ya se creo una estructura de tablas de base de datos y se utilizaron metodos para la manipulacion de datos.
- Asumimos que en las tablas de base de datos ya existe informacion util.
- Haciendo uso de sentencias de indexedDB deberemos obtener los datos segun las llaves e insertarlos en una matrix de javascript.
- luego apartir de una clase tabla recibimos como parametro una matrix y la convertimos a una tabla HTML dentro del DOM

