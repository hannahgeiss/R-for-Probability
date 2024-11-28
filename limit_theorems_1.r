K <- 100000   # Number of samples, other loop
N <- 10000    # Number of independent random variables, inner loop
D <- 1:K      # Sample vector
S <- 1:N      # Sum of random variables 
W <- 1:N      # Renormalizes sum of random variables
T <- 1:N      # Number of step in the computation of the sum

# Choice of the limit theorem
param <- 1 # 0 for SLLN 
           # 1 for CLT
if (param == 0)
	{sigma <- 1/N}
if (param == 1)
	{sigma <- 1/sqrt(N)}

# The computation
for(k in 1:K){
N <- 1000
f <- 2*rbinom(n=N,size=1,prob=0.5) - 1
S[1] <- f[1]
for (i in 2:N){S[i] <- S[i-1] + f[i]}
for (i in 1:N){W[i] <- sigma * S[i]}
for (i in 1:N){T[i] <- i}
plot(T,W,type="l",col="blue1",lwd=0.3)
if (param == 0)
	title( "Strong Law of Large Numbers" , cex.main=1, font.main=1 )
if (param == 1)
	title( "Central Limit Theorem" , cex.main=1, font.main=1 )
D[k] <- W[N]
}

# Output histogram
if (param == 0)
   hist(D,main="Histogram for Strong Law of Large Numbers")
if (param == 1)
   hist(D,main="Histogram for Central Limit Theorem")


