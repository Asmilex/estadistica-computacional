<!-- LTeX: language=es -->
# Cheat sheet

## Conceptos básicos de programación
### Estructuras de datos

| **Constructores** | **Expresiones**                                                    | **Comentarios**                                                                                                             |
|:------------------|:-------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------|
| Secuencias        | `n:m` </br> `seq(from, to, by)` </br> `rep`                        |                                                                                                                             |
| Vectores          | `c(valor1,  valor2)` </br> `vector(type, length)`                  | `type` corresponde al tipo base. Por ejemplo, `logical` o `numeric`. Por ejemplo: `vector("logical", 2) == c(FALSE, FALSE)` |
| Matrices          | `matrix(data, nrow, ncol)`                                         |                                                                                                                             |
| Listas            | `list()` <br> `list(nombre_1 = objeto_1, nombre_2 = objeto_2 ...)` |                                                                                                                             |

#### Vectores y listas

| **Vectores**                                           | **Expresiones**                                                        | **Comentarios**                                                                                                                                                                                                   |
|:-------------------------------------------------------|:-----------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Longitud                                               | `length(v)`                                                            |                                                                                                                                                                                                                   |
| *Resizing*                                             | `length(v) <- valor`                                                   |                                                                                                                                                                                                                   |
| Filtrar elementos                                      | `x[condición]`                                                         | Donde `condición` devuelve un vector lógico indicando los índices. Ejemplo: `x[x > 3]`                                                                                                                            |
| Obtener índices de elementos que cumplen una condición | `which(condición sobre x)`                                             | Da los índices para los cuales la condición es cierta. Ejemplos: <br>`which(LETTERS == "R")`<br>`which((1:12)%%2 == 0) # which are even?`<br>`which(ll <- c(TRUE, FALSE, TRUE, NA, FALSE, FALSE, TRUE)) #> 1 3 7` |
| Índices ordenados                                      | `order(x)`                                                             | Tiene muchos parámetros. Merece la pena [echarle un ojo](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/order)                                                                                |
| Vector ordenado                                        | `sort(x)`                                                              |                                                                                                                                                                                                                   |
| Atributos                                              | `mode(x)` <br> `typeof(x)`                                             |                                                                                                                                                                                                                   |
| Eliminar elemento en una cierta posición               | `x[-indice(s)]`                                                        | Ejemplo: `x[-c(2, 3)]` devuelve el vector sin las posiciones 2 y 3                                                                                                                                                |
| Asignar un nombre a las componentes                    | `names(v) <- c("nombre1", "nombre2")`                                  |                                                                                                                                                                                                                   |
| Acceso a elementos de una lista                        | `lista[[1]]` <br> `lista$nombre_objeto` <br> `lista[['nombre_objeto]]` | Hay una pequeña diferencia entre `lista[]` y `lista[[]]`. El objeto que se devuelve es diferente.                                                                                                                 |
| Crear una nueva componente para una lista              | `lista$componente <- objeto` <br> `lista[[indice]] <- objeto`          | Sí, no hace falta que reserves nada.                                                                                                                                                                              |

#### Matrices

| **Matrices**                       | **Expresiones**                            | **Comentarios**                                                                     |
|:-----------------------------------|:-------------------------------------------|:------------------------------------------------------------------------------------|
| Multiplicación elemento a elemento | `*`                                        |                                                                                     |
| Multiplicación matricial           | `%*%`                                      |                                                                                     |
| Traspuesta                         | `t(matriz)`                                |                                                                                     |
| Inversa                            | `solve(A)`                                 |                                                                                     |
| Resolución de sistemas             | `solve(A, b)`                              | En un sistema de ecuaciones, `A` es la parte de la izquierda y `b` la de la derecha |
| Suma de filas y columnas           | `rowSums()`, `colSums()`                   |                                                                                     |
| Sacar las diagonales de una matriz | `split(matriz, col(matriz) -+ row(matriz)` | Dependiendo de si se usa `+` o `-`, da unas diagonales u otras                      |
| Diagonal de una matriz             | `diag(matriz)`                             |                                                                                     |
| Unir filas o columnas              | `rbind`, `cbind`                           |                                                                                     |

