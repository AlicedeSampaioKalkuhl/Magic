library(forcats)
library(tidyverse)
library(viridis)
library(ggrepel)
library(ggwordcloud)

# If you don't wan to edit your decks from within R, you can import any table with the same column names. 
decks<-read.csv("Decks.csv",quote="",stringsAsFactors=F,header=T)

# colour distibution
W<-decks%>%filter(W==TRUE)%>%count()%>%pull(n)
U<-decks%>%filter(U==TRUE)%>%count()%>%pull(n)
B<-decks%>%filter(B==TRUE)%>%count()%>%pull(n)
R<-decks%>%filter(R==TRUE)%>%count()%>%pull(n)
G<-decks%>%filter(G==TRUE)%>%count()%>%pull(n)
colour<-c(W,U,B,R,G)
identity<-c("W","U","B","R","G")
colours<-cbind(colour,identity)
colours<-as.data.frame(colours)
colours<-colours%>%mutate(colour=as.numeric(colour))
col<-colours%>%ggplot(aes(x="",colour,fill=identity))+
          geom_bar(stat="identity", width=1)+
          theme(axis.title.x=element_blank(),
                axis.text.x=element_blank(),
                axis.text.y=element_blank(),
                axis.ticks.y=element_blank())+
  xlab("")+
  coord_polar("y", start=0)+
            scale_fill_manual("Colour Pie", values = c("W"=rgb(249,250,185,maxColorValue=255),"U"=rgb(14,104,171,maxColorValue=255),"B"=rgb(21,11,0,maxColorValue=255),"R"=rgb(211,32,42,maxColorValue=255),"G"=rgb(0,115,62,maxColorValue=255)))
# col 
# ggsave("col.png")

#deck stats 
games<-decks%>%filter(type!="Unfinished")%>%ggplot(aes(played,deck,fill=played))+
        geom_bar(stat="identity")+
        scale_fill_viridis_c()+
        theme(legend.position="none")
games
ggsave(filename ="played.png",width=3000,height =2255, dpi=300,units="px",device='png')
# powerlevel
decks%>%group_by(power)%>%count()
# playable decks
decks%>%filter(type!="Unfinished")%>%count()


# win stats 
games <- decks %>% filter(played>0) %>% mutate(win=(won+0.5*draw)/played) %>% arrange(-win)
total <- games %>% group_by(type) %>% summarise(max_played=max(played))
LGSplay <- games %>% filter(type=="LGS") %>%  
  ggplot(aes(x=lost,y=won,label=commander)) +
  geom_point(aes(size=played,colour=commander,fill=commander))+
  geom_abline(slope=0.25,intercept=0)+
  scale_x_continuous(limits = c(0,total %>% filter(type=="LGS") %>% pull(max_played)))+
  scale_y_continuous(limits = c(0,total %>% filter(type=="LGS") %>% pull(max_played)))+
  geom_text_repel(aes(label = commander),size=4,vjust = -1,max.overlaps = 21)+
  scale_colour_viridis_d(option="turbo")+
  theme(legend.position = "none")
# LGSplay 
# ggsave("LGSplay.png")


# cEDH stats 
cEDH_total <- max(games[games$type=="cEDH",]$played)
cEDH <- decks %>% filter(type=='cEDH') %>% mutate(win=(won+0.5*draw)/played) %>% arrange(-win)
cEDH_results <- ggplot(cEDH, aes(x=lost,y=won,label=commander)) +
                  geom_point(aes(size=played,colour=commander))+
                  geom_abline(slope=0.4,intercept=0)+
                  scale_x_continuous(limits = c(0,total %>% filter(type=="cEDH") %>% pull(max_played)))+
                  scale_y_continuous(limits = c(0,total %>% filter(type=="cEDH") %>% pull(max_played)))+
                  geom_text_repel(aes(label = commander),size=4,vjust = -1,max.overlaps = 21)+
                  scale_colour_viridis_d(option="turbo")+
                  theme(legend.position = "none")
#cEDH_results
# ggsave('cEDH_results.png')


buildme<-decks%>%filter(type=="Unfinished")
buildme%>%pull(commander)
# wishlist (This is currently a little behind)

artists<-decks%>%separate_rows(artist,sep='&')%>%group_by(artist)%>%summarise(n=n())%>%arrange(desc(n))


art <-  artists %>% 
  ggplot(aes(label = artist,color=artist,size=n)) +
  geom_text_wordcloud() +
  scale_size_area(max_size = 5)+
  theme_minimal()
# art
# ggsave('artists.png')
# search for a specific artist decks%>%dplyr::filter(str_detect(artist,"Johannes Voss"))%>%arrange(commander)%>%pull(commander) 

# filter by colour
# decks%>%dplyr::filter(U==T&W==T)%>%pull(commander)

# planes
planes <- decks %>% separate_rows(plane,sep='&') %>% drop_na() %>% group_by(plane) %>% mutate(n_all=nrow(.)) %>% group_by(n_all,plane)%>% summarise(n=n()) %>% arrange(-n) %>% mutate(prop=n/n_all)

locations <- planes %>% 
ggplot(aes(label = plane,color=plane,size=n)) +
  geom_text_wordcloud() +
  scale_size_area(max_size = 15)+
  theme_minimal()+
  scale_colour_viridis_d(option="plasma")
# locations 
# ggsave('locations.png')

# themes 
deck_themes <- decks %>% separate_rows(themes,sep='&') %>% drop_na() %>% group_by(themes) %>% summarise(n=n()) %>% arrange(-n)
deck_themes


themes_plot<-ggplot(deck_themes, aes(label = themes,color=themes,size=n)) +
  geom_text_wordcloud() +
  scale_size_area(max_size = 10)+
  theme_minimal()+
  scale_colour_viridis_d(option="turbo")
# themes_plot
# ggsave('worldcloud.png')

write.csv(decks %>% mutate(priority=rownames(.)),"Decks.csv",quote=F,row.names=F) # if you change the csv in here, remember to export it again 
  