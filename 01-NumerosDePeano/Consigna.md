# Números de Peano

Analizar la definición axiomática de Peano de los números naturales. Si lo necesita busque en un libro, en wikipedia o navegue por Internet. Lea los axiomas e intente representar los números de Peano con objetos y mensajes.

Llame al primer número I, al segundo número II, al tercero III, al cuarto IIII, al cinco IIIII y así sucesivamente.

Inicialmente concéntrense en representar el I y el II.

Vaya definiendo los métodos necesarios para que los números de Peano por usted definidos sepan responder los mensajes: 

1. previous
2. next
3. \+ unNumeroDePeano
4. \- unNumeroDePeano, 
5. \* unNumeroDePeano
6. / unNumeroDePeano. 

En ese orden, deje la división para el final que es más difícil.

Cuando al II se le envíe el mensaje next, automáticamente se debe crear el III si aún no existe y así sucesivamente. 

Cuando se multipliquen números también se deberán crear los números que esa multiplicación abarque automáticamente, entre ellos el resultado. Por ejemplo II * II generará el III y el IIII si aún no están representados y retornará el IIII.

Para la división, puede definirla de modo que retorne la parte natural (IIII/III retorna I) o bien que solo funcione para divisiones de resultado natural y cuando se pretende dividir números que no se dividen haya un error (ej IIII/III genera un error).

## Entrega

Para entregar deben hacer file-out de lo que representaron y subirlo al repo de su grupo dentro de una carpeta que llamarán 12-NumerosDePeano.

En los métodos *, + y - no debe haber ningún if. 

Asegúrese también de cumplir con el enunciado del ejercicio. Para ello le adjuntamos un conjunto de tests de verificación que deben pasar (haga file-in del archivo y asegúrese antes que en su ambiente existan al menos los objetos I, II, III y IIII). 

Para que pasen los tests 05 y 12 tendrá que realizar un "extract method" de los mensajes de error que deberá nombrar descripcionDeErrorDeNumerosNegativosNoSoportados y descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