#### Dataframes

| **Concepto**                                             | **Expresiones**                                                                                                     | **Comentarios**                                                                                                                                                                                                                                                                                                                                          |
|:---------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Constructor                                              | `data.frame(columna1, columna2, ...)`                                                                               |                                                                                                                                                                                                                                                                                                                                                          |
| Acceso a elementos                                       | `df[v]`<br> `df[v1, v2]`                                                                                            | Como lista: selecciona columnas <br> Como matriz: selecciona elementos.                                                                                                                                                                                                                                                                                  |
| Filtrado                                                 | `df[condición]` <br> `subset(df, condición)` <br> `Filter(condición o función, df)`                                 | El argumento `condición` es una expresión lógica indicando lo que se quiere tomar. Ejemplo: `df[df$sexo == "Hombre"]`. Puedes combinarlos de varias formas. Por ejemplo, con rangos, como `df[1:2, c("edad", "estudios")` <br> La función `subset` también sirve para otro tipo de estructuras. <br> `Filter` y `filter` producen resultados diferentes. |
| Primeros y últimos elementos                             | `head(df)` <br>  `tail(df)`                                                                                         |                                                                                                                                                                                                                                                                                                                                                          |
| Transformaciones                                         | `transform(df, expresión1, expresión2, ...)`                                                                        | Añade las filas calculadas por las expresiones dadas. Ejemplos: `transform(mtcars, wt = wt/2` o `transform(mtcars, columna_nueva = wt/2)`                                                                                                                                                                                                                |
| Añadir columnas                                          | `within(df, z <- expr)`                                                                                             | Añade la columna de nombre `z` calculada por la expresión. <br>Se pueden añadir varias columnas metiéndolo en un bloque                                                                                                                                                                                                                                  |
| Acceder a un elemento aleatorio de un cierto subconjunto | `sub_df <- subset(df, condición sobre df)` seguido de <br> `sub_df[sample(rownames(sub_df), número de muestras), ]` | Si quieres aplicarlo a todo el dataset, puedes obviar la primera parte                                                                                                                                                                                                                                                                                   |

### Operadores

| **Operadores** | **Expresiones**                                                            | **Comentarios**                                                                                                                                                                        |
|:---------------|:---------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Ariméticas     | `+ - * / ^`                                                                |                                                                                                                                                                                        |
| Módulo         | `%%`                                                                       |                                                                                                                                                                                        |
| Divisón entera | `%/%`                                                                      |                                                                                                                                                                                        |
| Lógicas        | `!`, `&`, `&&`, <code>&#124;</code>, <code>&#124;&#124;</code>, `xor(x,y)` | Los operadores dobles (`&&` y <code>&#124;&#124;</code>) cortocircuitan. </br> Los simples funcionan vectorialmente elemento a elemento. Mejor usa los dobles que no hacen cosas raras |

### Flujo de control

| **Concepto**            | **Expresiones**                                                        | **Comentarios**                                                                                                                                              |
|:------------------------|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Condicionales           | `if (cond) {expr} else if (cond) {expr} else { expr} `                 | Son capaces de devolver valores al final de la expresión. Eso significa que se pueden hacer asignaciones del estilo `x <- if (expr) nosequé else nosecuánto` |
| Condicional vectorizado | `ifelse(condición, valor verdadero, valor falso)`                      |                                                                                                                                                              |
| Switch                  | `switch(variable, posible_valor1 = retorno, posible_valor2 = retorno)` |                                                                                                                                                              |

### Bucles

| **Concepto**         | **Expresiones**              | **Comentarios**                                               |
|:---------------------|:-----------------------------|:--------------------------------------------------------------|
| Range-based for loop | `for (variable in rango) {}` | Habitualmente, `for (i in min:max)` o `for (x in contenedor)` |
| While                | `while (cond) {expr}`        |                                                               |
| Salida temprana      | `break`                      |                                                               |

### Funciones

