#Usage ./find_without_prompts.sh /path/to/folder string extension
##Example ./find_without_prompts.sh /home/vinanrra/test HelloWorld html
echo Buscando archivos en la carpeta $0 con extension $1 y contengan $2
find $0 -name "*.$1" -print | grep -i $2
