rm(list=ls())
datafolder <- "~/Analyses"
setwd(datafolder)
figuresfolder <- "~/Figures"


library(scales)
library(performance)
library(lme4)
library(tidyverse)
library(forecast)
library(ggplot2)
library(kableExtra)
library(cowplot)
library(pander)
library(png)
library(patchwork)
library(sjPlot)

# Standardised theme for plotting
ggtheme <- function(base_size=12, base_line=0.3) {
  theme(
    
    text =        element_text(size=base_size),
    line =        element_line(size=base_line, linetype="solid"),
    
    axis.text.x = element_text(size=base_size*0.8, colour='black',  hjust=0.5, vjust=1, angle=0),
    axis.text.y = element_text(size=base_size*0.8, colour='black', hjust=1, vjust=0.5, angle=0),
    axis.line.x = element_line(size=base_line),
    axis.line.y = element_line(size=base_line),
    
    axis.title.x =  element_text(size = base_size, vjust = 1, margin=unit(c(3,0,0,0),"mm")),
    axis.title.y =  element_text(size = base_size, angle = 90, vjust = 0.5, margin=unit(c(0,3,0,0),"mm")),
    axis.ticks = element_line(size=base_line),
    axis.ticks.length = unit(0.3, "lines"),
    
    panel.background = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    panel.border     = element_rect(fill=NA, colour=NA, size=base_line),
    panel.spacing    = unit(1, "lines"),
    
    legend.background = element_rect(fill="transparent", colour="transparent"),
    legend.key =       element_rect(fill="transparent", colour="transparent"),
    legend.text=       element_text(size=base_size),
    
    strip.background =  element_blank(),
    strip.text.x =      element_text(size = base_size * 0.8),
    strip.text.y =      element_text(size = base_size * 0.8, angle = -90),
    strip.switch.pad.grid = unit(0, "mm"),
    strip.switch.pad.wrap = unit(0, "mm"),
    
    plot.margin =       unit(c(0.5, 0.5, 0.5, 0.5), "cm"),
    plot.title =        element_text(size = base_size * 1.2),
    plot.background =   element_rect(colour = "transparent", fill="transparent", size=base_line)
  )}

knitr::include_graphics('~/Figure 1 - Body parts.png')
knitr::include_graphics('~/Figure 2 - Thermal composite.png')


beetle<-read.csv(file = "cool-heat.csv", h = T, sep = ';')

beetle$invert<-beetle$cool.rate*-1 # obtaining positive cooling rate values
beetle2<-beetle[!(beetle$exp == "active.heating"),] # removing active heating experiments from data set


beetle.control<-subset(beetle2,exp=="control")

beetle.passive<-subset(beetle2,exp=="passive.heating")
kable(beetle.control) %>% kable_styling() %>% scroll_box(width = "100%", height = "500px")

kable(beetle.passive) %>% kable_styling() %>% scroll_box(width = "100%", height = "500px")

beetle.passive.mean<-beetle.passive %>%
  group_by(body.part) %>%
  summarise(avg = mean(invert), sd = sd(invert)); beetle.passive.mean

beet.cont.mean<-beetle.control %>%
  group_by(body.part) %>%
  summarise(avg = mean(invert), sd = sd(invert)); beet.cont.mean

lm1<-lm(invert ~ body.part + mass, data = beetle.passive)
check_model(lm1)
checkresiduals(lm1)
summary(lm1)
summary.aov(lm1)

# There is variation among body parts, with the cephalic horn cooling at a higher rate than other parts. Body mass did not mediate this effect.
tab_model(lm1)

lm2<-lm(invert ~ body.part + mass.cat, data = beetle.passive)
check_model(lm2)
checkresiduals(lm2)
summary(lm2)
summary.aov(lm2)
  
