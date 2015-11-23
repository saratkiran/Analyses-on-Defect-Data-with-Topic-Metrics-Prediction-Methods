setwd("/home/saratkiran/Desktop/CS6890/project 3/pde")

aic.value = function(pca, bug, k) {
  res = rep(0, k)
  for (i in 1:k) {
    dat = data.frame(bug = bug, pca[,1:i])
    mod = lm(bug ~ ., data = dat)
    res[i] = AIC(mod)
  }
  res
}

cval = function (dat, model, predicator, rseed = 0723)
{
  set.seed(rseed)
  fun = match.fun(model)
  mae =  rcor = rep(0,30)
  n= nrow(dat)
  for (i in 1:30)
  {
    test = sample.int(n,n*0.2)
    mod = fun ( predicator, data = dat[-test,] )
    pred = predict (mod,dat[test,])
    actual = dat[test,]$bug
  
    rcor[i] = cor.test(pred,actual,method = 'spearman')$estimate
  }
   avg.rcor = mean(rcor)
  rcor
}

cor.pca = function(pca, bug, k) {
  res = rep(0, k)
  for (i in 1:k) {
    dat = data.frame(bug = bug, pca[,1:i])
    # training and predicting 30%
    cval.res = cval(dat, lm, bug ~ .)
    res[i] = cval.res
  }
  res
}


work.dir <- setwd("/home/saratkiran/Desktop/CS6890/project 3/equinox")
directory = "pde"
    intitial_value = 5
    while (intitial_value <=100)
    {
      setwd("/home/saratkiran/Desktop/CS6890/project 3/pde")
      CSV.name <- paste("topic",intitial_value,"log.csv",sep="")
      print (CSV.name)
      topic.file = read.csv(file = CSV.name,header = TRUE, row.names=1, sep=",")
      intitial_value_1 = 1+intitial_value
      find.pca = aic.value(princomp(topic.file[,1:intitial_value])$scores,topic.file$bug,intitial_value)
      find.pca.combined = aic.value(princomp(topic.file[,-intitial_value_1])$scores,topic.file$bug,intitial_value+3)
      find.loc = AIC (lm(bug ~ loc, topic.file))
      find.bf = AIC (lm(bug ~ bf, topic.file))
      find.hcm = AIC (lm(bug ~ hcm, topic.file))
      find.pca.cor = cor.pca(princomp(topic.file[,1:intitial_value])$scores,topic.file$bug,intitial_value)
      find.pca.combined.cor = cor.pca(princomp(topic.file[,-intitial_value_1])$scores,topic.file$bug,intitial_value+3)
      find.pca.min = min (find.pca)
      find.pca.combined.min = min(find.pca.combined)
      find.loc.min = min (find.loc)
      find.bf.min = min (find.bf)
      find.hcm.min = min (find.hcm)
      find.pca.cor.max = max(find.pca.cor)
      find.pca.combined.cor.max = max (find.pca.combined.cor)
      find.pca.which = which.min (find.pca)
      find.pca.combined.which = which.min(find.pca.combined)
      find.loc.which = which.min (find.loc)
      find.bf.which = which.min (find.bf)
      find.hcm.which = which.min (find.hcm)
      find.pca.cor.which = which.max(find.pca.cor)
      find.pca.combined.cor.which = which.max(find.pca.combined.cor)
      topic.loc.cor = max(cval(topic.file, lm, bug ~ loc))      
      topic.bf.cor = max(cval(topic.file, lm, bug ~ bf))      
      topic.hcm.cor = max(cval(topic.file, lm, bug ~ hcm))
      
      find.name  <- cbind (find.pca.min,find.pca.combined.min, find.loc.min, find.bf.min, find.hcm.min,
                          find.pca.cor.max,find.pca.combined.cor.max,topic.loc.cor,topic.bf.cor,topic.hcm.cor,
                          find.pca.which, find.pca.combined.which, find.loc.which,find.bf.which,find.hcm.which,
                          find.pca.cor.which,find.pca.combined.cor.which,CSV.name,directory)         
      
     
      write.table(find.name,file = "sarat.csv",sep = ",",na = "NA",append = TRUE,col.names=FALSE)
      intitial_value = intitial_value+5
    }    

    


