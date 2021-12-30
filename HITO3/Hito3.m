%%Practica Incremental Curso 21-22
%%Andrés González Varela
%%Hito 3

%%En este último apartado se debe hacer un algoritmo de ventana deslizante
%%que encuentre la zona más similar ya que puede ser que el mosaico no
%%secciones correctamente la zona similar. Primero cargamos las imagenes
%%con la función imread.

imagenAsteroide = imread('asteroideHito3.jpg');
imagenReferencia = imread('referenciaHito3.jpg');
HOGReferencia = HOG(imagenReferencia);

%%Ahora definiremos el algoritmos. Creamos las variables con las que
%%definiremos los saltos en las variables saltoX y saltoY. Si modificamos
%%estos valores debemos recalcular las condiciones de salida del bucle ya
%%que los los aumentos iterativos serian diferentes.

saltoX = 100;
saltoY = 120;
i = 0;
pararAlgoritmoY = 1;
distanciaZonaSimilar = 1;
xSimilar = 0;
ySimilar = 0;

    for y = 1:saltoY:2500
        pararAlgoritmoX = 1;
            for x = 1:saltoX:3000
            cuadriculaActual = imagenAsteroide(y:y+499,x:x+499);
            HogSeccion = HOG(cuadriculaActual);
            distanciaReferenciaActual = CalcularDistancia(HOGReferencia,HogSeccion);
            
            %%Tras la llamada al metodo de CalcularDistancia ahora debemos ir
            %%almacenando de manera iterativa la distancia, la imagen de la zona y
            %%los pixeles de la imagen del asteroide en la cual se encuentra. 
    
                if distanciaReferenciaActual < distanciaZonaSimilar
                    distanciaZonaSimilar = distanciaReferenciaActual;
                    imagenSimilar = cuadriculaActual;
                    xSimilar = x;
                    ySimilar = y;
                end
                pararAlgoritmoX = pararAlgoritmoX + 100;
                
                %%Al final de cada movimiento de la ventana en el eje
                %%horizontal comprobaremos que en la siguiente ejecución la
                %%ventana no se salga de la imagen. En caso de salirse la
                %%ventana saldriamos del bucle para movernos una posicion
                %%en el eje vertical. Esto ocurrirá cuando pararAlgoritmoY sea
                %%2601, por que si la ventana cogiese las dimensiones 
                %%[1:120 2601:3100] horizontalmente se saldria de la imagen
                %%por lo que nos saltaria un error y el programa no se
                %%ejecutaria.
                
                if pararAlgoritmoX == 2601
                    break
                end
            end
        pararAlgoritmoY = pararAlgoritmoY + 120;
        
        %%Igual que antes, pero esta vez en el eje vertical, cada vez
        %%que vayamos a movernos en este debemos comprobar que el siguiente
        %%movimiento no se salga de los límites de la foto, en caso de
        %%hacerlo el algoritmo terminaria directamente y se terminaria la
        %%ejecución del programa. Esto ocurrirá cuando pararAlgoritmoY sea
        %%2041, por que si la ventana cogiese las dimensiones 
        %%[2041:2540 1:100] verticalmente se saldria de la imagen por lo
        %%que nos saltaria error y el programa no se ejecutaria.
        
        if pararAlgoritmoY == 2041
            break
        end
    end

%%A continuación enseñamos tanto la imagen de referencia (Figure 2) y la
%%zona mas parecida (Figure 3) y tambien la distancia (por terminal)
    
f2 = figure;
hold on
imshow(imagenReferencia)
title('Imagen de Referencia')
hold off

f3 = figure;
hold on
imshow(imagenSimilar)
title('Zona más Parecida')
disp(distanciaZonaSimilar)
hold off