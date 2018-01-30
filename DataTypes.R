#Vectors
vex <- c(1,5,3)
vex
vex <- c(1 + 2i,4,5)
vex
vex <- c(TRUE,1,0,1)
vex
vex <- c("This","That",1)
vex[1]
#Matrices
v1 <- c(0:4)
v2 <- c(5:9)
mat1 <- matrix(c(v1,v2))
mat1
mat1 <- matrix(c(v1,v2),nrow=2)
mat1
mat2 <- matrix(c(v1,v2),ncol=2)
mat1*mat2
mat3 <- mat1%*%mat2
mat3[1,2]
#Dataframes
df <- data.frame(Bool = sample(c(TRUE,FALSE),100,replace=T),Int = c(1:100),String=sample(LETTERS,100,replace=TRUE))
df$Bool
df[df$Bool,]
df[df$Bool,3]
df$String[df$Bool]
df$NewVar <- c(1:101)
df$NewVar <- c(1:99)
#Lists
ls <- list(Bool = sample(c(TRUE,FALSE),50,replace=T),Int = c(1:75),String=sample(LETTERS,100,replace=TRUE))
ls$String
ls[[3]]
ls[[4]] <- df
ls[[4]]
ls[[4]][2:5,1]
names(ls)
