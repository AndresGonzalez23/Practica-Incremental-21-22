function [distancia] = CalcularDistancia(u,v)

%%En esta funcion realizaremos el calculo de la distancia el cual es
%% coseno=(u*v)/(||u||*||v||)
%%Usaremos la función dot() para calcular el producto escalar de los dos
%%vectores. La función dot hará u*v = u(1)*v(1)+u(2)*v(2)+...u(n)*v(n)

productoEscalar = dot(u,v);

%% Ahora debemos calcular el módulo de ambos vectores. Para esto usaremos la 
%%función norm(). Que nos calculara, tomando como ejemplo u,
%%||u|| =√(u(1))^2+(u(2))^2...(u(n))^2.

moduloU=norm(u);
moduloV=norm(v);

%%Ahora debemos calcular la multiplicación de ambos módulos

totalInferior = moduloU*moduloV;

%%A continuación  realizamos la operacion de productoEscalar/totalInferior
%%que sera el valor del coseno que forman esos dos vectores y el valor que
%%devolveremos en esta función.

coseno = productoEscalar/totalInferior;

%%Ahora una vez hecho esto, calculamos la distancia de A a B. La operación
%%es sencilla. d(u,v) = 1 - coseno

distancia = 1- coseno;

end


