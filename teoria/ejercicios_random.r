A <- matrix(runif(9), 3, 3)

A[A >= 0.5]

length(A[A >= 0.5])

B <- A
B[A >= 0.5] <- 0

triangulo_sup <- A
triangulo_sup[lower.tri(A, TRUE)] <- NA
triangulo_sup

triangulo_inf <- A
triangulo_inf[upper.tri(A, TRUE)] <- NA
triangulo_inf

# --------------------------------------------------------------------------------

y <- 10
f1 <- function(x = y) {
    y <- 1
    c(x, y)
}
f1()

f2 <- function(x = y) {
    x
    y <- 1
    c(x, y)
}
f2()

# ────────────────────────────────────────────────────────────────────────────────

lista = list(c(1, 2, 3), c("a", "b", "c"))
lista

lista[1]
lista[1:2]
lista[[1]]

lista <- list(n = c(1, 2), l = c("a", "b"))
lista$n

# ────────────────────────────────────────────────────────────────────────────────

v <- 1:3
v
m <- as.matrix(v)
m

m <- as.matrix(v, ncol = 2)
m

v <- 1:4
dim(v) <- c(2, 2)
v

# ────────────────────────────────────────────────────────────────────────────────

dd_weilbull <- function(x, lambda, alpha) {
    dweibull(x, shape = alpha, scale = 1 / lambda)
}

rd_weilbull <- function(n, lambda, alpha) {
    u <- runif(n)
    1 / lambda * (- log(1 - u))^(1 / alpha)
}

n <- 1000
set.seed(1)
lambda <- 0.5
alpha <- 2

x <- rd_weilbull(n, lambda, alpha)

hist(
    x,
    freq = FALSE,
    breaks = 'FD',
    ylim = c(0, 3),
    main = 'Método de inversión (Weilbull)'
)
lines(density(x), col = 'blue')
curve(dd_weilbull(x, lambda, alpha), add = TRUE, col = 2)
