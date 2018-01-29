library('httr')
library('rjson')
library('stringr')

preamble <- 'https://maps.googleapis.com/maps/api/place/textsearch/json?'
key <- 'key=yourkeyhere'


for(i in 1:length(dataset[,1])) {
	dataset[i,] <- tryCatch(qgoogle(dataset[i,]),
	error = function(err){ 
		print(paste("ERROR:  ",err))
	})		
}

qgoogle <- function(vex){
  name <- str_replace_all(vex$BUSINESS," ","+")
  line_two <- str_replace_all(vex$BUSINESS2," ","+")
  city <- str_replace_all(vex$CITY," ","+")
  addr <- str_replace_all(vex$CLEANADDRE," ","+")
  if(line_two == ""){
    query <- paste(name,addr,city,state,sep="+")
  }else{
    query <- paste(name,line_two,addr,city,state,sep="+")
  }
  url <- paste(preamble,'&',"query=",query,'&',key,sep = "")
  json.obj <- GET(url)
  content <- content(json.obj)
  
  if(content$status != "ZERO_RESULTS") {
    vex$DATA <- TRUE
    vex$DATA.WITH.ADDRESS <- TRUE
    vex$NAME <- content$results[[1]]$name
    vex$ADDR <- content$results[[1]]$formatted_address
    vex$LAT <- content$results[[1]]$geometry$location$lat
    vex$LONG <- content$results[[1]]$geometry$location$lng
    if(length(content$results[[1]]$types) != 0){
      vex$TYPE <- content$results[[1]]$types[[1]]
    }
    if(length(content$results[[1]]$permanently_closed) != 0){
      vex$CLOSED <- "Permanently Closed"
    }
  } else { 
    vex$NAME <- NA
    vex$ADDR <- NA
    vex$LAT <- NA
    vex$LONG <- NA
    vex$TYPE <- NA
    vex$CLOSED <- NA
    vex$DATA <- FALSE
    vex$DATA.WITH.ADDRESS <- FALSE
  }
  return(vex)
}




