# MySQL-backup
Script sh de linux para realizar un backup de base de datos de MySQL.

## Modo de uso
Para usar este script solo tienes que abrir el archivo backup.sh y configurar las variables root_path, database_user y database_pass. Al ejecutarlo se creara una carpeta y dentro se guardara las base de datos divididas en un archivo por base de datos y comprimidos en gz.

## Ejecucion automatica
Puedes asociar este script a un cron para que se ejecute con la periocidad que desea.

## Carga de las base de datos
Hay dos comandos para recuperar las base de datos. El primero recupera todas las base de datos del mysql y el segundo carga los nombres de base de datos del archivo databases (Base de datos por linea).

## Usando Docker
Adicional esta comentado como hacer el mismo proceso usando docker.
