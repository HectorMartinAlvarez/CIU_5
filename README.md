# CIU - Práctica 5

Autor: Héctor Miguel Martín Álvarez

## Introducción

Aplicación de visualización de los datos contenidos en el fichero [SITYCLETA](https://github.com/HectorMartinAlvarez/CIU_5/blob/main/CIU_5/data/SITYCLETA-2021.csv)

## Desarrollo

El proyecto ha sido desarrollado empleando 5 ficheros: 
  - <b>CIU_5</b> </br><p>Fichero principal del proyecto desde el que se cargan los datos e imagenes, se crea toda la interfaz y se implementan todos los eventos de ratón y de teclado.</p>
  - <b>Bicycle</b> </br><p>Fichero que recoge toda la información que almacena en fichero [SITYCLETA](https://github.com/HectorMartinAlvarez/CIU_5/blob/main/CIU_5/data/SITYCLETA-2021.csv) sobre una biciclera.</p>
  - <b>station_select</b> </br><p>Fichero empleado para conocer que estación a seleccionado el usuario.</p>
  - <b>Filter</b> </br><p>Fichero donde se implementa una ventana adicional para aplicar filtros a los datos mostrados.</p>
  - <b>Help</b> </br><p>Fichero donde se implementa una ventana adicional para mostrar información sobre la aplicación y sus controles.</p>

## Características

  - Información y controles ubicados en su propia ventana, visible al clicar sobre el icono <img src="https://github.com/HectorMartinAlvarez/CIU_5/blob/main/CIU_5/data/help.jpg" alt="Help_Icon" width="50"/> 
  - Filtrado de datos por fecha y por acción(Alquier o Retorno).
  - Interacción directa con el mapa.
  - Visualización del origen y destino de la bicicleta que sea seleccionada en la lista.
  
## Controles

|Tecla|Descripción|
|:---:|:----------:|
|W|Desplazar lista de bicicletas hacia abajo|
|S|Desplazar lista de bicicletas hacia arriba|
|R|Restablecer configuración por defecto|
|Rueda del Ratón|Zoom sobre el mapa|
|Click Izquierdo|Seleccionar|
|Mantener Click Izquierdo y Arrastrar el Ratón|Mover el mapa|
|ESC|Cerrar la Aplicación|

## Herramientas
  - Processing 3.5.4
## Referencia
  - [Material de la asignatura Creando Interfaces de Usuario](https://github.com/otsedom/otsedom.github.io)
  - [Documentación de Processing](https://processing.org/reference) 
  - [Datos empleados](https://www.sagulpa.com/datos-abiertos)

![No Gif Here :(](https://github.com/HectorMartinAlvarez/CIU_5/blob/main/animation.gif)
