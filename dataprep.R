#neural network project 

#author: Dhivya Govindarajan 
#author: Bhakti Bhadrecha 
#author: Jaydeep Untwal 

#date: Nov 5 2015 


setwd("~/Desktop/neuralnet") #set working directory

#load data 
misused<-read.csv('misused_shuffle.csv')
#anamoly<-read.csv('anamoly_shuffle.csv')


#change factor to character
misused$Class<-as.character(misused$Class)
#anamoly$Class<-as.character(anamoly$Class)


attacks<-data.frame(unique(misused$Class))
colnames(attacks)<-c('Class')



#data preperation 
int_class<-c('Neptune','Satan','Smurf','PortSweep','IPSweep')


r<-list()

for (i in 1:5)
{
  chk<-misused
  
  id<-which(chk$Class!=int_class[i])
  chk$Class[id]<-paste0('Not',int_class[i])
  filename<-paste0(int_class[i],'.csv')
  write.csv(chk,filename)
  
  
  input<-as.matrix(chk[,-42])
  output<-as.character(chk$Class)
  
  f1<-paste0('input_',int_class[i],'.txt')
  f2<-paste0('output_',int_class[i],'.txt')
  
  write.table(input, f1, sep="\t")
  write.table(output, f2, sep="\t")
  
}


chk<-misused
#replace<-paste0('Not',int[i])
chk$Class[!chk$Class %in% int_class]<-c('Other')
write.csv(chk,'Special.csv')

input<-as.matrix(chk[,-42])
output<-as.character(chk$Class)


write.table(input, "input_Special.txt", sep="\t",row.names = FALSE,col.names = FALSE)
write.table(output, "output_Special.txt", sep="\t",row.names = FALSE,col.names = FALSE)









