#!/bin/sh

# La variable root_path determina la ubicacion del archivo backup.sh, recomendable usar path absoluto para que el script pueda ser llamado desde cualquier ubicacion
root_path=$(pwd)
database_user="root"
database_pass="root"
date_today=$(date +"%Y%m%d-%H%M")
today=$(date +"%d/%m/%Y %H:%M")

#Recuepera todas las base de datos
#Comando si estas usando mysql instalado en tu host
#databases=$(mysql -u $database_user --password=$database_pass -e 'show databases' -s --skip-column-names)

#Comando si estas usando mysql instalado en docker
#databases=$(docker exec -i mariadb mysql -u $database_user --password=$database_pass -e 'show databases' -s --skip-column-names)

# Recupera las base de datos desde una lista en el archivo databases
databases=$(cat $root_path/databases)

if [ -d "$root_path/$date_today" ]; then
    rm $root_path/$date_today -R
fi

mkdir $root_path/$date_today

for db in $databases
do
    # No considero la exportacion para las base de datos internas del mysql
    if [ $db != information_schema ] && [ $db != performance_schema ] && [ $db != mysql ]; then
        echo "Exportando base de datos: $db"
        
        #Comando si estas usando mysql instalado en tu host
        mysqldump -u $database_user --password=$database_pass $db | gzip > $root_path/$date_today/$db-$date_today.sql.gz
        
        #Comando si estas usando mysql instalado en docker
        #docker exec -i mariadb mysqldump -u $database_user --password=$database_pass $db | gzip > $root_path/$date_today/$db-$date_today.sql.gz
    fi
done 

echo " "
echo "Los archivos exportados han sido guardados en $root_path/$date_today"
echo "Backup del dia $today terminado."

