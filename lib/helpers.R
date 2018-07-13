helper.function <- function()
{
  return(1)
}

#
# Error chop - take only objects with the following error tolerances
# H > 0.15
# K > 0.15
# [3.6] > 0.2
# [4.5] > 0.2

error_chop <- function(df) {
    
    df <- df %>% 
        filter((herr < 0.15 & kerr < 0.15 & c1err < 0.2 & c2err < 0.2) |
                   (c1err < 0.2 & c2err < 0.2 & c3err < 0.2 & c4err < 0.2)) %>% 
    return(df) 
}

unclassified_chop <- function(df) {
    
    df <- df %>% 
        filter(disk != "unclassified")
    return(df) 
}


# Some plotting functions 
# This may end up being the mega-fig i was planning on during grad school

# Color - Magnitude plots


cmd <- function(df, x=jmag-hmag, y=jmag) {
    
    plot <- df %>% 
        ggplot(aes(x=x, y=y, color=disk)) +
        geom_point() +
        scale_y_reverse() +
        scale_color_manual(values = c( "red", "green", "blue", "black","white"))
    
    return(plot)
}



VvsVmI <- function(df) {
    
    plot <- df %>% 
        ggplot(aes(x=vmag-imag, y=vmag, color=disk)) +
        geom_point() +
        scale_y_reverse() +
        scale_color_manual(values = c( "red", "green", "blue", "black","white"))
    
    return(plot)
}

irac1 <- function(df) {
    
    # Plots [4.5] - [24] vs. [3.6] - [4.5] ccd from data frame
    # Data frame must have c1mag, c2mag, m24mag and disk columns{{}}
    
    plot <- df %>% 
        ggplot(aes(x=c2mag-m24mag, y=c1mag-c2mag, color=disk)) +
        geom_point() +
        scale_color_manual(values = c( "red", "green", "blue", "black","white")) +
        xlim(c(-2,10)) +
        ylim(c(-1,3))

    
    return(plot)
}


ext_cc_plot_fit <- function(df,c1=vmag,c2=jmag,c3=kmag,xtitle="J - K",ytitle="V - J")  {
    
    # Plots X - J vs. J - K and fits a linear model 
    # Slope of linear model is used to derive Ax/Aj extinction coefficient
    
    c1<-enquo(c1)
    c2<-enquo(c2)
    c3<-enquo(c3)
    
    df.plot <- df %>% 
        filter(giant=="giant") %>% 
        filter(member=="non-member") %>% 
        filter(is.na(!!c2)==FALSE & is.na(!!c3)==FALSE & is.na(!!c1)==FALSE) %>% 
        filter(spt==65 | spt==66) %>% # | spt==67) 
        
        
        #mutate(c1=as.numeric(c1)) %>%
        mutate(x=!!c2 - !!c3,y= !!c1 - !!c2) %>% 
        select(x,y)  
    #filter(jmk < 1.75)
    
    
    plot <- df.plot %>% 
        ggplot(aes(x=x,y=y)) +
        geom_point() +
        geom_smooth(method='lm') +
        labs(x=xtitle,y=ytitle)
    
    
    
    fit <- lm(y ~ x, data = df.plot)
    print(summary(fit))
    #print(plot)
    
    return(plot)
    #  
}

