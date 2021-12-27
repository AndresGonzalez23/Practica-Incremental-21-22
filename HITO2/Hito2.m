%%Practica Incremental Curso 21-22
%%Andrés González Varela
%%Hito 2

%%Primero debemos cargar las dos imagenes, tanto la imagen completa del
%%asteroide como la imagen de referencia que debemos buscar. Y tambien
%%aprovecharemos para calcular los descriptores HOG de ambas imagenes.

imagenAsteroide = imread('asteroideHito2.jpg');
imagenReferencia = imread('referenciaHito2.jpg');
HOGReferencia = HOG(imagenReferencia);

%%Ahora debemos crear una imagen temporal y sustituiremos una parte de la
%%imagen por la imagen de referencia, en este caso la esquina superior
%%izquierda

imagenTemporalAsteroide = imagenAsteroide;
imagenTemporalAsteroide(1:200,1:200) = imagenReferencia;
imshow(imagenTemporalAsteroide)

%%Ahora debemos crear el mosaico de la imagen para ir calculando los
%%descriptores HOG y compararlos con la imagen de referencia para saber
%%cual es la zona indicada, o al menos la mas parecida. En este caso al
%%tener que dividir la imagen en trozos de 200x200 queda una cuadricula de
%%6x5 (5 columnas 6 filas). 
f2 = figure;
i = 0;
for x = 1:200:1200
    for y = 1:200:1000
    cuadriculaActual = imagenAsteroide(x:x+199,y:y+199);
    imshow(cuadriculaActual)
    end
    
end
