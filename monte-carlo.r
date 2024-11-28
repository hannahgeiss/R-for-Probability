K <- 10000   # Number of samples, other loop
N <- 10000    # Number of independent random variables, inner loop
T <- 1:N      # Discretization of the x values when plotting the function
X <- 1:K      # Random x-values
Y <- 1:K      # Random y-values


for (i in 0:N){
	F[i] <- (cos(4*pi*i/N) + 1)/2
	T[i] <- i/N}
X <- runif(K, min = 0, max = 1)
Y <- runif(K, min = 0, max = 1)
plot(T,F,type="l",col="blue1",lwd=0.3)
title( "Monte Carlo method" , cex.main=1, font.main=1 )
I <- 0
for (k in 1:K){
	if (Y[k] <=  (cos(4*pi* X[k]) + 1)/2) 
{points(X[k],Y[k],type="p",col="blue1",lwd=1.1)
	I <- I+1}
}
I <- I/K
text(.7,1,"Integral equals")
text(.95,1,I)




