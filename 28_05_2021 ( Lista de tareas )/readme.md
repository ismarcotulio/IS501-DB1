@author jose.inestroza@unah.edu.hn
@version 0.1.0
@date 2021/05/28

Ejercicio
----
----

Dentro de una oficina de trabajo se desea registrar una lista de TODOS's la cual puede ser utilizada por multiples usuarios a la vez. Un usuario puede poseer una o multiples listas. Una vez que el sistema este en marcha, la alta gerencia espera saber el procentaje de tareas pendientes y completadas de cada departamento, empleado y de la gerencia total. Haga uso de ER para crear el modelo usando el SGBD indicado en clase.

Nota
----
----
Los ejercicios y problemas de las evaluaciones sumativas y formativas de la clase, generaran escenarios particulares que permiten la solucion de un problema usando los elementos aprendidos en clase. El estudiante debera obtener informacion de la definicion del problema en conjunto con la abstraccion de elementos desde la vida real.

---
## Ejecutar script sql en terminal linux

    $mysql -u admin -p < DDSDMS.sql

----

Analisis
----
----

Las entidades y sus caracteristicas se listaran a continuacion como un reforzamiento del analisis para el entendimiento del ejercicio

- Empresa
  - Tiene Gerencia
    - Tiene Departamentos
      - Tiene Empleados
        - Tiene Listas
          - Tiene Tareas

Las entidades antes descritas, estan definidas en singular y con letra capital.

- Gerencia
  - nombre

- Departamento
  - gerencia

- Empleado
  - nombre
  - numero de empleado
  - departamento

- Lista
  - nombre
  - usuario
  - tareas

- Tareas
  - nombre
  - descripcion
  - estado
  - fecha a finalizar
  - lista

