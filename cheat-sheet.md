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
