library(forcats)
library(tidyverse)
library(viridis)

decks<-data.frame(structure(list(deck=character(),commander=character(),power=factor(),played=numeric(),priority=factor(),W=logical(),U=logical(),B=logical(),R=logical(),G=logical())))
decks<-decks%>%#priority 4: tournament decks 
  add_row(deck="Doomed by the Obscura",commander="Toluz",power="10",played=3,priority="4",W=T,U=T,B=T,R=F,G=F)%>% 
  add_row(deck="Doomsday Experiment",commander="Jan",power="10",played=0,priority="4",W=T,U=F,B=T,R=T,G=F)%>% 
  add_row(deck="Hot Girl Summer",commander="Jeska & Tymna",power="9",played=5,priority="4",W=T,U=F,B=F,R=T,G=F)%>%
  add_row(deck="Underworld Heist",commander="Cormela",power="9",played=1,priority="4",W=F,U=T,B=T,R=T,G=F)%>%# priority 3: LGS deck
  add_row(deck="Amphibian Hugs",commander="Gor Muldark",power="5",played=5,priority="3",W=F,U=T,B=F,R=F,G=T)%>%
  add_row(deck="Gifts to the Table",commander="Parnesse",power="3",played=7,priority="2",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Let Me Borrow This",commander="Yasova",power="5",played=3,priority="3",W=F,U=T,B=T,R=T,G=F)%>%  
  add_row(deck="Let's All Work Together",commander="Sen Triplet",power="5",played=5,priority="3",W=T,U=T,B=T,R=F,G=F)%>%  
  add_row(deck="Nephalia Nightmares",commander="Jeleva",power="7",played=9,priority="3",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Over The Hills",commander="Rubinia",power="5",played=0,priority="3",W=T,U=T,B=F,R=F,G=T)%>%
  add_row(deck="Point Mutation",commander="Otrimi",power="5",played=3,priority="3",W=T,U=T,B=F,R=F,G=T) %>%# priority 2: proxy friendly
  add_row(deck="Abzahn Resurgence",commander="Daghatar",power="6",played=6,priority="2",W=T,U=F,B=T,R=F,G=T)%>%
  add_row(deck="Ad Astra",commander="Belbe",power="8",played=6,priority="2",W=F,U=F,B=T,R=F,G=T)%>%
  add_row(deck="Bestowing Gifts",commander="Kestia",power="5",played=4,priority="2",W=F,U=T,B=F,R=F,G=T)%>%
  add_row(deck="Biology for the Uninitiated",commander="Runo",power="5",played=6,priority="2",W=F,U=T,B=T,R=F,G=F)%>%  
  add_row(deck="Calculator Manipulation",commander="Obeka",power="6",played=5,priority="2",W=F,U=T,B=T,R=T,G=F)%>% 
  add_row(deck="Chaos for Everybody",commander="Sol'kanar",power="4",played=0,priority="1",W=F,U=T,B=T,R=T,G=F)%>% 
  add_row(deck="Clueing for Looks",commander="Amareth",power="5",played=4,priority="3",W=T,U=T,B=F,R=F,G=T)%>% 
  add_row(deck="Dancing Goblins",commander="Gallia",power="9",played=2,priority="2",W=F,U=F,B=F,R=T,G=T)%>%  
  add_row(deck="Dinosaur Nursery",commander="Gavi",power="6",played=4,priority="2",W=T,U=T,B=F,R=T,G=F)%>%  
  add_row(deck="Directed Acyclic Graphs",commander="Alesha",power="5",played=4,priority="2",W=T,U=F,B=T,R=T,G=F)%>%  
  add_row(deck="Dream-Denn",commander="Killian",power="5",played=2,priority="2",W=T,U=F,B=T,R=F,G=F)%>%  
  add_row(deck="Eat the Rich",commander="Silvar & Trynn",power="6",played=6,priority="2",W=T,U=F,B=T,R=T,G=F)%>%
  add_row(deck="Elspeth of the Nine Realms",commander="Koll",power="7",played=5,priority="2",W=T,U=F,B=F,R=T,G=F)%>%  
  add_row(deck="Elves Across The Multiverse",commander="Abomination of Llanowar",power="7",played=10,priority="2",W=F,U=F,B=T,R=F,G=T)%>%  
  add_row(deck="Ethics Violations",commander="Volrath",power="6",played=2,priority="2",W=T,U=F,B=F,R=T,G=T)%>%
  add_row(deck="Hellrider's Pride",commander="Zevlor",power="5",played=1,priority="2",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Hidden Gems",commander="Kadena",power="5",played=2,priority="2",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Hunting Time",commander="Neyith",power="6",played=4,priority="2",W=F,U=F,B=F,R=T,G=T)%>%
  add_row(deck="In a Flash",commander="Nymris",power="5",played=0,priority="2",W=F,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Keimi's Revenge",commander="Tatsunari",power="5",played=5,priority="2",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Lands of Wrath",commander="Aurelia",power="5",played=1,priority="2",W=T,U=F,B=F,R=T,G=F)%>%  
  add_row(deck="Legion of Blood",commander="Licia",power="6",played=3,priority="2",W=T,U=F,B=T,R=T,G=F)%>%  
  add_row(deck="Midnight",commander="Yidris",power="5",played=3,priority="2",W=F,U=T,B=T,R=T,G=T)%>%
  add_row(deck="Necrowarfare",commander="Gisa & Geralf",power="5",played=3,priority="2",W=F,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Off To See The Wizard",commander="Inalla",power="5",played=2,priority="2",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Phyrexian Hippos",commander="Perrie",power="6",played=5,priority="2",W=T,U=T,B=F,R=F,G=T) %>%

  add_row(deck="Snakes In The Snow",commander="Jorn",power="6",played=4,priority="2",W=F,U=T,B=T,R=F,G=T) %>%
  add_row(deck="Stegosaurus Combat Behaviour",commander="Kalamax",power="2",played=5,priority="2",W=F,U=T,B=F,R=T,G=T) %>%
  add_row(deck="Survival",commander="Ukkima & Cazur",power="8",played=5,priority="2",W=F,U=T,B=T,R=F,G=T) %>%
  add_row(deck="Tea Time",commander="Dina",power="8",played=4,priority="2",W=F,U=F,B=T,R=F,G=T)%>%
  add_row(deck="The Noble House Of Esper",commander="Sydri",power="5",played=1,priority="2",W=T,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Time to Forget",commander="Archelos",power="6",played=5,priority="2",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="In The Shadows",commander="Yennett",power="5",played=3,priority="2",W=T,U=T,B=T,R=F,G=F)%>%
  add_row(deck="You Should Be Nicer",commander="Atla",power="6",played=6,priority="2",W=T,U=F,B=F,R=T,G=T)%>%# priority 1: unsleeved 

  add_row(deck="Astelle's Maze",commander="Nine-Fingers Keene",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Be Gay Do Crimes",commander="Vadrik",power="5",played=1,priority="1",W=F,U=T,B=F,R=T,G=F)%>%
  add_row(deck="Biggest Butts",commander="Sidar & Tevesh",power="6",played=0,priority="1",W=T,U=F,B=T,R=F,G=T)%>%
  add_row(deck="Collector's Edition",commander="Pharika",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T)%>% 
  add_row(deck="Cull The Unworthy",commander="Tasigur",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T)%>% 
  add_row(deck="Curious Beasts",commander="Brallin & Shabraz",power="7",played=16,priority="1",W=F,U=T,B=T,R=T,G=F)%>%  
  add_row(deck="Don't Talk To Me",commander="Florian",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=F)%>% 
  add_row(deck="Exiled to Grixis",commander="Sedris",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F)%>%   
  add_row(deck="Failed Parley",commander="Phabine",power="5",played=2,priority="1",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Find the Bride",commander="Korvold",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=T)%>%
  add_row(deck="Here Be Dragons",commander="Kykar",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F)%>%
  add_row(deck="Hush Now",commander="Kels",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Hybrid Zone Ascendancy",commander="Rocco",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=T)%>%
  add_row(deck="Kept in Suspense",commander="Illuna",power="5",played=0,priority="1",W=F,U=T,B=F,R=T,G=T)%>%  
  add_row(deck="Leave Me Alone",commander="Xantcha",power="5",played=0,priority="1",W=F,U=F,B=F,R=T,G=0)%>%  
  add_row(deck="Misery Business",commander="Queza",power="5",played=0,priority="1",W=T,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Pyramid of Zombies",commander="Temmet",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F)%>%
  add_row(deck="Remember the Fallen",commander="Rayami",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T) %>%
  add_row(deck="Shattergang Revenge",commander="Shattergang",power="6",played=0,priority="1",W=F,U=F,B=T,R=T,G=T)%>%
  add_row(deck="Solve for X",commander="Zaxara",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T) %>%
  add_row(deck="Spores on the Playground",commander="Tana & Keskit",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T) %>% 
  add_row(deck="Stromkirk Vampires",commander="Evelyn",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F) %>%  
  add_row(deck="True Love",commander="Regna & Krav",power="5",played=0,priority="1",W=T,U=F,B=T,R=F,G=F)%>%  
  add_row(deck="Will Of The Council",commander="Tivit",power="5",played=0,priority="1",W=T,U=T,B=T,R=F,G=F)%>%  
  add_row(deck="Vicious Cuts",commander="Belbe",power="10",played=0,priority="1",W=F,U=F,B=T,R=F,G=T)%>%  
  add_row(deck="Weather The Storm",commander="Trelassara",power="5",played=0,priority="1",W=T,U=F,B=F,R=F,G=T)%>%
  add_row(deck="Women in STEM",commander="Sophina & Cecily",power="5",played=0,priority="1",W=T,U=T,B=T,R=T,G=F)%>%  
  add_row(deck="Zombies & Jellyfish",commander="Sidisi",power="10",played=0,priority="1",W=F,U=T,B=T,R=F,G=T)

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
played<-decks%>%ggplot(aes(played,deck,fill=played))+
        geom_bar(stat="identity")+
        scale_fill_viridis_c()+
        theme(legend.position="none")
played
ggsave(filename ="played.png",width=3000,height =2255, dpi=300,units="px",device='png')
head(decks)
# powerlevel
decks%>%group_by(power)%>%count()
# playable decks
decks%>%filter(priority!="1")%>%count()


# wishlist (This is currently a little behind)

proxies<- as.data.frame(read.csv(proxies.csv,header=T,sep=";"))
proxies%>%dplyr::filter(str_detect(deck,"Atla Palani"))# example looking for cards I need to Atla 
