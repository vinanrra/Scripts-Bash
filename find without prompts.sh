echo Buscando archivos en la carpeta $0 que contengan $1 y tengan extension $2
find $0 -name "*.$2" -print | grep -i $1
