###combining both points for and against in a scatter and boxplot diagrams
attach(ceps)
opar <- par(no.readonly = TRUE)
par(fig=c(0,0.8,0,0.8))
plot(pts.for,pts.agn, xlab="Points For",
     ylab="Points Against")

par(fig=c(0,0.8,0.55,1), new=TRUE)
boxplot(pts.for, horizontal = TRUE,
        axes=FALSE)

par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(pts.agn, axes=FALSE)
mtext("Points For and Against Spread",side=3, outer=TRUE,
      line=-3)
par(opar)

# mixed graph of "2-Point field goal 
opar <- par(no.readonly = TRUE)
par(fig=c(0,0.8,0,0.8))
plot(x2pa,x2pm, xlab="number of 2-point attempt ",
     ylab="number of 2-point made")

par(fig=c(0,0.8,0.55,1), new=TRUE)
boxplot(x2pa, horizontal = TRUE,
        axes=FALSE)

par(fig=c(0.7,1,0,0.8),new=TRUE)
boxplot(x2pm, axes=FALSE)
mtext(" 2-point Field Goal Spread ",side=3, outer=TRUE,
      line=-3)
par(opar)

##graph showing total number  3 points
opar <- par(no.readonly = TRUE)
par(fig=c(0,0.8,0,0.8))
plot(x3pa,x3pm, xlab="number of 3-point attempts ",
     ylab="number of 3 points made")

par(fig=c(0,0.8,0.55,1), new=TRUE)
boxplot(x3pa, horizontal = TRUE,
        axes=FALSE)

par(fig=c(0.7,1,0,0.8),new=TRUE)
boxplot(x3pm, axes=FALSE)
mtext("3-Point Field Goal Spread ",side=3, outer=TRUE,
      line=-3)
par(opar)

##graph showing Freethrows Attempted and Made 
opar <- par(no.readonly = TRUE)
par(fig=c(0,0.8,0,0.8))
plot(fta,ftm, xlab="Freethrows Attempted ",
     ylab="Freethrows made")

par(fig=c(0,0.8,0.55,1), new=TRUE)
boxplot(fta, horizontal = TRUE,
        axes=FALSE)

par(fig=c(0.7,1,0,0.8),new=TRUE)
boxplot(ftm, axes=FALSE)
mtext("Free Throws Spread  ",side=3, outer=TRUE,
      line=-3)
par(opar)


# boxplots of 0.reb, d.reb,Steal, Assists, Turnovers and block
opar <- par(no.readonly = TRUE)
par(mfrow=c(3,2))
boxplot(o.reb, xlab="offensive rebound", ylab="total number", 
        main="spread of offensive rebound")
boxplot(d.reb, xlab="defensive rebound", ylab="total number",
        main="spread of defensive rebound")
boxplot(steal, xlab="steal", ylab="total number", main="spread of steal")
boxplot(to, xlab="turnover", ylab="total number", main="spread of of turnover")
boxplot(assists, xlab="assists", ylab="total number", main="spread of assists")
boxplot(block, xlab="block", ylab="total number", main="spread of block")

## or combining all the in-game parameters onto a single chart
boxplot(ceps[8:14], use.cols=TRUE, main="Spread of  In-Game parameters",  las=1,
        xlab="in-game parameter", ylab="total number")


###USING GGPLOT2
library(ggplot2)
library(reshape2)

#for the boxplots that shows the spread of the number of different types of 
#shots taken
ceps_shots <- melt(c(ceps[,c(3,5,7)])) #changing the data into a longitudinal
#form using the melt function
ggplot(ceps_shots, aes(x=L1, y=value, fill=L1)) +
  geom_boxplot() + guides(color= guide_legend(title="Shots")) +
  stat_summary(fun="mean", geom="point", color="black")



#boxplots of the in game parameters 
ceps_parameter<- melt(c(ceps[,8:14])) # converting data into longitudinal form

ggplot(ceps_parameter, aes(x=L1, y=value, color=L1)) + 
  geom_boxplot() + guides(color=guide_legend(title="Parameters")) +
  stat_summary(fun="mean", geom="point", color="black")

#boxplots showing the spread of the points for and against the team
ceps_pts <- melt(c(ceps[15:16])) #creating a longitudinal dataset 

ggplot(ceps_pts, aes(x=L1, y= value, color=L1)) + geom_boxplot() +
  guides(color=guide_legend(title = "Points"))
