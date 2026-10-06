#!/bin/bash

echo "===INICIANDO DIAGNÓSTICO Y CONTENCIÓN (NODO FEDORA)==="
whoami
df -h
sudo dnf upgrade
sudo dnf install htop curl 
find / -name brecha_seguridad.txt 2>/dev/null
systemctl status nginx
systemctl restart nginx
echo "===DIAGNÓSTICO Y CONTENCIÓN FINALIZADA==="

echo "===FORENSE Y BLINDAJE (NODO ARCH LINUX)==="
sudo pacman -Syu
sudo pacman -S nginx net-tools
cd /var/log
grep "FAILED" auth.log | wc -l > intrusos_detectados.txt
chmod 600 intrusos_detectados.txt
ls -l intrusos_detectados.txt
echo "===SISTEMA BLINDADO Y OPERATIVO==="
