library(forcats)
library(tidyverse)
library(viridis)

decks<-data.frame(structure(list(deck=character(),commander=character(),power=factor(),played=numeric(),priority=factor(),W=logical(),U=logical(),B=logical(),R=logical(),G=logical(),artist=character())))
decks<-decks%>%#priority 6: Tournament cEDH
  add_row(deck="Obscura Doomsday",commander="Toluz",power="10",played=11,priority="8",W=T,U=T,B=T,R=F,G=F,artist="Donato Giancola")%>% 
  add_row(deck="Sultai Mean Girls",commander="Sidisi",power="9",played=4,priority="8",W=F,U=T,B=T,R=F,G=T,artist="Karl Kopinski")%>%
  add_row(deck="The Weatherlight is Under Construction",commander="Jhoira",power="9",played=4,priority="8",W=F,U=T,B=F,R=T,G=F,artist="Lisa Heidhoff")%>%
  add_row(deck="Underworld Heist",commander="Cormela",power="9",played=1,priority="8",W=F,U=T,B=T,R=T,G=F,artist="Bram Sels")%>%# priority 7: LGS high power 
  add_row(deck="Reyhan and the Merfolks",commander="Thrasios & Reyhan",power="7",played=8,priority="7",W=F,U=T,B=T,R=F,G=T,artist="Josu Hernaiz,Chris Rallis") %>%
  add_row(deck="Nephalia Nightmares",commander="Jeleva",power="7",played=10,priority="7",W=F,U=T,B=T,R=T,G=F,artist="Cynthia Sheppard")%>% 
  # priority 6: LGS low power 
  add_row(deck="Astelle's Maze",commander="Nine-Fingers Keene",power="5",played=1,priority="6",W=F,U=T,B=T,R=F,G=T,artist="Nils Hamm")%>%
  add_row(deck="Bi Disasters",commander="Kamber & Laurine",power="5",played=2,priority="6",W=F,U=F,B=T,R=T,G=F,artist="Andrey Kuzinskiy,Andrey Kuzinskiy")%>%
  add_row(deck="Clueing for Looks",commander="Tocasia",power="6",played=2,priority="2",W=T,U=T,B=F,R=F,G=T,artist="Lie Setiawan")%>% 
  add_row(deck="Descend Into Madness",commander="Evelyn",power="5",played=0,priority="6",W=F,U=T,B=T,R=T,G=F,artist="Marta Nael") %>%
  add_row(deck="Elspeth of the Nine Realms",commander="Quintorius",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=F,artist="Bryan Sola")%>%
  add_row(deck="Ethics Violations",commander="Volrath",power="6",played=3,priority="6",W=F,U=T,B=T,R=F,G=T,artist="Heonhwa Choe")%>%
  add_row(deck="Failed Parley",commander="Phabine",power="5",played=5,priority="6",W=F,U=T,B=T,R=F,G=T,artist="Ryan Pancoast")%>%
  add_row(deck="Gifts to the Table",commander="Parnesse",power="6",played=9,priority="6",W=F,U=T,B=T,R=T,G=F,artist="Svetlin Velinov")%>%
  add_row(deck="Graveyard of Nightmares",commander="Beamtown Bullies",power="5",played=1,priority="6",W=F,U=F,B=T,R=T,G=T,artist="Tyler Jacobson")%>%
  add_row(deck="Keep People Humble",commander="Ivy",power="5",played=4,priority="6",W=F,U=T,B=F,R=F,G=T,artist="Evyn Fong") %>% 
  add_row(deck="Let Me Borrow This",commander="Rubinia",power="5",played=0,priority="6",W=T,U=T,B=F,R=F,G=T,artist="Cynthia Sheppard")%>%
  add_row(deck="Let's All Work Together",commander="Sen Triplets",power="6",played=6,priority="6",W=T,U=T,B=T,R=F,G=F,artist="Greg Staples")%>%
  add_row(deck="Party of Two",commander="Minthara",power="5",played=2,priority="6",W=T,U=F,B=T,R=F,G=F,artist="Evyn Fong")%>%
  add_row(deck="Point Mutation",commander="Otrimi",power="5",played=3,priority="6",W=T,U=T,B=F,R=F,G=T,artist="Victor Adame Minguez") %>%
  add_row(deck="Remember the Fallen",commander="Rayami",power="5",played=2,priority="6",W=F,U=T,B=T,R=F,G=T,artist="Kieran Yanner") %>%
  add_row(deck="True Love",commander="Regna & Krav",power="5",played=2,priority="6",W=T,U=F,B=T,R=F,G=F,artist="Randy Vargas,Randy Vargas")%>%  
  add_row(deck="Where Are My Lesbians?",commander="Ikra & Kydele ",power="5",played=0,priority="6",W=F,U=T,B=T,R=F,G=T,artist="Josu Hernaiz,Bastien L. Deharme")%>%
  # priority 5: Oathbreaker 
  add_row(deck="Don't Worry About It",commander="Lukka",power="5",played=0,priority="5",W=F,U=F,B=F,R=T,G=T,artist="Chase Stone") %>%
  # priority 5: Tiny Leaders 
  add_row(deck="Enchanted Contracts",commander="Leovold",power="5",played=0,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Magali Villeneuve") %>%
  # priority 4: pauper 
  add_row(deck="Challenger",commander="Mr Orfeo",power="4",played=1,priority="1",W=F,U=F,B=T,R=T,G=T,artist="Daarken")%>%
  # priority 3: non-tournament cEDH 
  add_row(deck="Metallic Shark",commander="Shabraz & Brallin",power="9",played=3,priority="4",W=F,U=T,B=T,R=T,G=F,artist="Paul Scott Canavanm,Paul Scott Canavan")%>%  
  add_row(deck="Pompeii",commander="Gallia",power="9",played=4,priority="4",W=F,U=F,B=F,R=T,G=T,artist="Johannes Voss")%>% 
  # priority 2: Casual and Proxied 
  add_row(deck="Be Gay Do Crimes",commander="Vadrik",power="5",played=1,priority="2",W=F,U=T,B=F,R=T,G=F,artist="Kieran Yanner")%>%
  add_row(deck="Bestowing Gifts",commander="Kestia",power="5",played=8,priority="2",W=F,U=T,B=F,R=F,G=T,artist="Zezhou Chen")%>%
  add_row(deck="Biology for the Uninitiated",commander="Runo",power="5",played=8,priority="2",W=F,U=T,B=T,R=F,G=F,artist="Xiaobotong")%>%  
  add_row(deck="Calculator Manipulation",commander="Obeka",power="6",played=5,priority="2",W=F,U=T,B=T,R=T,G=F,artist="Jesper Ejsing")%>% 
  add_row(deck="Dinosaur Nursery",commander="Gavi",power="6",played=6,priority="2",W=T,U=T,B=F,R=T,G=F,artist="Randy Vargas")%>%  
  add_row(deck="Directed Acyclic Graphs",commander="Alesha",power="5",played=5,priority="2",W=T,U=F,B=T,R=T,G=F,artist="Winona Nelson")%>%  
  add_row(deck="Don't Talk To Me",commander="Florian",power="5",played=4,priority="2",W=F,U=F,B=T,R=T,G=F,artist="Justine Cruz")%>% 
  add_row(deck="Eat the Rich",commander="Silvar & Trynn",power="6",played=6,priority="2",W=T,U=F,B=T,R=T,G=F,artist="Jesper Ejsing,Jesper Ejsing")%>%
  add_row(deck="Elves Across The Multiverse",commander="Abomination of Llanowar",power="7",played=11,priority="2",W=F,U=F,B=T,R=F,G=T,artist="Vincent Proce")%>%  
  add_row(deck="Elves With Stones",commander="Akiri & Miara",power="6",played=2,priority="2",W=T,U=F,B=T,R=T,G=F,artist="David Gaillet,Johannes Voss")%>%  
  add_row(deck="Hidden Gems",commander="Kadena",power="5",played=2,priority="2",W=F,U=T,B=T,R=F,G=T,artist="Caio Monteiro")%>%
  add_row(deck="Hunting Time",commander="Neyith",power="6",played=4,priority="2",W=F,U=F,B=F,R=T,G=T,artist="Magali Villeneuve")%>%
  add_row(deck="Kept in Suspense",commander="Illuna",power="5",played=2,priority="2",W=F,U=T,B=F,R=T,G=T,artist="Chris Rahn")%>%
  add_row(deck="Legion of Blood",commander="Licia",power="6",played=3,priority="2",W=T,U=F,B=T,R=T,G=F,artist="Magali Villeneuve")%>%
  add_row(deck="Necrowarfare",commander="Gisa and Geralf",power="5",played=4,priority="2",W=F,U=T,B=T,R=F,G=F,artist="Karla Ortiz")%>%
  add_row(deck="Off To See The Wizard",commander="Inalla",power="5",played=3,priority="2",W=F,U=T,B=T,R=T,G=F,artist="Yongjae Choi")%>%
  add_row(deck="Phyrexian Hippos",commander="Perrie with Keruga",power="6",played=6,priority="2",W=T,U=T,B=F,R=F,G=T,artist="Joshua Raphael,Dan Scott") %>%
  add_row(deck="Prismari for Life",commander="Galazeth Prismari",power="5",played=1,priority="2",W=F,U=T,B=F,R=T,G=F,artist="Iain McCaig")%>%
  add_row(deck="Roll for Honey",commander="Xira",power="5",played=3,priority="2",W=F,U=F,B=T,R=T,G=T,artist="Mila Pesic") %>%
  add_row(deck="Spores on the Playground",commander="Tana & Keskit",power="5",played=1,priority="2",W=F,U=T,B=T,R=F,G=T,artist="Magali Villeneuve,Yongjae Choi") %>% 
  add_row(deck="Stegosaurus Combat Behaviour",commander="Kalamax",power="2",played=5,priority="2",W=F,U=T,B=F,R=T,G=T,artist="Nicholas Gregory") %>%
  add_row(deck="You Should Be Nicer",commander="Atla",power="6",played=6,priority="2",W=T,U=F,B=F,R=T,G=T,artist="Ekaterina Burmak")%>%  #priority 1: unsleeved and unfinished
  add_row(deck="Allies of the Realm",commander="Mike & Lucas",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=T,artist="Colin Boyer,Greg Staples")%>%
  add_row(deck="Bad Vibes",commander="Mishra",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Randy Vargas")%>%
  add_row(deck="Collector's Edition",commander="Pharika",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T,artist="Jason A. Engle")%>% 
  add_row(deck="Cull The Unworthy",commander="Tasigur",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Chris Rahn")%>% 
  add_row(deck="Cursed Gold",commander="Lynde",power="4",played=0,priority="1",W=F,U=T,B=F,R=T,G=F,artist="Anna Steinbauer")%>%    
  add_row(deck="Defending Fblthp",commander="Fblthp",power="4",played=0,priority="1",W=F,U=T,B=F,R=F,G=F,artist="Jesper Ejsing")%>%
  add_row(deck="Descend into Madness",commander="Anhelo",power="4",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Aurore Folny")%>%
  add_row(deck="Distinguished Lesbians",commander="Beckett-Brass",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Jason Rainville")%>%
  add_row(deck="Dynaheir's Honour Guard",commander="Dynaheir with Zira",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Caroline Gariba,Jesper Ejsing")%>%   
  add_row(deck="Exalted Glimpses",commander="Ayesha",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F,artist="Aurore Folny")%>%  
  add_row(deck="Gender is a Construct",commander="Alharu & Silas",power="5",played=0,priority="1",W=T,U=T,B=T,R=F,G=F,artist="Chris Rallis,Joseph Meehan")%>%
  add_row(deck="Giving Goats Away",commander="Zedruu",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Mark Zug")%>%
  add_row(deck="Iwan Iwanowitsch Goratschin",commander="Ruric Thar",power="5",played=0,priority="1",W=F,U=F,B=F,R=T,G=T,artist="Tyler Jacobson")%>%
  add_row(deck="Ixhel's Creations",commander="Ixhel",power="5",played=0,priority="1",W=T,U=F,B=T,R=F,G=T,artist="Campbell White")%>%
  add_row(deck="Jasmine Reads Adventures",commander="Jasmine",power="5",played=0,priority="1",W=T,U=F,B=F,R=F,G=T,artist="Bastien L. Deharme")%>%
  add_row(deck="Knights of the Shire",commander="Mazzy",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=T,artist="Justyna Dura")%>%
  add_row(deck="Creteaceous Beasts",commander="Nethroi with Kaheera",power="5",played=0,priority="1",W=T,U=F,B=T,R=F,G=T, artist="Slawomir Maniak,Ryan Pancoast")%>%
  add_row(deck="Pride was a Riot",commander="Kynaios & Tiro",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=T,artist="Willian Murai")%>%
  add_row(deck="Release the Gremlins",commander="Wasitora",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=T,artist="Cynthia Sheppard") %>%
  add_row(deck="Runic Lore",commander="Gretchen",power="9",played=0,priority="1",W=F,U=T,B=F,R=T,G=T,artist="Mila Pesic")%>%
  add_row(deck="Guardian of the Lost",commander="Ghave",power="5",played=0,priority="1",W=T,U=F,B=T,R=F,G=T,artist="James Paick")%>%
  add_row(deck="Unspeakable Horrors",commander="Kodama & Ghost of Ramirez",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=T,artist="Daarken,Grzegorz Rutkowski")%>%  
  add_row(deck="Women in STEM",commander="Sophina & Cecily",power="5",played=0,priority="1",W=T,U=T,B=T,R=T,G=F,artist="Bartek Fedyczak,Anastasia Balakchina")

decks%>%filter(W==T & B==T & R==T)
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
games<-decks%>%filter(priority!="1"&!is.na(priority))%>%ggplot(aes(played,deck,fill=played))+
        geom_bar(stat="identity")+
        scale_fill_viridis_c()+
        theme(legend.position="none")
games
ggsave(filename ="played.png",width=3000,height =2255, dpi=300,units="px",device='png')
head(decks)
# powerlevel
decks%>%filter(priority!="0")%>%group_by(power)%>%count()
# playable decks
decks%>%filter(priority!="1"&!is.na(priority))%>%count()

buildme<-decks%>%filter(priority=="1")
buildme%>%pull(commander)
# wishlist (This is currently a little behind)

proxies<- as.data.frame(read.csv("proxies.csv",header=T))
proxies%>%dplyr::filter(str_detect(Decks,"Atla Palani"))%>%pull(Card)# example looking for cards I need to Atla 

artists<-decks%>%separate_rows(artist,sep=',')%>%group_by(artist)%>%summarise(n=n())%>%arrange(desc(n))
artists
decks%>%dplyr::filter(str_detect(artist,"Jesper Ejsing"))%>%arrange(commander)%>%pull(commander)

# filter by colour
decks%>%dplyr::filter(B==T)%>%pull(commander)
