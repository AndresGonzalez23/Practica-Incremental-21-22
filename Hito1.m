%%Practica Incremental Curso 21-22
%%Andrés González Varela

%% 1. Cargamos las imagen de referencia y las que usaremos como comparación
%% Para esto usaremos la función imread().

imagenReferencia = imread('referenciaHito1.jpg');
comparativa1 = imread('imagen1Hito1.jpg');
comparativa2 = imread('imagen2Hito1.jpg');
comparativa3 = imread('imagen3Hito1.jpg');
comparativa4 = imread('imagen4Hito1.jpg');

%% Ahora una vez cargadas todas las imagenes se nos pide que las enseñemos
%% en una misma figura usando la función imshow(). 

subplot(3,1,1),imshow(imagenReferencia),title('Imagen de referencia')
subplot(3,2,3),imshow(comparativa1),title('Imagen 1')
subplot(3,2,4),imshow(comparativa2),title('Imagen 2')
subplot(3,2,5),imshow(comparativa3),title('Imagen 3')
subplot(3,2,6),imshow(comparativa4),title('Imagen 4')

%% Ahora debemos calcular los descriptores HOG de las imagenes mostradas 
%% previamente. Para esto usaremos la funcion HOG que se nos dá.

HogReferencia = HOG(imagenReferencia);
Hog1= HOG(comparativa1);
Hog2= HOG(comparativa2);
Hog3= HOG(comparativa3);
Hog4= HOG(comparativa4);

%%Una vez calculados los representaremos graficamente con un plot, podria
%% hacerse tambien con un histograma pero en nuestro caso lo haremos con plot
f2 = figure;
hold on
plot(HogReferencia,'r')
plot(Hog1,'b')
plot(Hog2,'k')
plot(Hog3,'g')
plot(Hog4,'yellow')
title('Comparativa de los descriptores HOG')
hold off

%%En este caso los descriptores HOG de la imagen de referencia son
%%representados por la linea roja. Los descriptores de las imagenes de
%%comparacion son las lineas azul, negra, verde y amarilla respectivamente.
%%A simple vista no se puede decir que imagenes son más parecidas por que
%%pero la linea verde en este caso es la que más o menos mas cerca esta de
%%la roja en muchas ocasiones

%%Ahora debemos implementar la función de la similitud del coseno para
%%lo cual debemos realizar el producto escalar entre los dos vectores HOG
%%de las imagenes que querramos comparar. Para ello usaremos una funcion
%%que llamaremos calcular distancia.

distanciaReferenciaConImagen1 = CalcularDistancia(HogReferencia,Hog1);
distanciaReferenciaConImagen2 = CalcularDistancia(HogReferencia,Hog2);
distanciaReferenciaConImagen3 = CalcularDistancia(HogReferencia,Hog3);
distanciaReferenciaConImagen4 = CalcularDistancia(HogReferencia,Hog4);

%%Ahora veremos cual de las distancias es menor, para eso las introducimos
%%en un array, despues, en un for recorremos ese array comparando cada
%%distancia con la anterior hasta dar con la menor de todas, tambien
%%almacenaremos la posición de la que sea menor para mas tarde saber cual
%%es la imagen mas parecida

menorDistancia = 1;
numeroImagen = 0;
distancias = [distanciaReferenciaConImagen1, distanciaReferenciaConImagen2, distanciaReferenciaConImagen3, distanciaReferenciaConImagen4];

for i = 1:4
    if menorDistancia > distancias(i)
        menorDistancia = distancias(i);
        numeroImagen = i;
    end
end

%%Una vez hecho eso ahora usaremos la variable numeroImagen para saber cual
%%de las 4 imágenes es con un simple ifelse

if numeroImagen == 1
    imagen = 'Imagen 1';
elseif numeroImagen == 2
    imagen = 'Imagen 2';
elseif numeroImagen == 3
    imagen = 'Imagen 3';
elseif numeroImagen == 4
    imagen = 'Imagen 4';
end

%%A continuación printeamos la solución del primer Hito.

fprintf('La imagen mas similar a la imagen de referencia es la: ')
disp(imagen)
fprintf('La distancia entre ambas es de: ')
disp(menorDistancia)