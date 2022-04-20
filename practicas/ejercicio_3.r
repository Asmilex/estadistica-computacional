#
# ------------------------------------------------------------ III ----------
#   :::::: P R A C T I C A   3 : :  :   :    :     :        :          :
# ----------------------------------------------------------------------
#
# Autor: Andrés Millán
#
# -------------------------------------------------------------- EJERCICIO 1 -----
#

lista <- list(
    c(1, 2, 3, 4, 5),
    c(2, 3, 4, 5, 6),
    c(3, 4, 5, 6, 7)
)

names(lista) <- c("x1", "x2", "x3")
lista

# a)
x <- runif(10)
lista[[4]] <- x
lista

# b)
y <- rnorm(10)
lista[[5]] <- y

# c)
lapply(lista, sum) # Devuelve una lista
sapply(lista, sum) # Devuelve un vector

# d)
reg <- lm(y ~ x)
typeof(reg)
is.list(reg)
reg

# e)
attributes(reg)
str(reg)

# f)
matriz <- cbind(
    reg$residuals, reg$fitted.values, x, y
)
colnames(matriz) <- c("residuals", "fitted.values", "x", "y")
matriz

#
# -------------------------------------------------------------- EJERCICIO 2 -----
#

datos <- data.frame(
    "x_i" = c(1.2, 1.8, 2.2, 2.5, 1.1),
    "y_i" = c(15, 18, 10, 12, 16),
    "n_i" = c(12, 23, 5, 9, 11)
)
datos
attributes(datos)

# a)
n <- sum(datos$n_i)

# b)
# compute the arithmetic average of x_i and y_i
x_bar <- sum(datos$x_i * datos$n_i) / n
y_bar <- sum(datos$y_i * datos$n_i) / n
c(x_bar, y_bar)

# find the quasivariance of x_i and y_i
x_var <- sum(datos$n_i * (datos$x_i - x_bar)^2) / (n - 1)
y_var <- sum(datos$n_i * (datos$y_i - y_bar)^2) / (n - 1)
c(x_var, y_var)

# c)
datos.n <- data.frame(
    cbind(
        c(rep(datos$x_i, datos$n_i)),
        c(rep(datos$y_i, datos$n_i))
    )
)


# d)
c(mean(datos.n$X1), mean(datos.n$X2))
c(var(datos.n$X1), var(datos.n$X2))

# e)
datos.n_transform <- transform(
    datos.n,
    Z1 = (X1 - mean(datos.n$X1)) / var(datos.n$X1),
    Z2 = (X2 - mean(datos.n$X2)) / var(datos.n$X2)
)

# Within nos obliga a hacerlo por pasos
datos.n_within <- datos.n
datos.n_within <- within(
    datos.n_within,
    Z1 <- (X1 - mean(datos.n_within$X1)) / var(datos.n_within$X1)
)
datos.n_within <- within(
    datos.n_within,
    Z2 <- (X2 - mean(datos.n_within$X2)) / var(datos.n_within$X2)
)

#
# -------------------------------------------------------------- EJERCICIO 3 -----
#

help(ChickWeight)

# a)
head(ChickWeight, 5)
tail(ChickWeight, 3)

# b)
attributes(ChickWeight)

# c)
summary(ChickWeight)

# d)
peso.dieta <- tapply(ChickWeight$weight, ChickWeight$Diet, summary)
typeof(peso.dieta)
peso.dieta

# e)
peso.dieta.2 <- as.data.frame(matrix(
    unlist(peso.dieta),
    nrow = length(peso.dieta)
))
colnames(peso.dieta.2) <- c("Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max.")
peso.dieta.2


# f)

peso.dieta.2 <- aggregate(
    ChickWeight$weight,
    by = list(ChickWeight$Diet),
    summary
)
peso.dieta.2
class(peso.dieta.2)

# g)
Chick100 <- ChickWeight[sample(rownames(ChickWeight), 100), ]
Chick100

# h) Columnas permutadas aleatoriamente
p <- ncol(Chick100)
Chick100[, sample(1:p, p, replace = FALSE)]

# i) Columnas por orden alfabético
Chick100[1, order(colnames(Chick100))]

# j) Ordenación según diet
Chick100[order(Chick100$Diet), ]

# k) Ordenación según diet y weight
Chick100[order(Chick100$Diet, Chick100$weight), ]

# submuestra conteniendo solo una observación para cada tipo de dieta
new <- Chick100[rev(order(Chick100$weight)), ]
new[!duplicated(new$Diet), ]
