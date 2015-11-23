setwd ("/home/saratkiran/Desktop/CS6890/project 3")

corr.result = function(dat, k) {
  res = rep(0, k)
  for (i in 1:k) res[i] = cor.test(dat[,i], dat$bug, method = 'spearman')$estimate
  res
}

files = c("topic10log.csv","topic20log.csv","topic50log.csv","topic100log.csv")
 
    setwd("/home/saratkiran/Desktop/CS6890/project 3/pde")
    csvfile = dir(getwd(),pattern=".csv",recursive=TRUE)
    for(each in csvfile)
    {
      if (each %in% files)
      {
        print(each) 
        each.csv = read.csv(file = each,header = TRUE, row.names=1, sep=",")
        if (each =="topic10log.csv")
          topic10log = corr.result(each.csv,10)
        else if (each =="topic20log.csv")
          topic20log = corr.result(each.csv,20)      
        else if (each =="topic50log.csv")
          topic50log = corr.result(each.csv,50)
        else if (each =="topic100log.csv")
          topic100log = corr.result(each.csv,100)       
      }
    }
    
boxplot(topic10log,topic20log,topic50log,topic100log,ylab="Spearman Correlation",xlab="Number of topics",main="PDE",col=c("salmon","yellowgreen","grey51","powderblue"),names=c('10','20','50','100'))




