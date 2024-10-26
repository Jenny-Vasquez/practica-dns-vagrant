# Práctica DNS con Vagrant

Este proyecto tiene como objetivo desplegar una infraestructura de servidores utilizando **Vagrant** para configurar y probar un entorno de **DNS** . 
Esta práctica te guiará en la creación y configuración de un servidor DNS desde cero utilizando herramientas de virtualización y administración de máquinas virtuales.

## Objetivos
+ Crear y configurar un entorno virtualizado para la práctica del DNS utilizando Vagrant.
+ Instalar y configurar un servidor DNS (como Bind9).
+ Configurar la resolución de nombres tanto en la red interna como en internet.
Probar la resolución de nombres mediante herramientas como dig o nslookup.
## Requisitos
+ Vagrant instalado.
+ VirtualBox u otro proveedor compatible con Vagrant.
# INICIO PRÁCTICA
Este repositorio documenta la práctica de despliegue de aplicaciones web con configuración de DNS.

Se inició el archivo `Vagrantfile` con el comando `vagrant init`.

### Configuración de Máquinas Virtuales

Las máquinas virtuales (VM) se configuraron siguiendo las indicaciones del ejercicio 2, utilizando contenedores de Vagrant con `bullseye64`. A cada máquina se le asignaron un nombre de host, una IP fija y un script de provisión para actualizar la VM e instalar las herramientas necesarias para la configuración del DNS.

### Configuración de la Máquina "Tierra"

En la máquina "Tierra," se configuró el archivo `named.conf.options` con los siguientes parámetros:

- Deshabilitar escucha en direcciones IPv6.
- Permitir consultas desde la red interna.
- Habilitar consultas recursivas.
- Activar DNSSEC.
- Configurar el reenvío de consultas hacia `208.67.222.222`.

### Configuración de named.conf.local en Tierra

El archivo `named.conf.local` en "Tierra" se modificó para asignar autoridad sobre las zonas directa e inversa.

### Configuración de Zonas DNS

Se crearon y configuraron los archivos `db.sistema.test` y `db.192`, definiendo detalles específicos de las zonas y los puertos requeridos para las conexiones DNS.

### Configuración de la Máquina "Venus"

Luego de finalizar la configuración de "Tierra," se configuró el DNS en la máquina "Venus." El archivo `named.conf.local` en "Venus" fue ajustado para incluir la configuración de las zonas directa e inversa, permitiendo que la máquina participe en la resolución DNS según las indicaciones.

### Automatización de la Configuración

Para facilitar la replicación del entorno, se ajustó el proceso de provisión de cada VM. Esto incluyó la copia automática de archivos a los directorios correspondientes mediante líneas adicionales en los scripts de provisión, garantizando la consistencia del sistema en distintos entornos.

### Verificación de Configuración

Finalmente, se realizaron comprobaciones para asegurar la correcta configuración del DNS, siguiendo los pasos de verificación indicados en la práctica.

Imágenes de referencia:

- **Imagen 1:** Configuración de `Vagrantfile`.
   ![Configuración de named.conf.local en Tierra] (./imagenes/imagen1.png)
- **Imagen 2:** Configuración de `named.conf.options` en "Tierra".
- **Imagen 3:** Configuración de `named.conf.local` en "Tierra".
- **Imagen 4:** Archivo `db.sistema.test`.
- **Imagen 5:** Archivo `db.192`.
- **Imagen 6:** Configuración de `named.conf.local` en "Venus".
- **Imagen 7:** Test con test.sh.

