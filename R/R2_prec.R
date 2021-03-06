#'Compute Precision Analyses for R-Squared
#'This approach simply loops a function from MBESS
#'@param R2 R-squared
#'@param pred Number of Predictors
#'@param nlow starting sample size
#'@param nhigh ending sample size
#'@param by Incremental increase in sample (e.g. nlow = 10, nhigh = 24, by = 2, produces estimates of 10, 12, and 14)
#'@param ci Type of Confidence Interval (e.g., .95)
#'@examples
#'R2_prec(R2=.467, nlow=24, nhigh=100, pred=3, by=4)
#'@return Precision Analyses for R-Squared
#'@export
#'

R2_prec<-function(R2,nlow, nhigh, pred, ci=.95, by=1)
{
    for(n in seq(nlow,nhigh, by)){
    df1<-pred
    df2<-n-pred-1
    a<-MBESS::ci.R2(R2=R2, df.1=df1,df.2=df2, conf.level = .95, Random.Predictors = FALSE)
    ll<-a[1]
    ul<-a[3]
    ll<-round(as.numeric(ll),4)
    ul<-round(as.numeric(ul),4)
    print(paste("n=",n,"R2 = ",R2,",LL = ",ll,",UL = ",ul,",precision = ",ul-ll ))}}
