# README

Prueba Routing
  
#### Supuestos del contexto: ####
* Validaciones para asignar un vehículo a una ruta:
  1. Que la capacidad de carga(Peso) no exceda la capacidad de carga(peso) del vehículo
  2. Que el tipo de carga corresponda con el tipo de carga disponible para el vehículo

* Validaciones para asignar un conductor:
  1. En caso de tener preferencias de comunas, que las comunas por donde pasa la ruta estén dentro de las preferencias de comunas del conductor
  2. Que el conductor este disponible para atender la ruta en el rango de tiempo establecido

#### Data de prueba: ####
* Al crear la base de datos se crean:
  * 10 comunas
  * 2 tipos de carga (general y refrigerada) - Pueden sen agregados mas tipos de carga
  * 10 conductores sin vehículo propio
  * 10 vehículos sin conductor asignado
  * 10 vehículos con conductor
  * 30 rutas con rango de horas de inicio y fin de 1 a 5 horas. estas horas están limitadas desde el inicio al fin del día actual
  * A cada conductor se le asignaron comunas de preferencia de forma aleatoria, existe la posibilidad de que un conductor no tenga comunas de preferencia

#### Ejecución: ####
  - Al ejecutar esta aplicación puede visitar la ruta http://localhost:3000/ y ver el listado de rutas sin asignación de vehículo ni conductor.
  - Tendrá dos botones a disposición:

    1. "Asignar vehículos y conductores" - Ejecuta un algoritmo para asignar rutas el cual actualizara el listado, mostrando las rutas con su asignación de vehículo y conductor
    2. "Desasignar rutas" restablece el listado a su estado original

#### Información sobre la aplicación: ####

* Ruby version

  ruby 2.5.0p0

* Rails version

  Rails 5.0.7.2

* System dependencies

  postgresql

* Configuration
```
bundle install
```

* Database creation
```
  rake db:create
  rake db:migrate
  rake db:seed
```
* Run
```
  rails s
```
