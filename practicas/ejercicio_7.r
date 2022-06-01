#
# ------------------------------------------------------------ VII ----------
#   :::::: P R A C T I C A   7 : :  :   :    :     :        :          :
# ----------------------------------------------------------------------
#
# Autor: Andrés Millán

employee <- read.table(
    "./practicas/csv/Employee.txt",
    header = TRUE,
    colClasses = c(
        "gender" = "factor",
        "jobcat" = "factor",
        "minority" = "factor"
    )
)
employee$gender <- factor(employee$gender, labels = c("female", "male"))
employee
str(employee)

attach(employee)

# --------------------------------------------------------------------------------

hist(salary)

res <- hist(salary, plot = FALSE)
res

hist(salary, breaks = 100)
# puntos de corte para intervalos con distinta amplitud
x1 <- seq(15000, 40000, by = 5000)
x2 <- seq(50000, 80000, by = 10000)
x3 <- seq(100000, 140000, by = 20000)
hist(salary, breaks = c(x1, x2, x3))

lines(density(salary), col = "blue")

curve(
    dnorm(x, mean = mean(salary), sd = sd(salary)),
    add = TRUE,
    col = "red"
)

# No se ajusta especialmente bien

# --------------------------------------------------------------------------------

qqnorm(salary)

ks.test(salary, pnorm, mean = mean(salary), sd = sd(salary))
shapiro.test(salary)

# --------------------------------------------------------------------------------

boxplot(salary)

summary(salary)

hist(salary, probability = TRUE, main = "", axes = FALSE)
axis(1)
lines(density(salary), col = "red", lwd = 2)
par(new = TRUE) ## Para que el próximo gráfico se superponga al anterior
boxplot(salary, horizontal = TRUE, axes = FALSE, lwd = 2)

boxplot(salary ~ gender)
boxplot(salary ~ minority)
boxplot(salary ~ jobcat)
# A continuación salario con una doble clasificación
boxplot(salary ~ gender * jobcat)

hist(startsal)
boxplot(startsal)
boxplot(salary ~ startsal)

hist(age)
boxplot(age, axes = TRUE)
boxplot(salary ~ age)

# --------------------------------------------------------------------------------

plot(startsal, salary)

mod <- lm(salary ~ startsal)
mod

plot(startsal, salary)
abline(mod, col = "blue")

# --------------------------------------------------------------------------------

plot(age, salary)

# No parece que estén relacionadas linealmente

plot(edu, salary)

# Tampoco se aprecia que haya dependencia lineal, pero podemos intentarlo

abline(lm(salary ~ edu), col = "blue")

# --------------------------------------------------------------------------------

tab <- table(jobcat)
tab

tab.fi <- prop.table(tab)
tab.fi

data.frame(tab, Freq.rel = as.numeric(tab.fi))

barplot(tab)
pie(tab)

# --------------------------------------------------------------------------------

tab <- table(gender)
tab

tab.fi <- prop.table(tab)
tab.fi

data.frame(tab, Freq.rel = as.numeric(tab.fi))
barplot(tab)
pie(tab)

# --------------------------------------------------------------------------------

tab <- table(minority)
tab

tab.fi <- prop.table(tab)
tab.fi

data.frame(tab, Freq.rel = as.numeric(tab.fi))
barplot(tab)
pie(tab)

# --------------------------------------------------------------------------------

tab2 <- table(jobcat, gender)
tab2
addmargins(tab2)

barplot(tab2)

barplot(tab2,
    legend.text = TRUE,
    args.legend = list(x = "topleft", bty = "n"),
    ylim = c(0, 300),
    density = 30,
    col = c("green", "blue", "red"),
    main = "Number of employees by gender and job category"
)

barplot(tab2,
    legend.text = TRUE,
    args.legend = list(x = "top", bty = "n"),
    density = 30,
    col = c("green", "blue", "red"),
    main = "Number of employees by gender and job category",
    beside = TRUE
)

# --------------------------------------------------------------------------------

tab2 <- table(jobcat, minority)
tab2
addmargins(tab2)

barplot(tab2)

barplot(tab2,
    legend.text = TRUE,
    args.legend = list(x = "topleft", bty = "n"),
    ylim = c(0, 500),
    density = 30,
    col = c("green", "blue", "red"),
    main = "Number of employees by gender and job category"
)

barplot(tab2,
    legend.text = TRUE,
    args.legend = list(x = "top", bty = "n"),
    ylim = c(0, 340),
    density = 30,
    col = c("green", "blue", "red"),
    main = "Number of employees by gender and job category",
    beside = TRUE
)

#
# ------------------------------------------------------ EJERCICIO PROPUESTO -----
#

airquality
attach(airquality)
table(Ozone)

# 1)
hist(Ozone, breaks = 10, freq = FALSE)

# 2)
curve(
    dnorm(x, mean = mean(Ozone, na.rm = TRUE), sd = sd(Ozone, na.rm = TRUE)),
    add = TRUE,
    col = "red"
)

# No parece que se ajuste especialmente bien. Es similar al ejercicio anterior.

# 3)
qqnorm(Ozone)
# Podemos comprobarlo con el test de shapiro:
shapiro.test(Ozone)

# 4)
boxplot(Ozone)

# Podemos ver que hay un par de outliers y que el rango intercuartil es algo elevado.
# Por el resto, no se aprecia nada especialmente importante.

# 5)
boxplot(Ozone ~ airquality$Month)

# En los meses de julio y agosto, el nivel de contaminación de Ozono es mayor.
# Por el contrario, en mayo, junio y septiembre bajan considerablemente, a excepción de unas pocas muestras que se podrían considerar outliers. Además, la desviación estándar es considerablemente baja en esos meses.

plot(Ozone, Wind)
abline(lm(Wind ~ Ozone), col = "blue")
# Podemos ver que existe una dependencia (aunque ligera) entre ambas variables: cuanto mayor es el viento, menor es la cantidad de Ozono.

plot(Ozone, Temp)
abline(lm(Temp ~ Ozone), col = "blue")
# Algo similar pasa con la temperatura. Sin embargo, el tipo de ajuste no parece ser lineal, sino logarítmico.