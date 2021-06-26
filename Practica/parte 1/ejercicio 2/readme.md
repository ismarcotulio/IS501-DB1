@author mruizq@unah.hn
@version 0.1.0
@date 2021/06/24

Ejercicio
----
----
Haga el Modelado y diagramado ER (los dos diagramas de análisis) de las siguientes menciones, y programe un archivo DDS_DMS con la eliminación de base de datos, creación de base de datos y tablas, inserción de registros y selección de datos, según corresponda. El estudiante será el encargado de reconocer la relación que hay entre cada mención y generar entidades y relaciones intermedias cuando son necesarias, su cardinalidad, atributos, restricciones de integridad, llaves, otros



- Estudiante, Asignatura, Maestro.

    - Promedio de asignaturas que matricula un estudiante.

    - Promedio de asignaturas asignadas a un catedrático.


Analisis con lenguaje natural
----
----

**Matricula de asignatura**
  - Cada asignatura tiene 1 Maestro.
  - Cada estudiante puede Matricular muchas Asignaturas.
  - Un Maestro puede ser asignado a muchas Asignaturas.
  - Cada Asignatura puede tener muchos estudiantes


Notacion esquematica con Modelo ER
----
----

**Maestro**
  - nombre
  - telefono
  - codigo maestro
  
**Asignatura**
  - nombre
  - codigo asignatura
  - aula
  - horario
  - anio
  - periodo academico
  - **maestro**


**Estudiante**
  - nombre
  - numero de cuenta
  - numero de identidad
  - fecha de nacimiento
  
**Matricula**
  - **asignatura**
  - **estudiante**


