#Usage ./find_without_prompts.sh /path/to/folder string extension
##Example ./find_without_prompts.sh /home/vinanrra/test HelloWorld html
echo Buscando archivos en la carpeta $1 con extension $2 y contengan $3
find $1 -name "*.$2" -print | grep -i $3
