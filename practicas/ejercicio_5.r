#
# ------------------------------------------------------------ V ----------
#   :::::: P R A C T I C A   5 : :  :   :    :     :        :          :
# ----------------------------------------------------------------------
#

muestra <- c(
    25.03, 18.59, 47.20, 80.20, 187.67,
    95.94, 35.07, 145.38, 9.52, 128.14,
    136.69, 180.82, 49.67, 33.41, 4.16,
    94.87, 102.25, 11.04, 35.14, 151.15,
    17.14, 81.94, 20.01, 125.26, 7.11,
    61.36, 55.59, 10.80, 31.88, 16.39,
    45.95, 4.98, 23.20, 8.78, 30.68,
    22.65, 13.19, 40.62, 2.78, 35.41,
    8.63, 17.04, 8.02, 126.54, 2.11,
    136.93, 17.39, 37.73, 84.53, 14.22
)

logl <- function(theta) {
    l <- sum(log(dgamma(x = muestra, shape = theta[1], scale = theta[2])))
    return(-l)
}

forma <- 1
escala <- 1

res <- optim(par = c(forma, escala), fn = logl)
res$par

str(res)
str(optim(par = c(10, 20), fn = logl))

# --------------------------------------------------------------------------------

library(Rsolnp)

res <- solnp(pars = c(forma, escala), fun = logl, LB = c(0, 0))
res$pars

# --------------------------------------------------------------------------------

a_gorrito <- var(muestra) / mean(muestra)
b_gorrito <- mean(muestra) / a_gorrito

res <- solnp(
    pars = c(a_gorrito, b_gorrito),
    fun = logl,
    LB = c(0, 0)
)

# --------------------------------------------------------------------------------

library(maxLik)

logl2 <- function(theta) {
    -logl(theta)
}
res <- maxLik(logl2, start = c(1, 1))
res
res$estimate

res <- maxLik(logl2, start = c(a_gorrito, b_gorrito))
res
# Hay menos warnings, pero se han producido 5 NaNs
res$estimate

# --------------------------------------------------------------------------------

A <- matrix(c(1, 0, 0, 1), 2)
B <- c(0, 0)
maxLik(logl2, start = c(1, 1), constraints = list(ineqA = A, ineqB = B))

# --------------------------------------------------------------------------------

f <- function(a) {
    log(a) - digamma(a) - log(mean(muestra)) + mean(log(muestra))
}
res <- uniroot(f, c(0.1, 100))
res

# --------------------------------------------------------------------------------

a <- res$root
b <- mean(muestra) / a
b

res_solnp <- solnp(pars = c(a_gorrito, b_gorrito), fun = logl, LB = c(0, 0))
c(
    c(a, b),
    res_solnp$pars
)
# Vemos que est??n basante cerca

# --------------------------------------------------------------------------------

medias <- function(x) {
    # check that x is a numeric vector
    if (!is.numeric(x)) {
        stop("x debe ser un vector num??rico")
    }
    # check that x is not empty
    if (length(x) == 0) {
        stop("x no debe ser vac??o")
    }
    # check if x has nan. If it does, ignore them
    if (any(is.nan(x)) || any(is.na(x))) {
        warning("Los valores NaN and NA de x ser??n ignorados")
        x <- x[!is.nan(x)]
        x <- x[!is.na(x)]
    }
    if (any(x == 0)) {
        warning("x toma el valor 0")
    }
    if (any(x < 0)) {
        warning("x toma valores negativos")
    }

    media <- list()
    media$aritm <- mean(x)
    media$.harm <- ifelse(
        any(x == 0),
        NA,
        length(x) / sum(1 / x)
    )
    media$geom <- ifelse(
        any(x <= 0),
        NA,
        exp(mean(log(x)))
    )

    return(media)
}

medias(1:10)
medias(c(1:10, NA))
medias(0:10)
medias(-1:10)

# --------------------------------------------------------------------------------

mediana <- function(x) {
    if (missing(x) || !is.numeric(x)) {
        stop("x debe ser un vector num??rico")
    }

    x <- x[!is.na(x)]
    x_ordenado <- sort(x)
    n <- length(x)

    if (n %% 2 == 0) {
        mediana <- (x_ordenado[n / 2] + x_ordenado[n / 2 + 1]) / 2
    } else {
        mediana <- x_ordenado[(n + 1) / 2]
    }

    mediana
}
mediana(1:5)
mediana(1:6)

cuartiles <- function(x) {
    if (missing(x) || !is.numeric(x)) {
        stop("x debe ser un vector num??rico")
    }

    x <- x[!is.na(x)]
    x_ordenado <- sort(x)
    n <- length(x)

    posicion_Q1 <- (n + 1) / 4
    i <- trunc(posicion_Q1)
    Q1 <- x_ordenado[i] + (posicion_Q1 - i) * (x_ordenado[i + 1] - x_ordenado[i])

    Q2 <- if (n %% 2 == 0) {
        (x_ordenado[n / 2] + x_ordenado[n / 2 + 1]) / 2
    } else {
        x_ordenado[(n + 1) / 2]
    }

    posicion_Q3 <- (n + 1) * 3 / 4
    i <- trunc(posicion_Q3)
    Q3 <- x_ordenado[i] + (posicion_Q3 - i) * (x_ordenado[i + 1] - x_ordenado[i])

    list(
        Q1 = Q1,
        Q2 = Q2,
        Q3 = Q3
    )
}

cuartiles(1:9)
cuartiles(1:10)
quantile(1:9, c(.25, .5, .75))
quantile(1:10, c(.25, .5, .75))