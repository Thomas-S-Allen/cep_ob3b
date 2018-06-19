# Example preprocessing script.


DATA_PATH <- "/Users/thomasallen/cep_ob3b/cepr/data/"
NN <- 255884

#***
# Code Categorical Variables
#***

# Note add one to arrays to switch from counting starting at 0 to 
# counting starting from 1

# Create a variable to hold sub-cluster membership
east <- read_csv(paste(DATA_PATH,"east.csv",sep=""))
east <- east + 1
west <- read_csv(paste(DATA_PATH,"west.csv",sep=""))
west <- west + 1

cluster <- vector(mode="character",length=NN)
cluster[] <- "unclassified"
cluster[pull(east)] <- "east"
cluster[pull(west)] <- "west"
cluster <- as.factor(cluster)

# Create a variable for region of Cepheus Molecular cloud

wnw_only <- read_csv(paste(DATA_PATH,"wnw_only.csv",sep=""))
wnw_only <- wnw_only + 1

cloud <- vector(mode="character",length=NN)
cloud[] <- "unclassified"
cloud[pull(wnw_only)] <- "nw"

# Create a variable for optically selected members (Allen et al. 2012)

wysov <- read_csv(paste(DATA_PATH,"wysov.csv",sep=""))
wysov <- wysov + 1
yso_vis <- vector(mode="character",length=NN)
yso_vis[] <- "unclassified"
yso_vis[pull(wysov)] <- "yso"

# Create a variable for disk status

wc1 <- read_csv(paste(DATA_PATH,"wc1.csv",sep=""))
wc1 <- wc1 + 1
wc2 <- read_csv(paste(DATA_PATH,"wc2.csv",sep=""))
wc2 <- wc2 + 1 
wc3 <- read_csv(paste(DATA_PATH,"wc3.csv",sep=""))
wc3 <- wc3 + 1
wtd <- read_csv(paste(DATA_PATH,"wtd.csv",sep=""))
wtd <- wtd + 1

print("wc2")
print(wc2)

disk <- vector(mode="character",length=NN)
disk[] <- "unclassified"
disk[pull(wc3)] <- 'nd'
disk[pull(wc2)] <- 'pd'
disk[pull(wc1)] <- 'ps'
disk[pull(wtd)] <- 'td'
#disk <- as.factor(disk)
disk = factor(disk,levels=c('ps','pd','td','nd','unclassified'))
#disk <- disk %>% mutate(factor('ps','pd','td','nd','unclass'))
#disk <- disk %>% mutate(disk=factor(disk,'ps','pd','td','nd','unclass'))

print(levels(disk))

# Another variable for X-ray detection

wanc <- read_csv(paste(DATA_PATH,"wanc.csv",sep=""))
wanc <- wanc + 1

xray <- vector(mode="character",length=NN)
xray[] <- "no"
xray[pull(wanc)] <- "yes"

# on ACIS chip

wacis <- read_csv(paste(DATA_PATH,"wacis.csv",sep=""))
wacis <- wacis + 1
acis <- vector(mode="character",length=NN)
acis[] <- "no"
acis[pull(wacis)] <- "yes"



#***
# Create Data Frame and rename variables
#***


