#Usage ./find_without_prompts.sh /path/to/folder string extension
##Example ./find_without_prompts.sh /home/vinanrra/test HelloWorld html
echo Buscando archivos en la carpeta $0 que contengan $1 y tengan extension $2
find $0 -name "*.$2" -print | grep -i $1
