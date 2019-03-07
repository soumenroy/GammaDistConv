options(warn=1)

fname = "shape_rate.txt"
d = read.table(fname, sep=" ")
library(coga)
# Correctness check
set.seed(123)
## do grid
n = 200
y <- rcoga(100000, c(d[1:n, 1]), d[1:n, 2])
grid <- seq(150, 500, length.out=2000)

## calculate pdf and cdf
pdf <- dcoga(grid, shape=c(d[1:n, 1]), rate=d[1:n, 2])
cdf <- pcoga(grid, shape=c(d[1:n, 1]), rate=d[1:n, 2])

jpeg('rplot3.jpg')
## plot pdf
plot(density(y), col="blue",  lwd = 2)
lines(grid, pdf, col="red", lwd=4)
grid()
abline(v=(755.6), col="green", lty="dashed")
dev.off()
