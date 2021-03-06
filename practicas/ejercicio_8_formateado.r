#'
#' ------------------------------------------------------------ VIII ----------
#'   :::::: P R A C T I C A   8 : :  :   :    :     :        :          :
#' ----------------------------------------------------------------------
#'
#' Autor: Andrés Millán

hatco <- read.csv(
    "./practicas/csv/hatco2.csv",
    colClasses = c(
        "tamano"     = "factor",
        "adquisic"   = "factor",
        "tindustr"   = "factor",
        "tsitcomp"   = "factor",
        "nfidelidad" = "factor",
        "nsatisfac"  = "factor"
    )
)
str(hatco)
summary(hatco)

#' --------------------------------------------------------------------------------

plot(hatco[, c(6:13)])

#' Matices que observamos:
#' Parece que algunas de las variables son linealmente dependientes. Este sería el caso de
#'  -> imgfvent y imgfabri
#'  -> velocidad y nfidelidad
#'  -> fidelidad y servconj
#' En general, parece que la fidelidad será útil a la hora de explicar el resto de variables.

#' --------------------------------------------------------------------------------

mod1 <- lm(
    fidelidad ~ velocidad + precio + flexprec + imgfabri + servconj + imgfvent + calidadp,
    hatco
)
mod1

summary(mod1)

anova(mod1)

#' --------------------------------------------------------------------------------

#' Con un nivel de significación del 5%, podemos decir que las únicas variables que sí parecen tener influencia son:
#'   flexprec, servconj
#' Son las únicas variables cuyo p-valor se queda por debajo del 0.05.
#' Sin embargo, no podemos obviar las otras variables, pues este test no es suficiente para (des)confirmar su influencia.

#' --------------------------------------------------------------------------------

#' En este caso, su p-valor es de 0.044. Por tanto, con un nivel de significación del 5%, obtendríamos que no podemos prescindir del término.
#' Sin embargo, con un n.s. del 1%, sí que aceptamos la hipótesis nula.

#' --------------------------------------------------------------------------------

residuos <- rstandard(mod1)
y_gorritos <- mod1$fitted.values

plot(y_gorritos, residuos)

#' No parece que podamos distiguir ninguna forma en particular, así que podemos asumir que no hay patrones no aleatorios.

plot(hatco$empresa, residuos)

#' Tampoco podemos observar patrones no aleatorios, lo cual es una buena señal.
library("lmtest")
dwtest(mod1)

#' --------------------------------------------------------------------------------

ks.test(y_gorritos, residuos)