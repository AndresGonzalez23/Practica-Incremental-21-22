%%Practica Incremental Curso 21-22
%%Andrés González Varela
%%Hito 2

%%Primero debemos cargar las dos imagenes, tanto la imagen completa del
%%asteroide como la imagen de referencia que debemos buscar. Y tambien
%%aprovecharemos para calcular los descriptores HOG de ambas imagenes.

imagenAsteroide = imread('asteroideHito2.jpg');
imagenReferencia = imread('referenciaHito2.jpg');
HOGReferencia = HOG(imagenReferencia);

%%1. Ahora debemos crear una imagen temporal y sustituiremos una parte de la
%%imagen por la imagen de referencia, en este caso la esquina superior
%%izquierda, y mostramos por pantalla.

imagenTemporalAsteroide = imagenAsteroide;
imagenTemporalAsteroide(1:200,1:200) = imagenReferencia;
hold on
imshow(imagenTemporalAsteroide)
title('Imagen Temporal')
hold off

%%Ahora debemos crear el mosaico de la imagen para ir calculando los
%%descriptores HOG y compararlos con la imagen de referencia para saber
%%cual es la zona indicada, o al menos la mas parecida. En este caso al
%%tener que dividir la imagen en trozos de 200x200 queda una cuadricula de
%%5x6 (5 columnas 6 filas). 
%%Para que las divisiones sean de 200x200 lo que haremos en cada iteración
%%será ir añadiendo 199 (pixeles) para que coja bien las dimensiones de la
%%foto. 

i = 0;
distanciaZonaSimilar = 1;
xSimilar = 0;
ySimilar = 0;
for y = 1:200:1200
    for x = 1:200:1000
    cuadriculaActual = imagenAsteroide(y:y+199,x:x+199);
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
    end
end

%%Ahora enseñaremos por pantalla la zona más similar (Figure 2) y la imagen
%%de referencia (Figure 3)

f2 = figure;
hold on
imshow(imagenReferencia)
title('Imagen de Referencia')
hold off

f3 = figure;
hold on
imshow(imagenSimilar)
title('Zona más Parecida al dividir en secciones de 200x200')
xlabel('Zona de la cuadricula [5 2]')
disp(distanciaZonaSimilar)
hold off

%%Al dividir la imagen del asteroide en una cuadricula de 5x6 la zona más
%%parecida se encontraria en la seccion [5 2] (fila 5 columna 2).


