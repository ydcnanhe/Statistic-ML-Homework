################################################################################
#### refererence
#### [1] http://homepages.math.uic.edu/~jyang06/stat494/R/3_2_1.r
#### [2] https://rdrr.io/cran/ElemStatLearn/man/prostate.html
##################################################################################
##################################################################################
# load the pacakage
library(ElemStatLearn)
# load dataset
data(prostate)
str(prostate)
table(prostate$train)
# partition the data into train and test
train <- subset(prostate,train==TRUE)[,1:9]
test <- subset(prostate,train==FALSE)[,1:9]
# visualize correlation reproduce Fig 1.1.
pairs(prostate[,1:9],col="violet")
# quantitate corr in train reproduce Table 3.1.
round(cor(train[,1:8]),3)
#############################################################################
################## fit linear model on train data using OLS #################
#############################################################################
trainst <- train
# normalize
for(i in 1:8){
  # original codes
  trainst[,i] <- trainst[,i] - mean(prostate[,i])
  trainst[,i] <- trainst[,i]/sd(prostate[,i])
  # I prefer not to use prostate but train since assume we have no info of test
  # but to reproduce the result in book, we use prostate here
  #trainst[,i] <- trainst[,i] - mean(train[,i])
  #trainst[,i] <- trainst[,i]/sd(train[,i])
}
# fits
fitls <- lm( lpsa ~ lcavol+lweight+age+lbph+svi+lcp+gleason+pgg45, data=trainst)
# reproduce Table 3.2
summary(fitls)
###################################################################
######################## SUBSECTION ##############################
###################################################################
# load pacakge
library(leaps)
# fit subset selection
fitleaps <- regsubsets( lpsa ~ . , data=trainst, nbest=70, #all!
                        really.big=TRUE )
# summary
fitleaps.sum <- summary(fitleaps)
fitleaps.models <- fitleaps.sum$which
fitleaps.models.size <- as.numeric(attr(fitleaps.models,'dimnames')[[1]])
hist(fitleaps.models.size)
fitleaps.models.rss <- fitleaps.sum$rss
fitleaps.models.best.rss <- 
  tapply( fitleaps.models.rss, fitleaps.models.size, min )
fitleaps.models.best.rss
# visualize
fitdummy <- lm( lpsa ~ 1, data=trainst )
fitleaps.models.best.rss <- c(
  sum(resid(fitdummy)^2), 
  fitleaps.models.best.rss)
plot( 0:8, fitleaps.models.best.rss, ylim=c(0, 100), 
      type="b", xlab="subset size", ylab="Residual Sum Square", 
      col="red2" )
points( fitleaps.models.size, fitleaps.models.rss, pch=17, col="brown",cex=0.7 )

#######################################################################
################################ RIDGE #################################
########################################################################
fitridge <- simple.ridge(trainst[,1:8], trainst[,9],df=1:8)
# coefficient trace
matplot( fitridge$df, t(fitridge$beta), type="b", 
         col="blue", pch=17, ylab="coefficients" )
#########################################################################
################################ LASSO ##################################
##########################################################################
# load pacakage
library(lasso2)
fitlasso <- l1ce(lpsa~., data = trainst,trace=TRUE, sweep.out=~1,
                 bound=seq(0,1,by=0.1))
fitlasso.coef <- sapply(fitlasso, function(x) x$coef)
colnames(fitlasso.coef) <- seq( 0,1,by=0.1 )
matplot( seq(0,1,by=0.1), t(fitlasso.coef[-1,]), type="b", 
         xlab="shrinkage factor", ylab="coefficients", 
         xlim=c(0, 1.2), col=c(1:8), pch=(15:22) )
names = c('lcavol','lweight','age','lbph','svi','lcp','gleason','pgg45')
legend("topright", inset=0.01, legend=names, col=c(1:8),pch=(15:22),
       bg= ("white"), horiz=F)
