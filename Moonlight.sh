#FUNCIONES

calidades(){
clear
echo Introduzca una calidad disponible:
echo ===== OPCIONES DISPONIBLES =====
echo 720
echo 1080
echo 4k
echo ===== OPCIONES DISPONIBLES =====
read calidad
}

fps(){
clear
echo CALIDAD ELEGIDA: $calidad
echo ===== OPCIONES DISPONIBLES =====
echo 30
echo 60
echo 90
echo 120
echo 144
echo ===== OPCIONES DISPONIBLES =====
read fps
}

seguro(){
clear
echo =================
echo Has elegido:
echo CALIDAD: $calidad
echo FPS: $fps
echo =================
echo Son correctas:
echo Si [Y] o No [N]
read seguro
}

seguro=N

while [ $seguro != Y ]; do

    #CALIDADES
    calidades
    while [ "$calidad" != 720 ] && [ "$calidad" != 1080 ] && [ "$calidad" != 4k ]; do
        calidades
    done

    #FPS
    fps
    while [ "$fps" != 30 ] && [ "$fps" != 60 ] && [ "$fps" != 90 ] && [ "$fps" != 120 ] && [ "$fps" != 144 ]; do
        fps
    done

    seguro

done

moonlight stream -$calidad -fps $fps
