

classification_eval = function(true.neg, false.neg, false.pos, true.pos, title=NULL) {
  require(ggplot2)
  mydata = matrix(c(true.neg, false.neg, false.pos, true.pos), ncol=2,
                  dimnames = list(c("Actual Negative", "Actual Positive"), c("Pred Negative", "Pred Positive")))
  
  N = sum(mydata)   #Total number of observations.
  
  all = data.frame(xmin=0, ymin=0, xmax=1, ymax=1)
  
  win_pct = sum(mydata[2,])/N
  wins = data.frame(xmin=0, ymin=0, xmax=win_pct, ymax=1)
  
  win_pred_pct = sum(mydata[,2])/N
  false_neg = mydata[2, 1]/N
  
  model = data.frame(xmin=false_neg, ymin=0, xmax = false_neg + win_pred_pct, ymax = 1)
  
  cat(paste("N:", N, "\n",
            "Positives:", win_pct, "\n",
            "Negatives:", 1 - win_pct, "\n",
            "Positives Predictions:", win_pred_pct, "\n",
            "% of Positives correctly predicted:", true.pos/(true.pos+false.neg), "\n",
            "False Positives:", false.pos/(false.pos + true.pos), "of Positive Predictions\n",
            "False Negatives:", false.neg/(false.neg + true.neg), "of Negative Predictions\n"))
  
  ggplot() + 
    geom_rect(data=all, aes(xmin=xmin, ymin=ymin, xmax=xmax, ymax=ymax), fill="gray85") +
    geom_rect(data=wins, aes(xmin=xmin, ymin=ymin, xmax=xmax, ymax=ymax)) +
    geom_rect(data=model, aes(xmin=xmin, ymin=ymin, xmax=xmax, ymax=ymax), fill=NA, color="blue", size=1) +
    labs(title = title) + 
    theme(plot.title = element_text(size = rel(2))) +
    theme(axis.text = element_blank(), axis.ticks = element_blank()) +
    theme(panel.background = element_blank())
}

classification_eval(169, 8, 69, 14)
classification_eval(206, 17, 25, 11, "Model Performance Against Test Data (20% sample)")  #Stage1 balanced
classification_eval(205,  6, 27, 22, "Model Performance Against Test Data (20% sample)")   #Stage2 balanced w/NPS/CLI
classification_eval(222, 14, 10, 14)
