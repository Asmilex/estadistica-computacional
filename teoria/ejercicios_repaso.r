#
# -------------------------------------------------------------- EJERCICIO 1 -----
#
# x 10 números aleatorios uniformes en (0, 1)
set.seed(1)
x <- runif(100)
x

# Calcula la media de sus elementos.

mx <- mean(x)
mx
# Localiza en qué posición se encuentra el elemento más cercano a dicha media
which.min(abs(x - mx))

# Número de elementos por debajo de mx
sum(x < mx)

# Crea una matriz A con dos columnas. La primera es el vector x, y la segunda contiene la distancia en valor absoluto de cada elemento de x a mx
A <- cbind(x, abs(x - mx))


#
# -------------------------------------------------------------- EJERCICIO 2 -----
#

# Lee el dataset hatco
hatco <- read.table("./teoria/csv/hatco.txt", header = TRUE)

# Turn the column x8 into a factor
hatco$x8 <- factor(hatco$x8, labels = c("pequeña", "grande"))
hatco

# Transform the first column "cliente" into a string
hatco$cliente <- as.character(hatco$cliente)
hatco
str(hatco)


# Encontrar cuántas empresas hay de cada tipo. Imprimir aleatoriamente una de cada.
sum(hatco$x8 == "pequeña")
sum(hatco$x8 == "grande")

hatco_pequeña <- subset(hatco, hatco$x8 == "pequeña")
hatco_pequeña[sample(rownames(hatco_pequeña), 1), ]

hatco_grande <- subset(hatco, hatco$x8 == "grande")
hatco_grande[sample(rownames(hatco_grande), 1), ]

# get the average of column y
mean(hatco$y)
mean(hatco_pequeña$y)
mean(hatco_grande$y)

# cound how many elements in hatco_pequeña have y > mean(hatco$y)
sum(hatco_pequeña$y > mean(hatco_pequeña$y))
sum(hatco_grande$y > mean(hatco_grande$y))

hatco2 <- scale(Filter(is.numeric, hatco))
hatco2


#
# -------------------------------------------------------------- EJERCICIO 3 -----
#

progresion_aritmetica <- function(n, a1, d) {
    v <- a1 + d * 1:n
    list(elementos = v, suma = sum(v), producto = prod(v))
}

progresion_aritmetica(2, 1, 1)

progresion_aritmetica_v2 <- function(n, a1, d, explicit = FALSE) {
    v <- a1 + d * 1:n

    if (!explicit) {
        list(
            elementos = v,
            suma      = sum(v),
            producto  = prod(v)
        )
    } else {
        list(
            elementos = v,
            suma      = n * (a1 + v[n]) / 2,
            producto  = d^n * gamma(a1 / d + n + 1) / gamma(a1 / d + 1)
        )
    }
}

progresion_aritmetica_v2(2, 1, 1, TRUE)
