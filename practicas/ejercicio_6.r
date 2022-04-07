#
# ------------------------------------------------------------ VI ----------
#   :::::: P R A C T I C A   6 : :  :   :    :     :        :          :
# ----------------------------------------------------------------------
#

f <- function(x) {
    x^2 - 5
}

curve(f, 0, 10)
abline(h = 0, col = 2)

f_prima <- function(x) {
    2 * x
}

x0 <- 2
x1 <- x0 - f(x0) / f_prima(x0)
x1
x2 <- x1 - f(x1) / f_prima(x1)
x2
x3 <- x2 - f(x2) / f_prima(x2)
x3
x4 <- x3 - f(x3) / f_prima(x3)
x4

#
# -------------------------------------------------------------- EJERCICIO 1 -----
#

g <- function(x) {
    x^3 - 2 * x - 5
}
g_prima <- function(x) {
    3 * x^2 - 2
}
curve(g, -5, 5)
abline(h = 0, col = 2)

x0 <- 2
x1 <- x0 - g(x0) / g_prima(x0)
x1
x2 <- x1 - g(x1) / g_prima(x1)
x2
x3 <- x2 - g(x2) / g_prima(x2)
x3
x4 <- x3 - g(x3) / g_prima(x3)
x4

newton_rapshon <- function(f, f_prima, x0, tolerancia, nmax, dibuja = TRUE) {
    if (!is.function(f) || !is.function(f_prima)) {
        stop("f y f_prima deben ser funciones")
    }
    if (!all.equal(nmax, as.integer(nmax))) {
        stop("nmax debe ser un entero")
    }
    if (!is.numeric(x0) || !is.numeric(tolerancia)) {
        stop("x0 y tolerancia deben ser números")
    }

    if (dibuja) {
        curve(f, x0 - 5, x0 + 5)
        abline(h = 0, col = 2)
    }

    x <- x0

    for (i in 1:nmax) {
        x_anterior <- x
        x <- x - f(x) / f_prima(x)

        if (abs(x - x_anterior) < tolerancia) {
            return(list(
                "raiz" = x, "tolerancia" = tolerancia, "iteraciones" = i
            ))
        }
    }

    warning("No se encontró una raiz con la tolerancia deseada")
    return(list(
        "raiz" = x, "tolerancia" = tolerancia, "iteraciones" = nmax
    ))
}

newton_rapshon(f, f_prima, 2, 0.01, 20)

#
# -------------------------------------------------------------- EJERCICIO 2 -----
#

library(numDeriv)
resultado <- genD(f, x = 2)
resultado

newton_rapshon <- function(f, f_prima, x0, tolerancia, nmax, dibuja = TRUE) {
    if (!is.function(f)) {
        stop("f debe ser una función")
    }
    if (!all.equal(nmax, as.integer(nmax))) {
        stop("nmax debe ser un entero")
    }
    if (!is.numeric(x0) || !is.numeric(tolerancia)) {
        stop("x0 y tolerancia deben ser números")
    }
    if (missing(f_prima)) {
        print("Usando aproximación de la derivada")
        f_prima <- function(x) {
            genD(f, x = x)$D[1]
        }
    }

    if (dibuja) {
        curve(f, x0 - 5, x0 + 5)
        abline(h = 0, col = 2)
    }

    x <- x0

    for (i in 1:nmax) {
        x_anterior <- x
        x <- x - f(x) / f_prima(x)

        if (abs(x - x_anterior) < tolerancia) {
            return(list(
                "raiz" = x, "tolerancia" = tolerancia, "iteraciones" = i
            ))
        }
    }
    warning("No se encontró una raiz con la tolerancia deseada")
    return(list(
        "raiz" = x, "tolerancia" = tolerancia, "iteraciones" = i
    ))
}

h <- function(x) {
    exp(2 * x) - x - 6
}

newton_rapshon(f = f, x0 = 2, tolerancia = 0.01, nmax = 20, dibuja = FALSE)
newton_rapshon(f = g, x0 = 2, tolerancia = 0.01, nmax = 20, dibuja = FALSE)
newton_rapshon(f = h, x0 = 3, tolerancia = 0.01, nmax = 20, dibuja = TRUE)

uniroot(f, c(0, 4))
uniroot(g, c(0, 4))
uniroot(h, c(0, 8))

#
# -------------------------------------------------------------- EJERCICIO 3 -----
#

# a)

dif.eq <- function(x1, r, n) {
    x <- rep(0, n)
    x[1] <- x1

    for (i in 2:n) {
        x[i] <- r * x[i - 1] * (1 - x[i - 1])
    }

    return(x)
}

dif.eq(x1 = 0.4, r = 2, n = 10)
dif.eq(x1 = 0.7, r = 2, n = 10)

# b)
v <- dif.eq(x1 = 0.95, r = 2.99, n = 500)
plot(1:500, v)

# c)
dif.eq2 <- function(x1, r) {
    x <- c(x1, r * x1 * (1 - x1))
    n <- 2

    while (abs(x[n] - x[n - 1]) >= 0.02) {
        x <- append(x, r * x[n] * (1 - x[n]))
        n <- n + 1
    }

    return(list(
        "valores" = x, "iteraciones" = n
    ))
}

dif.eq2(x1 = 0.95, r = 2.99)