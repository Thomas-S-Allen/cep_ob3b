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
    
    plot <- df %>% 
        ggplot(aes(x=c2mag-m24mag, y=c1mag-c2mag, color=disk)) +
        geom_point() +
        scale_color_manual(values = c( "red", "green", "blue", "black","white")) +
        xlim(c(-2,10)) +
        ylim(c(-1,3))

    
    return(plot)
}
