<!-- LTeX: language=es -->
# Cheat sheet

| **Concepto**                | **Expresiones**                                        | **Comentarios** |
|:----------------------------|:-------------------------------------------------------|:----------------|
| Distribuciones              | `rnorm(n, mean = 0, sd = 1)`</br> `runif(n, min, max)` |                 |
| Unir filas o </br> columnas | `rbind` </br> `cbind`                                  |                 |
| Ploteo general              | `plot`</br> `abline` </br> `contour`                   |                 |
### Estadistica 101

| **Constructores** | **Expresiones**                                   | **Comentarios**                                                                                             |
|:------------------|:--------------------------------------------------|:------------------------------------------------------------------------------------------------------------|
| Secuencias        | `n:m` </br> `seq` </br> `rep`                     |                                                                                                             |
| Vector            | `c(valor1,  valor2)` </br> `vector(type, length)` | Puedes asignar nombres a los valores con names(v). type corresponde al tipo base,</br> eg logical o numeric |
| Matrices          | `matrix(data, nrow, ncol)`                        |                                                                                                             |
| Arrays            |                                                   |                                                                                                             |

Si x es un vector,
| **Vectores** | **Expresiones** | **Comentarios**                         |
|:-------------|:----------------|:----------------------------------------|
| `x[x > 0]`   |                 | Expresiones lógicas cualesquiera dentro |
|              |                 |                                         |

| **Funciones incluidas** | **Expresiones**                       | **Comentarios** |
|:------------------------|:--------------------------------------|:----------------|
| Redondeo                | `trunc` </br> `floor` </br> `ceiling` |                 |
| Gamma                   | `gamma`                               |                 |
|                         |                                       |                 |

| **Operadores** | **Expresiones** | **Comentarios** |
|:---------------|:----------------|:----------------|
| Ariméticas     | `+ - * / ^`     |                 |
| Módulo         | `%%`            |                 |
| Divisón entera | `%/%`           |                 |
| Lógicas        | ```! & && \| \|\| xor(x,y)``` | Los operadores dobles (&& y ||) cortocircuitan. </br> Los simples funcionan vectorialmente elemento a elemento |
## Funciones

| **Concepto**                                 | **Expresiones**                          | **Comentarios**                                                                                                                                                                                                                     |
|:---------------------------------------------|:-----------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Declaración de una función                   | `f <- funcion(parámetros) { expresión }` | `class(f) = "function"`                                                                                                                                                                                                             |
| Comprobar argumentos de una función          | `formals(función)`                       | .                                                                                                                                                                                                                                   |
| Cuerpo de una función                        | `body(función)`                          | Tema2_2 tiene información adicional sobre reflexión en R.                                                                                                                                                                           |
| Lambdas/closures/funciones anónimas          | `function(parametro) {expresión}`        | En esencia, como la creación de una función normal y corriente pero sin asignárselo a un objeto. Por las ideosincracias de R, **se hace captura de todo el entorno por defecto**. Esto también se aplica a las funciones habituales |
| Número variable de argumentos en una función | `function(parámetros obligatorios, ...)` | .                                                                                                                                                                                                                                   |
| Argumentos omitidos                          | `missing(argumento)`                     | Es especialmente útil cuando se cita directamente los parámetros de una función (`f(x = 1, y = 2, w = 4) => missing(z)`)                                                                                                            |

## Estructuras de programación básicas

| **Concepto**            | **Expresiones**                                                        | **Comentarios**                                                                                                                                              |
|:------------------------|:-----------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Condicionales           | `if (cond) {expr} else if (cond) {expr} else { expr} `                 | Son capaces de devolver valores al final de la expresión. Eso significa que se pueden hacer asignaciones del estilo `x <- if (expr) nosequé else nosecuánto` |
| Condicional vectorizado | `ifelse(condición, valor verdadero, valor falso)`                      | .                                                                                                                                                            |
| Operadores lógicos      | `&&`, `||`                                                             | .                                                                                                                                                            |
| Switch                  | `switch(variable, posible_valor1 = retorno, posible_valor2 = retorno)` | .                                                                                                                                                            |

## Bucles

| **Concepto**         | **Expresiones**              | **Comentarios**                                               |
|:---------------------|:-----------------------------|:--------------------------------------------------------------|
| Range-based for loop | `for (variable in rango) {}` | Habitualmente, `for (i in min:max)` o `for (x in contenedor)` |
| While                | `while (cond) {expr}`        | .                                                             |
| Salida temprana      | `break`                      | .                                                             |

## La familia `apply` y otras funciones similares

| **Concepto** | **Expresiones**                                          | **Comentarios**                                                                                                                             |
|:-------------|:---------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| `lappy`      | `lappy(contenedor, función a aplicar)`                   | Devuelve una lista. De ahí la `l`.                                                                                                          |
| `sapply`     | `sapply(contenedor, función a aplicar)`                  | Simplifica el retorno. Creo que devuelve un vector                                                                                          |
| `apply`      | `apply(contenedor, MARGIN, función, ..., simplify=TRUE)` | `MARGIN` controla la dimensión a la que se le aplica la función. [Más info](https://bookdown.org/jboscomendoza/r-principiantes4/apply.html) |
| `split`      | `split(contenedor, criterio)`                            | Un criterio típico suele ser clasificar por factor. Por ejemplo: `split(Orange, Orange$Tree)`. Se le puede pasar también una función        |
| `aggregate`  | `aggregate(df$variable, by = list(df$factor), summary)`  | Resume las columnas de un data frame para cada uno de los niveles de un factor.                                                             |
| `tapply`     | `tapply(df$variable, df$factor, summary)`                | Igual que lo anterior                                                                                                                       |

## Logging y debugging

| **Concepto**                                  | **Expresiones**                           | **Comentarios**                                                                                                                           |
|:----------------------------------------------|:------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------|
| Mostrar las variables definidas en el entorno | `ls()`                                    | .                                                                                                                                         |
| Mensajes                                      | `warning()`, `message()`                  | .                                                                                                                                         |
| Traza                                         | Tras una ejecución fallida, `traceback()` | .                                                                                                                                         |
| Punto de ruptura (*breakpoint)*               | `browser()`                               | Cuando entra en el ambiente de debug, con `get("var")` saca las variables locales (¿A veces? R hace cosas RaRas), y `Q` sale del debuggeo |
| Debug                                         | `debug(función)`                          | Para salir, `undebug()`                                                                                                                   |

## Otras movidas que no sé dónde poner ahora mismo

| **Concepto**                       | **Expresiones**                            | **Comentarios**                                                |
|:-----------------------------------|:-------------------------------------------|:---------------------------------------------------------------|
| Suma de filas y columnas           | `rowSums()`, `colSums()`                   | .                                                              |
| Sacar las diagonales de una matriz | `split(matriz, col(matriz) -+ row(matriz)` | Dependiendo de si se usa `+` o `-`, da unas diagonales u otras |
