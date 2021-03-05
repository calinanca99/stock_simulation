drift = 2.5
n = 3
k = 1000

x0 = matrix(0, nrow = n, ncol = k)
x0[1,1] = runif(1, 75, 125)
x0[2,1] = runif(1, 75, 125)
x0[3,1] = runif(1, 75, 125)

for (i in 1:n) {
  for (j in 2:k) {
    eps = runif(1,0,1)
    if (eps >= 0.5) {
      x0[i,j] = x0[i,j-1] + drift
    }
    else{
      x0[i,j] = x0[i,j-1] - drift
    }
  }
}



plot(1:k, x0[1,], xlab = "Days", ylab = "Close value", type = "l", ylim = c(min(x0[c(1:3),])-10, max(x0[c(1:3),])+10))
points(1:k, x0[2,], type = "l", col = "red")
points(1:k, x0[3,], type = "l", col = "yellow")
legend("topleft", legend = c("Stock A", "Stock B", "Stock C"),
       col = c("red", "yellow", "black"), lty=1, cex=0.8)