| **Concepto**                                 | **Expresiones**                          | **Comentarios**                                                                                                                                                                                                                     |
|:---------------------------------------------|:-----------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Declaración de una función                   | `f <- funcion(parámetros) { expresión }` | `class(f) = "function"`                                                                                                                                                                                                             |
| Comprobar argumentos de una función          | `formals(función)`                       |                                                                                                                                                                                                                                     |
| Cuerpo de una función                        | `body(función)`                          | Tema2_2 tiene información adicional sobre reflexión en R.                                                                                                                                                                           |
| Lambdas/closures/funciones anónimas          | `function(parametro) {expresión}`        | En esencia, como la creación de una función normal y corriente pero sin asignárselo a un objeto. Por las ideosincracias de R, **se hace captura de todo el entorno por defecto**. Esto también se aplica a las funciones habituales |
| Número variable de argumentos en una función | `function(parámetros obligatorios, ...)` |                                                                                                                                                                                                                                     |
| Argumentos omitidos                          | `missing(argumento)`                     | Es especialmente útil cuando se cita directamente los parámetros de una función (`f(x = 1, y = 2, w = 4) => missing(z)`)                                                                                                            |

### Lectura de ficheros

| **Concepto**               | **Expresiones**                                | **Comentarios**                                                                                                                                                                                                                                                                              |
|:---------------------------|:-----------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Directorio de trabajo      | `getwd()` </br> `setwd("path/al/directorio")`  |                                                                                                                                                                                                                                                                                              |
| Leer tabla o dataframe     | `read.table()`                                 | `as.is` o `stringsAsFactors` para leerlas como factores. <br> Si el fichero incluye los nombres de las columnas, puedes hacer `read.table(..., header = TRUE)` <br> Se especifica el separador con `sep = ","`<br> `col.names` y `row.names` indican los nombres de las filas y las columnas |
| Leer cosas más genéricas   | `scan()`                                       | Se come todo lo que le eches. Puedes escribir en el script literalmente lo que va a leer. <br> Por defecto separa por espacios en blanco: (`' '`). </br> Para saltarse headers, se pasa el argumento `skip = 1`                                                                              |
| Cargar datos de un paquete | `data(dataset, package="nombre_del_paquete")`  | Por ejemplo, `data(coal, package="boot")` carga los datos del dataset `coal` del paquete `boot`                                                                                                                                                                                              |
| Escribir a ficheros        | `write.table("path/al/archivo")` </br> `write` |                                                                                                                                                                                                                                                                                              |

## idiosincrasias de R

### Factores

| **Concepto**    | **Expresiones**                          | **Comentarios**                                                                                     |
|:----------------|:-----------------------------------------|:----------------------------------------------------------------------------------------------------|
| Crear un factor | `v.factores <- factor(array de valores)` | Por ejemplo, `array de valores = c(1, 2, 3, 2, 1, 3, 2)`.                                           |
| Niveles         | `levels()`                               | Codifica enteros a strings. Ejemplo: `sexo.f <- factor(c(1,,2,2,1,2,1),labels=c('hombre','mujer'))` |

### Agregando por factores

| **Concepto** | **Expresiones**                                    | **Comentarios**                                                                                                                      |
|:-------------|:---------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------|
| `split`      | `split(contenedor, criterio)`                      | Un criterio típico suele ser clasificar por factor. Por ejemplo: `split(Orange, Orange$Tree)`. Se le puede pasar también una función |
| `tapply`     | `tapply(contenedor, INDEX = criterio(s), función)` | Muy similar a aggregate. Hace un `split`  de acuerdo con el/los factores y aplica la función a cada subconjunto.                     |
| `aggregate`  | `aggregate(contenedor, by = criterio(s), función)` | Aplica funciones a subconjuntos de un df determinados por *una lista* de factores. Esa lista sí puede tener un sólo elemento         |

### La familia `apply` y otras funciones similares