full.df <- data.frame(Hastr$RA,Hastr$Dec,
                     Bphot$mag,Bphot$err,
                     Vphot$mag,Vphot$err,
                     Iphot$mag,Iphot$err,
                     Jphot$mag,Jphot$err,
                     Hphot$mag,Hphot$err,
                     Kphot$mag,Kphot$err,
                     CH1phot$mag,CH1phot$err,
                     CH2phot$mag,CH2phot$err,
                     CH3phot$mag,CH3phot$err,
                     CH4phot$mag,CH4phot$err,
                     MIPSphot$mag,MIPSphot$err,
                     cluster,cloud,disk,xray,acis,Spectroscopy,
                     minxray$ra,minxray$dec,
                     minxray$id,
                     minxray$rcnts,minxray$ncnts,
                     minxray$npflux,minxray$npfluxerr,
                     minxray$nh,minxray$nherr,# %>% 
                     minxray$kt1,minxray$kt1err,
                     minxray$aflux,minxray$uflux,
                     minxray$rchi,
                     medxray$ra,medxray$dec,
                     medxray$id,
                     medxray$rcnts,medxray$ncnts,
                     medxray$npflux,medxray$npfluxerr,
                     medxray$nh,medxray$nherr,# %>% 
                     medxray$kt1,medxray$kt1err,
                     medxray$aflux,medxray$uflux,
                     medxray$rchi,
                     maxxray$ra,maxxray$dec,
                     maxxray$id,
                     maxxray$rcnts,maxxray$ncnts,
                     maxxray$npflux,maxxray$npfluxerr,
                     maxxray$nh,maxxray$nherr,# %>% 
                     maxxray$kt1,maxxray$kt1err,
                     maxxray$aflux,maxxray$uflux,
                     maxxray$rchi,
                     lbol.teff.sa$lbol,
                     lbol.teff.sa$teff,
                     lbol.teff.sa$sa)# %>% 
    
   #     rename( bmag = Bphot.mag, berr = Bphot.err,
   #         vmag = Vphot.mag, verr = Vphot.err,
   #         imag = Iphot.mag, ierr = Iphot.err,
   #         jmag = Jphot.mag, jerr = Jphot.err,
   #         hamg = Hphot.mag, herr = Hphot.err,
   #         kmag = Kphot.mag, kerr = Kphot.err,
   #         c1mag = CH1phot.mag, c1err = CH1phot.err,
   #         c2mag = CH2phot.mag, c2err = CH2phot.err,
   #         c3mag = CH3phot.mag, c3err = CH3phot.err,
   #         c4mag = CH4phot.mag, c4err = CH4phot.err,
   #         m24mag = MIPSphot.mag, m24err = MIPSphot.err)

# For some reason rename is not working.  Guess it can be dome in 
# base R.
colnames(full.df)[colnames(full.df)=="Hastr.RA"] <- "ra"
colnames(full.df)[colnames(full.df)=="Hastr.Dec"] <- "dec"
colnames(full.df)[colnames(full.df)=="Bphot.mag"] <- "bmag"
colnames(full.df)[colnames(full.df)=="Bphot.err"] <- "berr"
colnames(full.df)[colnames(full.df)=="Vphot.mag"] <- "vmag"
colnames(full.df)[colnames(full.df)=="Vphot.err"] <- "verr"
colnames(full.df)[colnames(full.df)=="Iphot.mag"] <- "imag"
colnames(full.df)[colnames(full.df)=="Iphot.err"] <- "ierr"
colnames(full.df)[colnames(full.df)=="Jphot.mag"] <- "jmag"
colnames(full.df)[colnames(full.df)=="Jphot.err"] <- "jerr"
colnames(full.df)[colnames(full.df)=="Hphot.mag"] <- "hmag"
colnames(full.df)[colnames(full.df)=="Hphot.err"] <- "herr"
colnames(full.df)[colnames(full.df)=="Kphot.mag"] <- "kmag"
colnames(full.df)[colnames(full.df)=="Kphot.err"] <- "kerr"
colnames(full.df)[colnames(full.df)=="CH1phot.mag"] <- "c1mag"
colnames(full.df)[colnames(full.df)=="CH1phot.err"] <- "c1err"
colnames(full.df)[colnames(full.df)=="CH2phot.mag"] <- "c2mag"
colnames(full.df)[colnames(full.df)=="CH2phot.err"] <- "c2err"
colnames(full.df)[colnames(full.df)=="CH3phot.mag"] <- "c3mag"
colnames(full.df)[colnames(full.df)=="CH3phot.err"] <- "c3err"
colnames(full.df)[colnames(full.df)=="CH4phot.mag"] <- "c4mag"
colnames(full.df)[colnames(full.df)=="CH4phot.err"] <- "c4err"
colnames(full.df)[colnames(full.df)=="MIPSphot.mag"] <- "m24mag"
colnames(full.df)[colnames(full.df)=="MIPSphot.err"] <- "m24err"
colnames(full.df)[colnames(full.df)=="lbol_teff_sa.lbol"] <- "lbol"
colnames(full.df)[colnames(full.df)=="lbol_teff_sa.teff"] <- "teff"
colnames(full.df)[colnames(full.df)=="lbol_teff_sa.sa"] <- "sa"

names(full.df)

cep.df <- full.df %>% 
    filter(cloud == "nw")

cache('full.df')
cache('cep.df')