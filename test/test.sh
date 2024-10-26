#!/bin/bash -x
#
# USAGE: ./test.sh <nameserver-ip>
#

# Salir si algún comando falla
#!/bin/bash -x
# Salir si algún comando falla
set -euo pipefail

# Definir el nameserver
nameserver=$1

# Función para resolver nombres DNS
resolver() {
    echo "Resolviendo $1..."
    dig @"$nameserver" +short "$1"
}

# Consultas DNS
resolver mercurio.sistema.test
resolver venus.sistema.test
resolver tierra.sistema.test
resolver marte.sistema.test

resolver ns1.sistema.test
resolver ns2.sistema.test

# Consultas para tipo MX y NS, pasando correctamente el tipo
echo "Resolviendo sistema.test mx..."
dig @"$nameserver" +short -t mx sistema.test

echo "Resolviendo sistema.test ns..."
dig @"$nameserver" +short -t ns sistema.test

# Consultas inversas
resolver -x 192.168.57.101
resolver -x 192.168.57.102
resolver -x 192.168.57.103
resolver -x 192.168.57.104
