#' generate a histogram by survey data 
#' @param df: data.table
#' @param cname: the column names of histogram
#' @param title: title of histogram
#' @return the histogram object
#' 

myHist <- function(p1, label, title){
#  p1 <- ggplot(data=df, aes(cname)) 
  p1 <- p1 + geom_histogram(breaks=seq(0, 100, by =3), col="skyblue", aes(fill=..count..)) 
  p1 <- p1 + scale_fill_gradient("Count", low = "skyblue", high = "blue")
  p1 <- p1 +  labs(title=title) + labs(x=label, y="Count") 
  p1
}

