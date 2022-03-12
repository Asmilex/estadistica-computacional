# Práctica 1: Vectores
# Autor: Andrés Millán

# -------------------------------------------------------------- EJERCICIO 1 -----

x <- seq(1, 10, by = 0.2)

# a)
n <- length(x)
n

# b)
names(x) <- paste("x_", 1:n, sep = "")
x

# c)
mx <- mean(x)
mx

# d)
length(x[x > mx])

# e)
min(which(x > mx))

# f)
y <- seq(from = 1, length.out = n, by = 2)
y

# g)
x[y[1:5]]

# -------------------------------------------------------------- EJERCICIO 2 -----

valores <- seq(-2, 2, by = 0.1)

f <- function(x) {
    return(
        (x < -1) * 1
            + (x >= -1 & x < 0) * log(x^2)
            + (x >= 0 & x < 1) * log(x^2 + 1)
            + (x >= 1) * 2
    )
}

f(valores)

# -------------------------------------------------------------- EJERCICIO 3 -----

set.seed(1)
x <- runif(50)

# a)
length(x[0.25 < x & x < 0.75])

# b)
length(x[x < 0.1 | 0.9 < x])
x[x < 0.1 | 0.9 < x] <- NA
# Comprobamos que se han sustituido correctamente
length(x[x < 0.1 | 0.9 < x])
# La condición evaluada siempre es verdad para los NA, por lo que siguen saliendo.
mx_1 <- mean(x, na.rm = TRUE)

# c)
x[is.na(x)] <- 0
mx_2 <- mean(x)
c(mx_1, mx_2)

# -------------------------------------------------------------- EJERCICIO 4 -----

a_1 <- 1
d <- 1.2
a <- a_1 + ((1:20) - 1) * d

# a)
sum(a)

# b)
sd(a)
c(sd(a), abs(d) * sqrt(20 * (20 + 1) / 12))

# c)
prod(a)

d^20 * gamma(a_1 / d + 20) / gamma(a_1 / d)

#
# -------------------------------------------------------------- EJERCICIO 5 -----
#

x <- c(2, 2, 8, 7, 6, 1, 5)
x[-1] - x[-length(x)]
# Alternativamente
diff(x)

#
# -------------------------------------------------------------- EJERCICIO 6 -----
#

set.seed(1)
ABE <- sort(c(LETTERS, "Ñ"))

# a)
ABE.5 <- sample(ABE, 5, replace = FALSE)

# b)
PAL <- c(
    paste(sample(ABE.5, replace = FALSE), collapse = ""),
    paste(sample(ABE.5, replace = FALSE), collapse = "")
)
