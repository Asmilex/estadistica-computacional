#
# ------------------------------------------------------------ II ---------
#   :::::: P R A C T I C A   2 : :  :   :    :     :        :          :
# ----------------------------------------------------------------------
#

#
# -------------------------------------------------------------- EJERCICIO 1 -----
#
# Ejecuta las siguientes sentencias y extrae conclusiones sobre el tipo de objeto que devuelven

A <- matrix(1:9, 3, 3)
x <- 1:3

# Ejecuta Ax, dando un vector columna como resultado. x se trata como vector columna
A %*% x

# Por el mismo motivo de antes, Ax^t falla. (A matriz 3x3, x^t 1x3)
A %*% t(x)

# Calcula xA, tratando x como un vector fila
x %*% A

# Calcula x^{t}A, siendo x^t un vector espera what. Por qué funciona esto y no el A %*% x?
t(x) %*% A

# Caclula x^tx, siendo x^t 1x3, x 3x1.
t(x) %*% x

#
# -------------------------------------------------------------- EJERCICIO 2 -----
#
# Ejecuta las siguientes sentencias en R y formula los sistemas se resuelven en cada caso:

# Sistema 1
# Resuelve el sistema ax = b, con a = 2, b = 2
solve(2, 2)

# Sistema 2
A <- matrix(c(3, 1, 4, 2), 2, 2)
b <- c(12, 8)

# Resuelve el sistema 3x + 4y = 12, x + 2y = 8.
solve(A, b)

# Sistema 3
solve(A, diag(2))
# Resuelve AX = B, con B = diagonal (2)

# Crea objetos A (matriz de coeficientes) y b (vector de términos independientes) para
# resolver en R el sistema anterior. Resuelve el sistema con solve. Después perturba el
# vector b sumándole 0.05 a cada uno de sus elementos y busca la nueva solución, ¿se parece
# a la anterior? Repite la operación con un incremento de 0.1. Comenta los resultados.

A <- matrix(
    c(
        10, 7, 8, 7,
        7, 5, 6, 5,
        8, 6, 10, 9,
        7, 5, 9, 10
    ),
    nrow = 4, ncol = 4
)
b <- c(32, 23, 33, 31)
solve(A, b)

b_perturbado <- b + 0.05
solve(A, b_perturbado)
# La solución ha cambiado bastante. De hecho, podemos ver la distancia de los dos vectores con
# Find the distance of the two vectors
sqrt(sum((solve(A, b) - solve(A, b_perturbado))^2))

# Lo perturbamos con 0.1
b_aun_mas_perturbado <- b + 0.1
solve(A, b_aun_mas_perturbado)

# También cambia bastante
sqrt(sum((solve(A, b) - solve(A, b_aun_mas_perturbado))^2))

# Calcula el número de condición de la matriz A del sistema anterior así como su recíproco.
# Realiza primero el cálculo con las funciones kappa y rcond y después comprueba que
# coinciden con su definición (kappa(A) como cociente entre máximo y mínimo autovalor
# en valor absoluto y rcond(A) como su inversa). Comenta el resultado.

# Ponemos `exact = TRUE` para que lo calcule correctamente
kappa(A, exact = TRUE)
rcond(A)

# Get the maximum eigenvalue of A
kappa_A <- abs(max(eigen(A)$values)) / abs(min(eigen(A)$values))

# No sale exactamente igual si le quitamos el exact = TRUE
c(kappa(A), kappa(A, exact = TRUE), kappa_A)

rcond_A <- kappa_A^(-1)

# El número de condición recíproco sí que sale algo más similar.
c(rcond(A), rcond_A)

#
# -------------------------------------------------------------- EJERCICIO 3 -----
#
# (Este enunciado es muy largo, no lo copio)

ejercicio_3 <- function(n) {
    set.seed(2)
    x <- rnorm(n)
    y <- 1 + x + rnorm(n, 0, 0.1)

    X <- cbind(1, x)
    Y <- y

    t_x_x_inv <- solve(t(X) %*% X)

    beta_gorrito <- t_x_x_inv %*% t(X) %*% Y
    message("Beta gorrito = ", beta_gorrito)

    # Sí que se parecen los dos:
    message("Diferencia entre beta = (1, 1) y beta gorrito: ", sqrt(sum((beta_gorrito - c(1, 1))^2)))

    curve(1 + x, -3, 3)
    points(x, y)
    curve(beta_gorrito[1] + beta_gorrito[2] * x, -3, 3, add = TRUE)
}

ejercicio_3(5)
ejercicio_3(50)
ejercicio_3(500)

# Cuantas más muestras añadimos, más se acerca a la solución correcta.

# ¿Qué problema(s) puede tener en la práctica este tipo de implementación directa?

# En general, no nos podemos permitir añadir muestras así como así. Cuantas más se utilizan,
# menor es el rendimiento.
# Además, llegaremos a un punto de retornos reducidos, a partir del cual no interesará añadir ninguno más.



# Utilizando la misma muestra de n = 5 ...


#
# -------------------------------------------------------------- EJERCICIO 4 -----
#