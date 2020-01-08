echo Introduzca una carpeta disponible:
read folder
echo Introduzca una extension:
read extension
echo Introduzca el nombre a buscar:
read string
find $folder -name "*.$extension" -print | grep -i $string