| **Concepto** | **Expresiones**                                          | **Comentarios**                                                                                                                             |
|:-------------|:---------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| `lappy`      | `lappy(contenedor, función a aplicar)`                   | Devuelve una lista. De ahí la `l`.                                                                                                          |
| `sapply`     | `sapply(contenedor, función a aplicar)`                  | Simplifica el retorno. Creo que devuelve un vector                                                                                          |
| `apply`      | `apply(contenedor, MARGIN, función, ..., simplify=TRUE)` | `MARGIN` controla la dimensión a la que se le aplica la función. [Más info](https://bookdown.org/jboscomendoza/r-principiantes4/apply.html) |
| Productorio  | `prod(x)` <br> `cumprod(x)`                              |                                                                                                                                             |
| Sumatoria    | `sum(x)` <br> `cumsum(x)`                                |                                                                                                                                             |


### Distribuciones estadísticas, aleatoriedad y otros conceptos similares

| **Concepto**            | **Expresiones**                                        | **Comentarios**                                  |
|:------------------------|:-------------------------------------------------------|:-------------------------------------------------|
| Media                   | `mean(x)`                                              |                                                  |
| Cuasivarianza           | `var(x)`                                               | Sí, es la cuasivarianza, y no la varianza (°ー°〃) |
| Cuasi-desviación típica | `sd(x)`                                                |                                                  |
| Distribuciones          | `rnorm(n, mean = 0, sd = 1)`</br> `runif(n, min, max)` |                                                  |
| Dibujar funciones       | `plot`, `abline`, `contour`                            |                                                  |
| Redondeo                | `trunc` </br> `floor` </br> `ceiling`                  |                                                  |
| Gamma                   | `gamma`                                                |                                                  |
| Tomar muestras          | `sample(contenedor, elementos, replace = TRUE/FALSE)`  |                                                  |

### Logging y debugging

| **Concepto**                                  | **Expresiones**                           | **Comentarios**                                                                                                                           |
|:----------------------------------------------|:------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------|
| Mostrar las variables definidas en el entorno | `ls()`                                    |                                                                                                                                           |
| Mensajes                                      | `stop()`, `warning()`, `message()`        |                                                                                                                                           |
| Traza                                         | Tras una ejecución fallida, `traceback()` |                                                                                                                                           |
| Punto de ruptura (*breakpoint)*               | `browser()`                               | Cuando entra en el ambiente de debug, con `get("var")` saca las variables locales (¿A veces? R hace cosas RaRas), y `Q` sale del debuggeo |
| Debug                                         | `debug(función)`                          | Para salir, `undebug(función)`                                                                                                            |

## Otras movidas que no sé dónde poner ahora mismo

| **Concepto**                            | **Expresiones**                                   | **Comentarios**                                                                                                                                                                                                                                                                                                                       |
|:----------------------------------------|:--------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Regla de reciclaje                      |                                                   | En general, R siempre va a intentar aplicar lo que le pidas como buenamente pueda. Eso significa que si faltan elementos en un vector, o se le aplica una función escalar a un vector, se aplicará al resto de dimensiones volviendo a usar los valores existentes. Por ejemplo, `log(vector)` aplica el logaritmo a cada componente. |
| Concatenación extraña de cadenas        | `paste(string, string, sep)`                      | Ejemplo: `paste(c("X", "Y"), 1:10, sep = "") == ["X1", "Y2", "X3"...]`                                                                                                                                                                                                                                                                |
| Familia de funciones `is.()`            | `is.na()` <br> `is.integer()` <br> `is.numeric()` |                                                                                                                                                                                                                                                                                                                                       |
| *Casting*                               | `as.()`                                           | Ejemplos: `as.numeric(x)`, `as.factor(x)`                                                                                                                                                                                                                                                                                             |
| Comparación de números en coma flotante | `all.equal()`                                     | Se salta los problemas de redondeo de números en coma flotante. Por ejemplo, `all.equal(0.3 - 0.2, 0.1) == TRUE`, `all.equal(sqrt(3)^2, 3) == TRUE`                                                                                                                                                                                   |
| Otros                                   | `str`<br> `summary`                               |                                                                                                                                                                                                                                                                                                                                       |
