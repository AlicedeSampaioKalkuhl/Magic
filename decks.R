library(forcats)
library(tidyverse)
library(viridis)
library(ggrepel)

# If you don't wan to edit your decks from within R, you can import any table with the same column names. 
decks<-read.csv("Decks.csv",quote="",stringsAsFactors=F,header=T)

# colour distibution
W<-decks%>%filter(W==T)%>%count()%>%pull(n)
U<-decks%>%filter(U==T)%>%count()%>%pull(n)
B<-decks%>%filter(B==T)%>%count()%>%pull(n)
R<-decks%>%filter(R==T)%>%count()%>%pull(n)
G<-decks%>%filter(G==T)%>%count()%>%pull(n)
colour<-c(W,U,B,R,G)
identity<-c("W","U","B","R","G")
colours<-cbind(colour,identity)
colours<-as.data.frame(colours)
colours<-colours%>%mutate(colour=as.numeric(colour))
col<-colours%>%ggplot(aes(x=fct_inorder(identity),colour))+
          geom_bar(stat="identity")+
          xlab("Colour Identity")+
          ylab("Count")
col 
ggsave("col.png")

#deck stats 
games<-decks%>%filter(priority!="Unfinished"&!is.na(priority))%>%ggplot(aes(played,deck,fill=played))+
        geom_bar(stat="identity")+
        scale_fill_viridis_c()+
        theme(legend.position="none")
games
ggsave(filename ="played.png",width=3000,height =2255, dpi=300,units="px",device='png')
# powerlevel
decks%>%group_by(power)%>%count()
# playable decks
decks%>%filter(priority!="Unfinished")%>%count()


# win stats 

played <- decks %>% filter(played>0) %>% mutate(win=(won+0.5*draw)/played) %>% arrange(-win)
LGSplay <- played %>% filter(priority=="LGS") %>%  ggplot(aes(x=lost,y=won,label=commander)) +
  geom_point(aes(size=played,colour=commander,fill=commander))+
  geom_text_repel(aes(label = commander),size=4,vjust = -1,max.overlaps = 21)+
  scale_colour_viridis_d(option="turbo")+
  theme(legend.position = "none")
LGSplay 
ggsave("LGSplay.png")

proxied <- played %>% filter(priority=="proxied") %>% 
  ggplot(aes(x=lost,y=won,label=commander)) +
  geom_point(aes(size=played,colour=commander,fill=commander))+
  geom_text_repel(aes(label = commander),size=4,vjust = -1,max.overlaps = 21)+
  scale_colour_viridis_d(option="turbo")+
  theme(legend.position = "none")
proxied
ggsave("proxied.png")

notEDH <- played %>% filter(priority=="Other") %>% 
  ggplot(aes(x=lost,y=won,label=commander)) +
  geom_point(aes(size=played,colour=commander,fill=commander))+
  geom_text_repel(aes(label = commander),size=4,vjust = -1,max.overlaps = 21)+
  scale_colour_viridis_d(option="turbo")+
  theme(legend.position = "none")
notEDH
ggsave("notEDH.png")

# cEDH stats 
cEDH <- decks %>% filter(priority=='cEDH') %>% mutate(win=(won+0.5*draw)/played) %>% arrange(-win)
cEDH_results <- ggplot(cEDH, aes(x=lost,y=won,label=commander)) +
                  geom_point(aes(size=played,colour=commander))+
                  geom_text(check_overlap = TRUE,hjust = 0, nudge_x = -0.2,nudge_y = -0.15)+
                  scale_colour_viridis_d()+
                  theme(legend.position = "none")
cEDH_results
ggsave('cEDH_results.png')


buildme<-decks%>%filter(priority=="Unfinished")
buildme%>%pull(commander)
# wishlist (This is currently a little behind)

artists<-decks%>%separate_rows(artist,sep='&')%>%group_by(artist)%>%summarise(n=n())%>%arrange(desc(n))
artists

# search for a specific artist decks%>%dplyr::filter(str_detect(artist,"Johannes Voss"))%>%arrange(commander)%>%pull(commander) 

# filter by colour
# decks%>%dplyr::filter(U==T&W==T)%>%pull(commander)

# planes
planes <- decks %>% separate_rows(plane,sep='&') %>% drop_na() %>% group_by(plane) %>% summarise(n=n()) %>% arrange(-n)
planes
