#Create Xbar chart with overlayed distributions.

source('~/R/Rand number gen from multiple distribs.R')
library(qcc); library(ggplot2);library(grid)  #grid is used for 'unit' function.
groups = qcc.groups(samples$value, samples$group)
pcb = qcc(groups, "xbar", std.dev = "UWAVE-SD")
pcb_S = qcc(groups, "S", std.dev = "UWAVE-SD")

aux = data.frame(group=1:20, stats=pcb$statistics, cl=pcb$center, limits=pcb$limits)
samples$violation = ifelse(samples$group==8, TRUE, FALSE)

#Construct graph in one swoop.
p = ggplot(samples, aes(group=group)) + facet_grid(. ~ group) + coord_flip()
p = p + geom_histogram(aes(x=value, fill=violation)) + scale_fill_manual(values=c("grey75", "grey55"), guide=FALSE)
p = p + geom_vline(data=aux, aes(xintercept=cl), color="green3", size=1)
p = p + geom_vline(data=aux, aes(xintercept=limits.LCL), color="red", size=1)
p = p + geom_vline(data=aux, aes(xintercept=limits.UCL), color="red", size=1)
p = p + geom_vline(data=aux, aes(xintercept=stats), color="blue", size=1)
p = p + theme(panel.margin = unit(0, "cm")) 
p = p + theme(axis.title.y=element_text(size = rel(1.5)), axis.text.y=element_text(size = rel(1.5)))
p + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())

#Display graph one step at a time for educational purposes.
pdf("~/R/CornejoChart.pdf", width = 9, height = 5)
dev.set(dev.list()[match("pdf", names(dev.list()))])
p = ggplot(samples, aes(group=group)) + facet_grid(. ~ group) + coord_flip() + theme(panel.margin = unit(0, "cm"))
p = p + theme(axis.title.y=element_text(size = rel(1.5)), axis.text.y=element_text(size = rel(1.5)))
p = p + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
p
p = p + geom_histogram(aes(x=value), fill="grey75")
print(p)  #Need 'print' to write to pdf device.  Otherwise writes to RStudioGD device.
p + geom_vline(data=aux, aes(xintercept=stats), color="blue", size=1)
p = p + geom_vline(data=aux, aes(xintercept=cl), color="green3", size=1)
p = p + geom_vline(data=aux, aes(xintercept=stats), color="blue", size=1)
print(p)
p = ggplot(samples, aes(group=group)) + facet_grid(. ~ group) + coord_flip() + theme(panel.margin = unit(0, "cm"))
p = p + theme(axis.title.y=element_text(size = rel(1.5)), axis.text.y=element_text(size = rel(1.5)))
p = p + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
p = p + geom_histogram(aes(x=value, fill=violation)) + scale_fill_manual(values=c("grey75", "grey55"), guide=FALSE)
p = p + geom_vline(data=aux, aes(xintercept=cl), color="green3", size=1)
p = p + geom_vline(data=aux, aes(xintercept=stats), color="blue", size=1)
print(p)
p = p + geom_vline(data=aux, aes(xintercept=limits.LCL), color="red", size=1)
p = p + geom_vline(data=aux, aes(xintercept=limits.UCL), color="red", size=1)
print(p)
dev.off(dev.list()[match("pdf", names(dev.list()))])
