# For a direct output to the screen comment out the commands 
# pdf("lil.pdf") and dev.off(). Otherwise your output will be lil.pdf.

pdf("lil.pdf")

N <- 1000000               # Number of independent random variables, inner loop
K <- 1000                  # Number of realizations
S <- 1:N                   # Sum of random variables 
T <- 1:N                   # Number of step in the computation of the sum
U <- 1:N                   # Upper bound
L <- 1:N                   # Lower bound
B <- sqrt(2*N*log(log(N))) # Upper and lower bound for the graph 

for (i in 3:N){L[i] <- - sqrt(2*i*log( log(i)))}
for (i in 3:N){U[i] <-   sqrt(2*i*log( log(i)))}
plot(T,U,type="l",col="red1",lwd=0.5,ylim=c(-B,B))
lines(T,L,type="l",col="red1",lwd=0.5)

for (k in 1:K){
f <- 2*rbinom(n=N,size=1,prob=0.5) - 1
S[1] <- f[1]
for (i in 2:N){S[i] <- S[i-1] + f[i]}
lines(T,S,type="l",col="blue1",lwd=0.1)
}

title( "Law of Iterated Logarithm" , cex.main=1, font.main=1 )

dev.off()