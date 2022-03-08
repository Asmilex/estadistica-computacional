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