#!/bin/bash
echo "Preparando Ambiente para Instalação"
#Escrevendo Repositorio
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
# aptkey
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
echo "Atualizanco Repositorios"
sudo apt-get update 
echo "Iniciando instalação  do PostgreSQL 9.5"
yes Y | sudo apt-get install postgresql-9.5
echo "Instalação  Feita com Sucesso"

