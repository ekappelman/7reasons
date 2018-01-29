testF <- function(x,y){
  if(length(x) == length(y)){testF1(x,y)}
}
testF1 <- function(x,y){
    print(cbind(x,y))
}
x <- c(1:10)
y <- c(11:21)
testF(x,y)


# debug(testF)
# testF(x,y)
# debugging in: testF(x, y)
# debug at #1: {
# if (length(x) == length(y)) {
#   testF1(x, y)
# }
# }
# Browse[2]> ls()
# [1] "x" "y"
# Browse[2]> x
# [1]  1  2  3  4  5  6  7  8  9 10
# Browse[2]> length(x)
# [1] 10
# Browse[2]> length(y)
# [1] 11
# Browse[2]> undebug(testF)
# Browse[2]> Q