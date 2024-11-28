N <- 10000   # Number of discretization points for draw the circle
K <- 1000   # Number of sample points

for (i in 0:N){
	X[i] <- cos(4*pi*i/N)
	Y[i] <- sin(4*pi*i/N)
	}

plot(X,Y,type="l",col="blue1",lwd=0.3)
title( "Monte Carlo method to compute Pi" , cex.main=1, font.main=1 )

A <- runif(K, min = -1, max = 1)
B <- runif(K, min = -1, max = 1)

I <- 0

for (k in 1:K){
	if (A[k]^2 + B[k]^2 <= 1) 
    {points(A[k],B[k],type="p",col="blue1",lwd=1.1)
	I <- I+1}
    }

I <- 4 * I/K

text(.6,1,"Pi approximately = ")
text(.95,1,I)


