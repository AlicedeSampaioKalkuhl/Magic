library(forcats)
library(tidyverse)
library(viridis)

decks<-data.frame(structure(list(deck=character(),commander=character(),power=factor(),played=numeric(),priority=factor(),W=logical(),U=logical(),B=logical(),R=logical(),G=logical())))
decks<-decks%>%#priority 7: Tournament cEDH
  add_row(deck="Doomed by the Obscura",commander="Toluz",power="10",played=3,priority="7",W=T,U=T,B=T,R=F,G=F)%>% 
  add_row(deck="Metallic Shark",commander="Shabraz & Brallin",power="9",played=2,priority="7",W=F,U=T,B=T,R=T,G=F)%>%  
  add_row(deck="Royal Snowball",commander="Queen Marchesa",power="9",played=0,priority="7",W=T,U=F,B=T,R=T,G=F)%>%
  add_row(deck="The Weatherlight is Under Construction",commander="Jhoira",power="9",played=0,priority="7",W=F,U=T,B=F,R=T,G=F)%>%
  add_row(deck="Underworld Heist",commander="Cormela",power="9",played=1,priority="7",W=F,U=T,B=T,R=T,G=F)%>%# priority 6: LGS high power 
  add_row(deck="Depths of Darkness",commander="Thrassios & Reyhan",power="7",played=7,priority="6",W=F,U=T,B=T,R=F,G=T) %>%
  add_row(deck="Nephalia Nightmares",commander="Jeleva",power="7",played=10,priority="6",W=F,U=T,B=T,R=T,G=F)%>% # priority 5: LGS low power 
  add_row(deck="Failed Parley",commander="Phabine",power="5",played=2,priority="5",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Gifts to the Table",commander="Parnesse",power="6",played=8,priority="2",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Graveyard of Nightmares",commander="Beamtown Bullies",power="5",played=0,priority="5",W=F,U=F,B=T,R=T,G=T)%>%
  add_row(deck="Hellrider's Pride",commander="Zevlor",power="5",played=1,priority="5",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Let Me Borrow This",commander="Yasova",power="5",played=3,priority="5",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Let's All Work Together",commander="Sen Triplets",power="6",played=5,priority="5",W=T,U=T,B=T,R=F,G=F)%>%  
  add_row(deck="Party of Two",commander="Minthara",power="5",played=0,priority="5",W=T,U=F,B=T,R=F,G=F)%>%
  add_row(deck="Point Mutation",commander="Otrimi",power="5",played=3,priority="5",W=T,U=T,B=F,R=F,G=T) %>%# priority 4: non-tournament cEDH 
  add_row(deck="Dancing Goblins",commander="Gallia",power="9",played=2,priority="4",W=F,U=F,B=F,R=T,G=T)%>%  
  add_row(deck="Macbeth's Witches",commander="Jeska & Tymna",power="9",played=0,priority="4",W=T,U=F,B=T,R=T,G=F)%>% 
  add_row(deck="PhD at Trinity",commander="Marath",power="9",played=0,priority="4",W=T,U=F,B=F,R=T,G=T)%>% 
  add_row(deck="Zombies & Jellyfish",commander="Sidisi",power="9",played=0,priority="4",W=F,U=T,B=T,R=F,G=T)%>%# priority 3: pauper 
  add_row(deck="Challenger",commander="Mr Orfeo",power="4",played=1,priority="3",W=F,U=F,B=T,R=T,G=T)%>%
  add_row(deck="Poor Little Goblins",commander="Gut",power="4",played=0,priority="3",W=F,U=F,B=T,R=T,G=F)%>% 
  # priority 2: Casual and Proxied 
  add_row(deck="Abzahn Resurgence",commander="Daghatar",power="6",played=6,priority="2",W=T,U=F,B=T,R=F,G=T)%>%
  add_row(deck="Ad Astra",commander="Belbe",power="8",played=7,priority="2",W=F,U=F,B=T,R=F,G=T)%>%
  
  add_row(deck="Be Gay Do Crimes",commander="Vadrik",power="5",played=1,priority="2",W=F,U=T,B=F,R=T,G=F)%>%
  add_row(deck="Bestowing Gifts",commander="Kestia",power="5",played=7,priority="2",W=F,U=T,B=F,R=F,G=T)%>%
  add_row(deck="Biology for the Uninitiated",commander="Runo",power="5",played=8,priority="2",W=F,U=T,B=T,R=F,G=F)%>%  
  add_row(deck="Calculator Manipulation",commander="Obeka",power="6",played=5,priority="2",W=F,U=T,B=T,R=T,G=F)%>% 
  add_row(deck="Clueing for Looks",commander="Amareth",power="5",played=4,priority="5",W=T,U=T,B=F,R=F,G=T)%>% 
  add_row(deck="Dinosaur Nursery",commander="Gavi",power="6",played=6,priority="2",W=T,U=T,B=F,R=T,G=F)%>%  
  add_row(deck="Directed Acyclic Graphs",commander="Alesha",power="5",played=5,priority="2",W=T,U=F,B=T,R=T,G=F)%>%  
  add_row(deck="Dream-Denn",commander="Killian",power="5",played=2,priority="2",W=T,U=F,B=T,R=F,G=F)%>%  
  add_row(deck="Eat the Rich",commander="Silvar & Trynn",power="6",played=6,priority="2",W=T,U=F,B=T,R=T,G=F)%>%
  add_row(deck="Elspeth of the Nine Realms",commander="Koll",power="7",played=5,priority="2",W=T,U=F,B=F,R=T,G=F)%>%  
  add_row(deck="Elves Across The Multiverse",commander="Abomination of Llanowar",power="7",played=10,priority="2",W=F,U=F,B=T,R=F,G=T)%>%  
  add_row(deck="Ethics Violations",commander="Volrath",power="6",played=2,priority="2",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Hidden Gems",commander="Kadena",power="5",played=2,priority="2",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Hunting Time",commander="Neyith",power="6",played=4,priority="2",W=F,U=F,B=F,R=T,G=T)%>%
  add_row(deck="In The Shadows",commander="Yennett",power="5",played=4,priority="2",W=T,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Jeskai Lore",commander="Shu Yun",power="5",played=0,priority="2",W=T,U=T,B=F,R=T,G=F)%>%
  add_row(deck="Keimi's Revenge",commander="Tatsunari",power="5",played=5,priority="2",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Lands of Wrath",commander="Aurelia",power="5",played=1,priority="2",W=T,U=F,B=F,R=T,G=F)%>%  
  add_row(deck="Legion of Blood",commander="Licia",power="6",played=3,priority="2",W=T,U=F,B=T,R=T,G=F)%>%  
  add_row(deck="Midnight",commander="Nekusar",power="5",played=3,priority="2",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Necrowarfare",commander="Gisa & Geralf",power="5",played=4,priority="2",W=F,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Off To See The Wizard",commander="Inalla",power="5",played=3,priority="2",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Phyrexian Hippos",commander="Perrie",power="6",played=6,priority="2",W=T,U=T,B=F,R=F,G=T) %>%
  add_row(deck="Population of Llanowar",commander="Allenal",power="5",played=0,priority="2",W=T,U=T,B=F,R=F,G=F)%>%
  add_row(deck="Snakes In The Snow",commander="Jorn",power="6",played=4,priority="2",W=F,U=T,B=T,R=F,G=T) %>%
  add_row(deck="Stegosaurus Combat Behaviour",commander="Kalamax",power="2",played=5,priority="2",W=F,U=T,B=F,R=T,G=T) %>%
  add_row(deck="Tea Time",commander="Dina",power="8",played=5,priority="2",W=F,U=F,B=T,R=F,G=T)%>%
  add_row(deck="The Noble House Of Esper",commander="Sydri",power="5",played=1,priority="2",W=T,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Time to Forget",commander="Archelos",power="6",played=5,priority="2",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="You Should Be Nicer",commander="Atla",power="6",played=6,priority="2",W=T,U=F,B=F,R=T,G=T)%>%  #priority 1: unsleeved and unfinished 
  add_row(deck="Amphibian Hugs",commander="Gor Muldark",power="5",played=5,priority="1",W=F,U=T,B=F,R=F,G=T)%>%
  add_row(deck="Astelle's Maze",commander="Nine-Fingers Keene",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="At War",commander="Anax & Cymede",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=F)%>%
  add_row(deck="Bad Vibes",commander="Mishra",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Biggest Butts",commander="Sidar & Tevesh",power="6",played=0,priority="1",W=T,U=F,B=T,R=F,G=T)%>%
  add_row(deck="Burnt Eart",commander="Erinis",power="5",played=0,priority="1",W=F,U=F,B=F,R=T,G=T)%>%
  add_row(deck="Champion",commander="Mr. Orfeo",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=T)%>%
  add_row(deck="Chaos for Everybody",commander="Sol'kanar",power="4",played=0,priority="1",W=F,U=T,B=T,R=T,G=F)%>% 
  add_row(deck="Cloudy",commander="Vadrok",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F)%>% 
  add_row(deck="Collector's Edition",commander="Pharika",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T)%>% 
  add_row(deck="Council In Session",commander="Tivit",power="6",played=0,priority="1",W=T,U=T,B=T,R=F,G=F)%>% 
  add_row(deck="Cull The Unworthy",commander="Tasigur",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T)%>% 
  add_row(deck="Curious Beasts",commander="Brallin & Shabraz",power="7",played=16,priority="1",W=T,U=T,B=F,R=T,G=F)%>%  
  add_row(deck="Cursed Gold",commander="Lynde",power="4",played=0,priority="1",W=F,U=T,B=F,R=T,G=F)%>%  
  add_row(deck="Descend into Madness",commander="Anhelo",power="4",played=0,priority="1",W=F,U=T,B=F,R=T,G=F)%>%
  add_row(deck="Distinguished Lesbians",commander="Beckett-Brass",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="Dominarian Waters",commander="Raff",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F)%>% 
  add_row(deck="Doomsday Experiment",commander="Jan",power="9",played=0,priority="1",W=T,U=F,B=T,R=T,G=F)%>%
  add_row(deck="Don't Talk To Me",commander="Florian",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=F)%>% 
  add_row(deck="Doves & Peace",commander="Lavinia",power="9",played=0,priority="1",W=T,U=T,B=F,R=F,G=F)%>% 
  add_row(deck="Elven Garden",commander="Kianne",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=T)%>% 
  add_row(deck="Elvish Scavengers",commander="Nath",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T)%>% 
  add_row(deck="Exiled to Grixis",commander="Sedris",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F)%>%   
  add_row(deck="Faceless Weapons",commander="Vhal",power="5",played=0,priority="1",W=F,U=T,B=F,R=T,G=F)%>%   
  add_row(deck="Fetching",commander="Pako & Haldane",power="5",played=0,priority="1",W=F,U=T,B=F,R=T,G=T)%>%
  add_row(deck="Fairytale Beast",commander="Uril",power="5",played=2,priority="1",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Field Ecology",commander="Lonis",power="6",played=0,priority="1",W=F,U=T,B=F,R=F,G=T)%>%
  add_row(deck="Find the Bride",commander="Korvold",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=T)%>%
  add_row(deck="Forest Awaken",commander="Anthousa",power="5",played=0,priority="1",W=F,U=F,B=F,R=F,G=T)%>%
  add_row(deck="Gaslight, Gatekeep, Girlboss",commander="Queen Marchesa",power="5",played=0,priority="1",W=T,U=F,B=T,R=T,G=F)%>%
  add_row(deck="Giving Goats Away",commander="Zedruu",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F)%>%
  add_row(deck="Golem Zoology",commander="Ich-Tekik & Silas",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Graveyard Loops",commander="Varolz",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T)%>%
  add_row(deck="Here Be Dragons",commander="Kykar",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F)%>%
  add_row(deck="Hush Now",commander="Kels",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Hybrid Zone Ascendancy",commander="Rocco",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=T)%>%
  add_row(deck="In a Flash",commander="Nymris",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Itsy Bitsy Graveyard",commander="Ishkanah",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T)%>%

  add_row(deck="Kept in Suspense",commander="Illuna",power="5",played=0,priority="1",W=F,U=T,B=F,R=T,G=T)%>%  
  add_row(deck="Knights of the Shire",commander="Mazzy",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=T)%>%
  add_row(deck="Knives Out, Yavimaya!",commander="Meria",power="5",played=0,priority="1",W=F,U=F,B=F,R=T,G=T)%>%
  add_row(deck="Leave Me Alone",commander="Xantcha",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=0)%>%  
  add_row(deck="Lord of Lords",commander="Miirym",power="5",played=0,priority="1",W=F,U=T,B=F,R=T,G=T)%>%  
  add_row(deck="Lulu's Throne",commander="Lulu",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=0)%>%  
  add_row(deck="Maelstorm Angels",commander="Jensen",power="5",played=0,priority="1",W=T,U=T,B=T,R=T,G=T)%>%
  add_row(deck="Misery Business",commander="Queza",power="5",played=0,priority="1",W=T,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Necromancy in the Kitchen",commander="Colfenor",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="News of the Day",commander="Denry Klin",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F)%>%
  add_row(deck="No, You Don't",commander="Merieke",power="5",played=0,priority="1",W=T,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Over The Hills",commander="Rubinia",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=T)%>%
  add_row(deck="Painting Elves",commander="Kalain",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=F)%>%
  add_row(deck="PhD in Genetics",commander="Mimeoplasm",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="Pillaging Ghosts",commander="Ramirez",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F)%>%
  add_row(deck="Playing in the Snow",commander="Isu",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=T)%>%
  add_row(deck="Pot of Honey",commander="Wilson",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F)%>%
  add_row(deck="Pride was a Riot",commander="Kynaios & Tiro",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=T)%>%
  add_row(deck="Pyramid of Zombies",commander="Temmet",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F)%>%
  add_row(deck="Remember the Fallen",commander="Rayami",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T) %>%
  add_row(deck="Responsible Fieldwork",commander="Quintorius",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=F)%>%
  add_row(deck="Return from the Deep",commander="Vohar",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=F) %>%
  add_row(deck="Roll for Honey",commander="Xira",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=T) %>%
  add_row(deck="Sands of the Forgotten",commander="Hazezon",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=T) %>%
  add_row(deck="Shattergang Revenge",commander="Shattergang",power="6",played=0,priority="1",W=F,U=F,B=T,R=T,G=T)%>%
  add_row(deck="Shrines to the Death",commander="Ghen",power="6",played=0,priority="1",W=T,U=F,B=T,R=T,G=F)%>%
  add_row(deck="Solve for X",commander="Zaxara",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T) %>%
  add_row(deck="So many Spellseekers",commander="Ivy",power="9",played=0,priority="1",W=F,U=T,B=F,R=F,G=T)%>%
  add_row(deck="Spores on the Playground",commander="Tana & Keskit",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T) %>% 
  add_row(deck="Keep People Humble",commander="Ivy",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=T) %>% 
  add_row(deck="Stromkirk Vampires",commander="Evelyn",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F) %>%
  add_row(deck="The Ashnod Institute for Myr Research",commander="Ashnod",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F)%>%
  add_row(deck="The Saga of Abdel",commander="Abdel & Cloakwood Hermit",power="5",played=0,priority="1",W=T,U=F,B=F,R=F,G=T)%>%  
  add_row(deck="True Love",commander="Regna & Krav",power="5",played=0,priority="1",W=T,U=F,B=T,R=F,G=F)%>%  
  add_row(deck="Trust the Process",commander="Ukkima & Cazur",power="9",played=0,priority="4",W=F,U=T,B=T,R=F,G=T)%>%
  add_row(deck="The Secret Life of Hell",commander="Raphael",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=F)%>%  
  add_row(deck="Welcome to the Circus",commander="Magar",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=F)%>%
  add_row(deck="Will Of The Council",commander="Tivit",power="5",played=0,priority="1",W=T,U=T,B=T,R=F,G=F)%>%
  add_row(deck="Weather The Storm",commander="Trelassara",power="5",played=0,priority="1",W=T,U=F,B=F,R=F,G=T)%>%
  add_row(deck="Women in STEM",commander="Sophina & Cecily",power="5",played=0,priority="1",W=T,U=T,B=T,R=T,G=F)%>% #priority 0: retired deck  
  add_row(deck="Hot Girl Summer",commander="Jeska & Tymna",power="9",played=12,priority="0",W=T,U=F,B=F,R=T,G=F)

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
played<-decks%>%filter(priority!="1" & priority!="0")%>%ggplot(aes(played,deck,fill=played))+
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

proxies<- as.data.frame(read.csv("proxies.csv",header=T,sep=";"))
proxies%>%dplyr::filter(str_detect(deck,"Atla Palani"))# example looking for cards I need to Atla 
