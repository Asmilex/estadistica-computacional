#
# ------------------------------------------------------------ IV ----------
#   :::::: P R A C T I C A   4 : :  :   :    :     :        :          :
# ----------------------------------------------------------------------
#
#
# -------------------------------------------------------------- EJERCICIO 1 -----
#

# a)
censo <- read.csv(
    "./practicas/csv/Census.csv",
    colClasses = c(
        "cellsource" = "factor",
        "travel" = "factor",
        "getlunch" = "factor",
        "gender" = "factor"
    )
)

# b)
str(censo)
lapply(censo, class)

# c)
lapply(censo, function(x) sum(is.na(x)))
lapply(lapply(censo, is.na), sum)

# d)
complete.cases(censo)
sum(complete.cases(censo))

# e)
censo2 <- censo[complete.cases(censo), ]
str(censo2)
censo2 <- na.omit(censo)
str(censo2)

# f)
write.table(censo2, "./practicas/csv/censo2.txt", sep = "\t", row.names = FALSE)

# g)
censo3 <- read.table(
    "./practicas/csv/censo2.txt",
    header = TRUE
)
str(censo3)

#
# -------------------------------------------------------------- EJERCICIO 2 -----
#

# create a 10x5 matrix of random standard distribution
matriz <- matrix(rnorm(10 * 5), nrow = 10, ncol = 5)

# a)
colnames(matriz) <- c("col1", "col2", "col3", "col4", "col5")
matriz

# b)
write.table(
    matriz,
    "./practicas/csv/matriz.txt",
    sep = ",",
    # write the column name as header
    col.names = TRUE,
    row.names = FALSE
)

# c)
# create a dataframe from the file created last time
df <- read.table(
    "./practicas/csv/matriz.txt",
    header = TRUE,
    sep = ","
)

#
# -------------------------------------------------------------- EJERCICIO 3 -----
#

# a)
olimpics <- read.csv(
    "./practicas/csv/Olympics100m.csv",
    colClasses = c(
        "Country" = "factor",
        "Gender" = "factor"
    )
)

# b)
lapply(olimpics, function(x) sum(is.na(x)))

# c)
resumen <- summary(olimpics)
resumen
class(resumen)
typeof(resumen)

write.table(
    resumen,
    "./practicas/csv/resumen.txt",
    col.names = TRUE,
    row.names = FALSE,
    sep = ","
)
resumen2 <- read.table(
    "./practicas/csv/resumen.txt",
    header = TRUE,
    sep = ","
)

# d)
summary(olimpics[olimpics$Gender == "male", ])
summary(olimpics[olimpics$Gender == "female", ])
resumen3 <- aggregate(olimpics$TIME, by = list(olimpics$Gender), summary)
resumen3
write.table(
    resumen2,
    "./practicas/csv/resumen2.csv",
    col.names = TRUE,
    row.names = FALSE,
    sep = ","
)
read.csv(
    "./practicas/csv/resumen2.csv",
    header = TRUE
)