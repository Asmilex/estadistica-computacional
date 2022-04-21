#
# -------------------------------------------------------- I ----------
#   :::::: E X A M E N   1 : :  :   :    :     :        :          :
# ------------------------------------------------------------------
#
# Autor: Andrés Millán
#
# -------------------------------------------------------------- EJERCICIO 1 -----
#
# Crea un vector con los 50 primeros números impares llamado x
x <- seq(1, by = 2, length = 50)
x

# Calcula la media, cuasidesv. tipica
mx <- mean(x)
mx
sx <- sd(x)
sx

# Número de elementos que disten de mx más de sx unidades
length(x[abs(x - mx) > sx])

# Sustituye los elementos del apartado anterior por NA
x[abs(x - mx) > sx] <- NA
x

# Cuenta cuántos elementos múltiplos de 3 hay en x
# TOOD: usa sum con una lambda para esto
length(x[x %% 3 == 0])
sub_x <- x[x %% 3 == 0]
sub_x <- sub_x[!is.na(sub_x)]
length(sub_x)


#
# -------------------------------------------------------------- EJERCICIO 2 -----
#

# Cargar el dataset airquality del paquete datasets
aire <- airquality
str(aire)
summary(aire)

# Count the number of NA
sum(is.na(aire))

# Quitar las filas con NAs
aire_sin_na <- aire[complete.cases(aire), ]
aire_sin_na

# contar las filas de aire_sin_na
nrow(aire_sin_na)
nrow(aire_sin_na) == nrow(aire) - sum(is.na(aire))

# Parece que faltan 2, pero no hay NAs en aire_sin_na?
sum(is.na(aire_sin_na))

# Convierte la columna month en un factor

aire_sin_na$Month <- factor(aire_sin_na$Month, labels = c("Mayo", "Junio", "Julio", "Agosto", "Septiembre"))
# Alternativamente,
# aire_sin_na$Month <- factor(aire_sin_na$Month, labels = month.name[5:9])
aire_sin_na$Month

# Calcular las medianas de la columna Wind y Ozone para cada mes
aggregate(
    aire_sin_na$Ozone,
    by = list(aire_sin_na$Month),
    median
)
aggregate(
    aire_sin_na$Wind,
    by = list(aire_sin_na$Month),
    median
)

# Crear un dataframe con los datos correspondientes al factor Mayo
aire.mayo <- aire_sin_na[aire_sin_na$Month == "Mayo", ]
aire.mayo

#
# -------------------------------------------------------------- EJERCICIO 3 -----
#

# Crear una función que calcule los primeros términos de la progresión geométrica a_n = a_1 * r^(n-1)

progresion_geometria <- function(n, a_1, r) {
    # comprobar que los argumentos son numeric
    if (!is.numeric(n) || !is.numeric(a_1) || !is.numeric(r)) {
        stop("Los argumentos deben ser numericos")
    }
    # comprobar que no hay missing values
    if (missing(n) || missing(a_1) || missing(r)) {
        stop("Los argumentos no pueden contener missing values")
    }

    v <- a_1 * r^(1:n - 1)

    list(
        v = v,
        suma1 = sum(v),
        suma2 = a_1 * (1 - r^n) / (1 - r),
        producto1 = prod(v),
        producto2 = if (a_1 > 0 && r > 0) {
            sqrt(a_1^2 * r^(n - 1))^n
        } else {
            NA
        }
    )
}
progresion_geometria(n = 20, a_1 = 2, r = -0.5)
progresion_geometria(n = 20, a_1 = 2, r = 0.5)
