# operacion-rescate-sysadmin
Script de Bash para respuesta a incidentes, forense y blindaje en Fedora y Arch Linux
Este script nos facilita el Diagnóstico y Contención (Nodo Fedora):
Nos muestra la identidad del usuario actual, es decir si es un usuario normal o con permisos root. (whoami)
El espacio disponible en los discos duros en formato entendible y amigable para facilitar nuestro uso, es decir para el uso y entendimiento humano. (df -h).
Con privilegios de administrador se actualiza el sistema operativo completo e instala de golpe las herramientas que se van a necesitar, y n este caso práctico de ejemplo son htop⁠ y ⁠curl. (sudo apt upgrade ; sudo apt install htop curl).
Se busca de forma profunda en todo el disco duro un archivo oculto llamado ⁠brecha_seguridad.txt o el archivo a buscar dependiendo del contexto, mandando obligatoriamente todos los mensajes de permisos denegados a /dev/null por medio del protocolo Stderr [2] hacia  el directorio ya antes mencionado /dev/null. (find / -name brecha_seguridad.txt 2>/dev/null)
Revisa el estatus del servidor web ⁠nginx⁠ o el servidor en cuestión a revisar y fuerza un reinicio limpio del servicio. (systemctl status nginx ; systemctl restart nginx).
Fase 2: Forense y Blindaje (Nodo Arch Linux)
Al tener dos nodos de diferentes distros de Linux se procede a hacer el de Arch:
Actualiza todo el sistema operativo de Arch con privilegios de administrador de un solo comando, utilizando el comando maestro de bandera combinada. (sudo pacman -Syu).
Instala el servidor ⁠nginx⁠ o el servidor a emplear, dependiendo el caso y también instala la utilidad de red ⁠net-tools⁠. (sudo pacman -S nginx net-tools
Posteriormente se navega automáticamente a la carpeta de registros del sistema (⁠/var/log⁠). (cd /var/log).
Cuenta exactamente cuántas líneas contienen la palabra ⁠FAILED⁠ dentro del fichero de auditoría ⁠auth.log⁠ o del fichero en cuestión a hacer una búsqueda interna, y nos ayuda a guardar ese número exacto de líneas dentro de un fichero nuevo llamado ⁠intrusos_detectados.txt⁠ o como vayan a nombrar al nuevo fichero con el número exacto de líneas dentro del fichero. (grep "FAILED" auth.log | wc -l > intrusos_detectados.txt)
Se aplica el permiso octal más estricto posible (solo lectura y escritura para el dueño, prohibido para todo lo demás) al archivo ⁠intrusos_detectados.txt⁠, y se confirma con un listado largo que el candado quedó puesto. (chmod 600 intrusos_detectados.txt ; ls -l).
Imprime un mensaje final dentro del script que diga textualmente: "SISTEMA BLINDADO Y OPERATIVO".
