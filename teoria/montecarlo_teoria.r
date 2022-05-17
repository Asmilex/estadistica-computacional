nsim <- 1000
x <- rnorm(nsim)
n <- 1:nsim

x <- x[n]

estimacion <- cumsum(x) / n
estimacion.error <- sqrt(cumsum((x - estimacion)^2)) / n
plot(n, estimacion,
    type = "l",
    xlab = "Número de simulaciones",
    ylab = "Aproximación de la media y error",
    ylim = c(-1, 1)
)
abline(h = 0, col = 2)
z <- qnorm(0.975)
lines(estimacion - z * estimacion.error, lty = 3, lwd = 2, col = "blue")
lines(estimacion + z * estimacion.error, lty = 3, lwd = 2, col = "blue")


#
# ---------------------------------------------------------------- EJERCICIO -----
#
# Determinar el número de simulaciones necesario para aproximar
# la media mu de las siguientes distribuciones con un error máximo de
# 0.1 * |mu|
# Sabemos que n = (z_{alpha/2} * sigma / epsilon)^2

determinar_n <- function(epsilon, sigma, alpha) {
    z <- qnorm(alpha / 2, lower.tail = FALSE)

    (z * sigma / 2)^2
}

# Normal con media mu = 10, desviación típica sigma = 5
# Chi^2 de 10 grados de libertad (mu = 10, sigma^2 = 2mu)
# Poisson lambda = 10 (mu = 10, sigma^2 = mu)