---
title: "Práctica 9"
date: "12 de mayo de 2022"
author: "Andrés Millán"
documentclass: scrreprt
geometry:
- top=1.5in
- bottom=1in
- right=1in
- left=1in

numbersections: true

mainfont: 'Crimson Pro'
fontsize: 12pt
monofont: 'JuliaMono'
monofontoptions:
 - Scale=0.6
header-includes:
 - \usepackage{fvextra}
 - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
urlcolor: blue

output:
  html_document:
    toc: true
    toc_depth: 3
    toc_float: true
    number_sections: true
    theme: united
    highlight: tango

  pdf_document:
    toc: true
    toc_depth: 3
    number_sections: true
    highlight: tango
---

# Lectura y exploración del dataset


```r
hatco <- read.csv(
  "csv/hatco2.csv",
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
```

```
## 'data.frame':	100 obs. of  15 variables:
##  $ empresa   : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ tamano    : Factor w/ 2 levels "grande","pequeña": 2 1 1 1 2 1 2 1 2 1 ...
##  $ adquisic  : Factor w/ 2 levels "centralizada",..: 2 1 1 1 2 1 2 1 2 1 ...
##  $ tindustr  : Factor w/ 2 levels "clase A","otras industrias": 1 2 1 1 1 1 1 2 1 2 ...
##  $ tsitcomp  : Factor w/ 3 levels "nueva tarea",..: 1 1 3 1 2 3 1 3 2 3 ...
##  $ velocidad : num  4.1 1.8 3.4 2.7 6 1.9 4.6 1.3 5.5 4 ...
##  $ precio    : num  0.6 3 5.2 1 0.9 3.3 2.4 4.2 1.6 3.5 ...
##  $ flexprec  : num  6.9 6.3 5.7 7.1 9.6 7.9 9.5 6.2 9.4 6.5 ...
##  $ imgfabri  : num  4.7 6.6 6 5.9 7.8 4.8 6.6 5.1 4.7 6 ...
##  $ servconj  : num  2.4 2.5 4.3 1.8 3.4 2.6 3.5 2.8 3.5 3.7 ...
##  $ imgfvent  : num  2.3 4 2.7 2.3 4.6 1.9 4.5 2.2 3 3.2 ...
##  $ calidadp  : num  5.2 8.4 8.2 7.8 4.5 9.7 7.6 6.9 7.6 8.7 ...
##  $ fidelidad : num  32 43 48 32 58 45 46 44 63 54 ...
##  $ nfidelidad: Factor w/ 3 levels "alto","bajo",..: 3 3 3 3 1 3 3 3 1 1 ...
##  $ nsatisfac : Factor w/ 2 levels "alto","bajo": 2 2 1 2 1 2 1 2 1 1 ...
```

```r
summary(hatco)
```

```
##     empresa           tamano              adquisic 
##  Min.   :  1.00   grande :40   centralizada   :50  
##  1st Qu.: 25.75   pequeña:60   descentralizada:50  
##  Median : 50.50                                    
##  Mean   : 50.50                                    
##  3rd Qu.: 75.25                                    
##  Max.   :100.00                                    
##              tindustr                 tsitcomp 
##  clase A         :50   nueva tarea        :34  
##  otras industrias:50   recompra directa   :34  
##                        recompra modificada:32  
##                                                
##                                                
##                                                
##    velocidad         precio         flexprec     
##  Min.   :0.000   Min.   :0.200   Min.   : 5.000  
##  1st Qu.:2.500   1st Qu.:1.475   1st Qu.: 6.700  
##  Median :3.400   Median :2.150   Median : 8.050  
##  Mean   :3.515   Mean   :2.364   Mean   : 7.894  
##  3rd Qu.:4.600   3rd Qu.:3.225   3rd Qu.: 9.100  
##  Max.   :6.100   Max.   :5.400   Max.   :10.000  
##     imgfabri        servconj        imgfvent    
##  Min.   :2.500   Min.   :0.700   Min.   :1.100  
##  1st Qu.:4.575   1st Qu.:2.400   1st Qu.:2.200  
##  Median :5.000   Median :3.000   Median :2.600  
##  Mean   :5.248   Mean   :2.916   Mean   :2.665  
##  3rd Qu.:6.000   3rd Qu.:3.425   3rd Qu.:3.000  
##  Max.   :8.200   Max.   :4.600   Max.   :4.600  
##     calidadp        fidelidad     nfidelidad nsatisfac
##  Min.   : 3.700   Min.   :25.00   alto :33   alto:45  
##  1st Qu.: 5.800   1st Qu.:39.00   bajo : 3   bajo:55  
##  Median : 7.150   Median :46.50   medio:64            
##  Mean   : 6.971   Mean   :46.11                       
##  3rd Qu.: 8.325   3rd Qu.:53.25                       
##  Max.   :10.000   Max.   :65.00
```