# Plot
Fig1<-ggplot(beetle.passive, aes(x = mass, y = invert, colour=body.part, group=body.part, fill=body.part)) + 
  
  geom_segment(x=12,xend=24,y=beet.cont.mean$avg[1], yend=beet.cont.mean$avg[1], 
               linetype="dashed", color = "#EBC397", lwd=.5, alpha=.45)+
  geom_segment(x=12,xend=24,y=beet.cont.mean$avg[2], yend=beet.cont.mean$avg[2], 
               linetype="dashed", color = "#A6E7FF", lwd=.5, alpha=.45)+
  geom_segment(x=12,xend=24,y=beet.cont.mean$avg[3], yend=beet.cont.mean$avg[3], 
               linetype="dashed", color = "#2C809E", lwd=.5, alpha=.45)+
  geom_segment(x=12,xend=24,y=beet.cont.mean$avg[4], yend=beet.cont.mean$avg[4], 
               linetype="dashed", color = "#9E5F1C", lwd=.5, alpha=.45)+
  
  stat_smooth(formula = "y ~ x", method = "lm", fullrange = T, alpha=0.5,
              show.legend = FALSE, se=F, lwd=.95) +
  
  scale_colour_manual(values=c("#EBC397", "#A6E7FF","#2C809E", "#9E5F1C"))+
  
  geom_point(shape = 21, colour = "black", size = 3, alpha = .9) +
  
  scale_fill_manual(name = "", labels = c("Abdomen","Cephalic horn", "Thoracic horn","Elytra"),
                    values=c("#EBC397", "#A6E7FF","#2C809E", "#9E5F1C"))+
  
  ylab("Cooling rate\n(slope)") +
  xlab("Body mass (g)") +
  
  theme(
    # legend.position=c(0.8,0.85),
    legend.title=element_text(size=11),
    legend.text=element_text(size=10)) +
  
  scale_y_continuous(limits=c(0,1.5), labels=seq(0,1.5,0.5))+
  
  ggtheme(12,0.3)

# Beetle1 <- readPNG(paste0(figuresfolder, "/Beetle inset1.png"), native=T)
# Beetle2 <- readPNG(paste0(figuresfolder, "/Beetle inset2.png"), native=T)
Beetle3 <- readPNG(paste0(figuresfolder, "/Beetle inset3.png"), native=T)

Fig1Inset<- Fig1+
  inset_element(p=Beetle3, 0.55, 0.7,1,.9); Fig1Inset

plot(invert ~ as.factor(mass.cat), data = beetle.passive)

# Validation of results

beetle.passive.subset <- beetle.passive %>%
  filter(ID != '5' )

lm3.1<-lm(invert ~ body.part+ mass, data = beetle.passive.subset)
check_model(lm3.1)
checkresiduals(lm3.1)
summary(lm3.1)
summary.aov(lm3.1)

lm3.2<-lm(invert ~ body.part-1 + mass, data = beetle.passive.subset)
summary.aov(lm3.2)

lm4<-lm(invert ~ body.part + mass.cat, data = beetle.passive.subset)
check_model(lm4)
checkresiduals(lm4)
summary(lm4)
summary.aov(lm4)

# Plot
Fig2<-ggplot(beetle.passive.subset, aes(x = mass, y = invert, colour=body.part, group=body.part, fill=body.part)) + 
  
  geom_segment(x=12,xend=24,y=beet.cont.mean$avg[1], yend=beet.cont.mean$avg[1], 
               linetype="dashed", color = "#EBC397", lwd=.5, alpha=.45)+
  geom_segment(x=12,xend=24,y=beet.cont.mean$avg[2], yend=beet.cont.mean$avg[2], 
               linetype="dashed", color = "#A6E7FF", lwd=.5, alpha=.45)+
  geom_segment(x=12,xend=24,y=beet.cont.mean$avg[3], yend=beet.cont.mean$avg[3], 
               linetype="dashed", color = "#2C809E", lwd=.5, alpha=.45)+
  geom_segment(x=12,xend=24,y=beet.cont.mean$avg[4], yend=beet.cont.mean$avg[4], 
               linetype="dashed", color = "#9E5F1C", lwd=.5, alpha=.45)+
  
  stat_smooth(formula = "y ~ x", method = "lm", fullrange = T, alpha=0.5,
              show.legend = FALSE, se=F, lwd=.95) +
  
  scale_colour_manual(values=c("#EBC397", "#A6E7FF","#2C809E", "#9E5F1C"))+
  
  geom_point(shape = 21, colour = "black", size = 3, alpha = .9) +
  
  scale_fill_manual(name = "", labels = c("Abdomen","Cephalic horn", "Thoracic horn","Elytra"),
                    values=c("#EBC397", "#A6E7FF","#2C809E", "#9E5F1C"))+
  
  ylab("Cooling rate\n(slope)") +
  xlab("Body mass (g)") +
  
  theme(
    # legend.position=c(0.8,0.85),
    legend.title=element_text(size=11),
    legend.text=element_text(size=10)) +
  
  scale_y_continuous(limits=c(0,1.5), labels=seq(0,1.5,0.5))+
  
  ggtheme(12,0.3);Fig2

# Grid plot
cowplot::plot_grid(Fig1, Fig2, labels = c('A', 'B'),
                   ncol=2, align = "hv")
sessionInfo() %>% pander

