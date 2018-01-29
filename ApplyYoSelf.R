df <- data.frame(Strings=sample(c("This","That","The Other"),1000000,replace=T),
                 Values=sample(c(0:4),1000000,replace=T),Result = rep("DA",1000000))

for(i in 1:length(df[,1])){
  if(df$Strings[i] == "This"){
    if(df$Values[i] > 2){
      df$Results[i] <- "CP"
      next
    }else{
      df$Results[i] <- "QM"
    }
  }else if(df$Strings[i] == "That"){
    df$Results[i] <- "BS"
    next
  }else if(df$Strings[i] == "The Other"){
   if(df$Values[i] == 4){
     df$Results[i] <- "FP"
     next
  }else{
    df$Results[i] <- "DT"
  }
  }
}

applyF <- function(vex){
  if(vex[1] == "This"){
    if(vex[2] > 2){
      return("CP")
    }else{
      return("QM")
    }
  }else if(vex[1] == "That"){
    return("BS")
  }else if(vex[1] == "The Other"){
    if(vex[2] == 4){
      return("FP")
    }else{
      return("DT")
    }
  }
}
results <- apply(df,1,applyF)
df$Result <- factor(unlist(results))


df2 <- data.frame(A=sample(as.character(c(1:100)),1000,replace=T),B=sample(as.character(c(1:100)),1000,replace=T),
           C=sample(as.character(c(1:100)),1000,replace=T),D=sample(as.character(c(1:100)),1000,replace=T),
           E=sample(as.character(c(1:100)),1000,replace=T),F=sample(as.character(c(1:100)),1000,replace=T))
df2[,1:6] <- apply(df2,1,as.numeric)

vars <- apply(df2,1,var) 
vars