```r
plot(hatco[, c(6:13)])
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)
Matices que observamos: parece que algunas de las variables son linealmente dependientes. Este sería el caso de

- `imgfvent` y `imgfabri`.
- `velocidad` y `nfidelidad`.
- `fidelidad` y `servconj`.

En general, parece que la fidelidad será útil a la hora de explicar el resto de variables.

# Modelos de regresión lineal


```r
mod1 <- lm(
  fidelidad ~ velocidad + precio + flexprec + imgfabri + servconj + imgfvent + calidadp,
  hatco
)
mod1
```

```
## 
## Call:
## lm(formula = fidelidad ~ velocidad + precio + flexprec + imgfabri + 
##     servconj + imgfvent + calidadp, data = hatco)
## 
## Coefficients:
## (Intercept)    velocidad       precio     flexprec  
##   -10.16148     -0.04352     -0.67891      3.36197  
##    imgfabri     servconj     imgfvent     calidadp  
##    -0.04101      8.34537      1.29147      0.56295
```

```r
summary(mod1)
```

```
## 
## Call:
## lm(formula = fidelidad ~ velocidad + precio + flexprec + imgfabri + 
##     servconj + imgfvent + calidadp, data = hatco)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -12.9759  -1.9491   0.5896   2.8144   6.7565 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -10.16148    4.97696  -2.042   0.0440 *  
## velocidad    -0.04352    2.01273  -0.022   0.9828    
## precio       -0.67891    2.09025  -0.325   0.7461    
## flexprec      3.36197    0.41125   8.175 1.56e-12 ***
## imgfabri     -0.04101    0.66683  -0.061   0.9511    
## servconj      8.34537    3.91830   2.130   0.0359 *  
## imgfvent      1.29147    0.94720   1.363   0.1761    
## calidadp      0.56295    0.35544   1.584   0.1167    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 4.424 on 92 degrees of freedom
## Multiple R-squared:  0.775,	Adjusted R-squared:  0.7578 
## F-statistic: 45.26 on 7 and 92 DF,  p-value: < 2.2e-16
```

```r
anova(mod1)
```

```
## Analysis of Variance Table
## 
## Response: fidelidad
##           Df Sum Sq Mean Sq  F value    Pr(>F)    
## velocidad  1 3659.8  3659.8 187.0071 < 2.2e-16 ***
## precio     1  927.9   927.9  47.4128 6.932e-10 ***
## flexprec   1 1346.3  1346.3  68.7912 8.779e-13 ***
## imgfabri   1  100.4   100.4   5.1311   0.02585 *  
## servconj   1   71.5    71.5   3.6517   0.05913 .  
## imgfvent   1   44.9    44.9   2.2963   0.13311    
## calidadp   1   49.1    49.1   2.5084   0.11667    
## Residuals 92 1800.5    19.6                       
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Con un nivel de significación del 5%, podemos decir que las únicas variables que sí parecen tener influencia son: `flexprec`, `servconj`. Son las únicas variables cuyo p-valor se queda por debajo del 0.05. Sin embargo, no podemos obviar las otras variables, pues este test no es suficiente para (des)confirmar su influencia.

En este caso, su p-valor es de 0.044. Por tanto, con un nivel de significación del 5%, obtendríamos que no podemos prescindir del término. Sin embargo, con un n.s. del 1%, sí que aceptamos la hipótesis nula.



```r
residuos <- rstandard(mod1)
y_gorritos <- mod1$fitted.values

plot(y_gorritos, residuos)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png)

No parece que podamos distiguir ninguna forma en particular, así que podemos asumir que no hay patrones no aleatorios.


```r
plot(hatco$empresa, residuos)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png)

Tampoco podemos observar patrones no aleatorios, lo cual es una buena señal.


```r
library("lmtest")
dwtest(mod1)
```

```
## 
## 	Durbin-Watson test
## 
## data:  mod1
## DW = 1.8924, p-value = 0.3179
## alternative hypothesis: true autocorrelation is greater than 0
```


```r
ks.test(y_gorritos, residuos)
```

```
## Warning in ks.test(y_gorritos, residuos): p-value will be
## approximate in the presence of ties
```

```
## 
## 	Two-sample Kolmogorov-Smirnov test
## 
## data:  y_gorritos and residuos
## D = 1, p-value < 2.2e-16
## alternative hypothesis: two-sided
```

```r
qqnorm(y_gorritos)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)

```r
qqnorm(residuos)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-2.png)
