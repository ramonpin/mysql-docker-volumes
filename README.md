Pruebas MySQL + Docker + Volumes
================================
Varias pruebas de uso de Docker con volúmenes locales.

Para ejecutar las diferentes pruebas:

   $> make

Lista las diferentes tareas:

  - mysql             : Arranca un contenedor con la última versión de MySQL.
  - mysql-shell       : Abre un mysql-shell en el contenedor anterior.
  - mysql-cp          : Copia la carpeta de datos del contenedor a local.
  - mysql-stop        : Para el contenedor.
  - mysql-vol         : Arranca otro MySQL utilizando la carpeta local como volumen de datos.
  - mysql-vol-shell   : Abre un mysql-shell en el servidor anterior.
  - mysql-vol-destroy : Destruye el contenedor que usa el volumen.

