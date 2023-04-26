library(forcats)
library(tidyverse)
library(viridis)

decks<-data.frame(structure(list(deck=character(),commander=character(),power=factor(),played=numeric(),won=numeric(),draw=numeric(),lost=numeric(),priority=factor(),W=logical(),U=logical(),B=logical(),R=logical(),G=logical(),artist=character(),plane=character())))
decks<-decks%>%#priority 7: Tournament cEDH
  add_row(deck="Destoying Ravnica",commander="Borborygmos and Fblthp",power="9",played=1,won=0,draw=0,lost=1,priority="8",W=T,U=T,B=T,R=F,G=F,artist="Justin Hernandez,Alexis Hernandez",plane='Ravnica,Ravnica')%>% 
  add_row(deck="Obscura Doomsday",commander="Toluz",power="9",played=11,won=5,draw=1,lost=5,priority="8",W=T,U=T,B=T,R=F,G=F,artist="Donato Giancola",plane='New Capenna')%>% 
  add_row(deck="Sultai Mean Girls",commander="Sidisi",power="9",played=4,won=2,draw=0,lost=2,priority="8",W=F,U=T,B=T,R=F,G=T,artist="Karl Kopinski",plane='Tarkir')%>%
  add_row(deck="Underworld Heist",commander="Cormela",power="9",played=1,won=0,draw=0,lost=1,priority="8",W=F,U=T,B=T,R=T,G=F,artist="Bram Sels",plane='New Capenna')%>%# priority 6: LGS proxy free
  add_row(deck="As Foretold",commander="Gnostro",power="5",played=6,won=1,draw=0,lost=5,priority="7",W=T,U=T,B=F,R=F,G=F,artist="Lars Grant-West",plane='Theros')%>%
  add_row(deck="Astelle's Maze",commander="Nine-Fingers Keene",power="5",played=2,won=1,draw=0,lost=1,priority="7",W=F,U=T,B=T,R=F,G=T,artist="Nils Hamm",plane='Forgotten Realms')%>%
  add_row(deck="Bestowing Gifts",commander="Kestia",power="5",played=10,won=2,draw=0,lost=8,priority="2",W=F,U=T,B=F,R=F,G=T,artist="Zezhou Chen",plane='Theros')%>%
  add_row(deck="Bi Disasters",commander="Kamber & Laurine",power="5",played=2,won=1,draw=0,lost=1,priority="7",W=F,U=F,B=T,R=T,G=F,artist="Andrey Kuzinskiy,Andrey Kuzinskiy",plane='Innistrad,Innistrad')%>%
  add_row(deck="Calculator Manipulation",commander="Obeka",power="6",played=5,priority="7",W=F,U=T,B=T,R=T,G=F,artist="Jesper Ejsing",plane='Unknown')%>% 
  add_row(deck="Clueing for Looks",commander="Katilda and Lier",power="6",played=2,won=0,draw=0,lost=0,priority="2",W=T,U=T,B=F,R=F,G=T,artist="Lie Setiawan",plane='Innistrad,Innistrad')%>% 
  add_row(deck="Descend Into Madness",commander="Anhelo",power="5",played=2,won=1,draw=0,lost=1,priority="7",W=F,U=T,B=T,R=T,G=F,artist="Marta Nael",plane='New Capenna') %>%
  add_row(deck="Eat the Rich",commander="Silvar & Trynn",power="6",played=6,won=3,draw=0,lost=3,priority="2",W=T,U=F,B=T,R=T,G=F,artist="Jesper Ejsing,Jesper Ejsing",plane='Ikoria,Ikoria')%>%
  add_row(deck="Elspeth of the Nine Realms",commander="Kroxa and Kunoros",power="5",played=6,won=1,draw=0,lost=5,priority="7",W=T,U=F,B=F,R=T,G=F,artist="Jason A. Engle",plane='Theros,Theros')%>%
  add_row(deck="Elves With Stones",commander="Akiri & Miara w. Lurrus",power="6",played=2,won=1,draw=0,lost=1,priority="2",W=T,U=F,B=T,R=T,G=F,artist="David Gaillet,Johannes Voss,Steve Ellis",plane='Zendikar,Lorwyn,Ikoria')%>% 
  add_row(deck="Ethics Violations",commander="Volrath",power="6",played=3,won=1,draw=0,lost=2,priority="7",W=F,U=T,B=T,R=F,G=T,artist="Heonhwa Choe",plane='Dominaria')%>%
  add_row(deck="Everchosen Snow",commander="Najeela",power="5",played=2,won=0,draw=0,lost=2,priority="7",W=T,U=T,B=T,R=T,G=T,artist="Antonio José Manzanedo",plane='Kylem')%>%
  add_row(deck="Failed Parley",commander="Phabine",power="5",played=5,won=2,draw=0,lost=3,priority="7",W=F,U=T,B=T,R=F,G=T,artist="Ryan Pancoast",plane='New Capenna')%>%
  add_row(deck="Graveyard of Nightmares",commander="Beamtown Bullies",power="5",played=2,won=0,draw=0,lost=2,priority="7",W=F,U=F,B=T,R=T,G=T,artist="Tyler Jacobson",plane='New Capenna')%>%
  add_row(deck="Hidden Gems",commander="Kadena",power="5",played=2,won=0,draw=0,lost=2,priority="2",W=F,U=T,B=T,R=F,G=T,artist="Caio Monteiro",plane='Tarkir')%>%
  add_row(deck="Illusions of Property",commander="Rubinia",power="5",played=1,won=0,draw=0,lost=1,priority="7",W=T,U=T,B=F,R=F,G=T,artist="Cynthia Sheppard",plane='Unknown')%>%
  add_row(deck="Keep People Humble",commander="Ivy",power="7",played=5,won=1,draw=0,lost=4,priority="7",W=F,U=T,B=F,R=F,G=T,artist="Evyn Fong",plane='Dominaria') %>% 
  add_row(deck="Let's All Work Together",commander="Sen Triplets",power="6",played=6,won=0,draw=0,lost=6,priority="7",W=T,U=T,B=T,R=F,G=F,artist="Greg Staples",plane='Alara,Alara,Alara')%>%
  add_row(deck="Nephalia Nightmares",commander="Jeleva",power="6",played=12,won=5,draw=1,lost=6,priority="7",W=F,U=T,B=T,R=T,G=F,artist="Cynthia Sheppard",plane='Innistrad')%>% 
  add_row(deck="Off To See The Wizard",commander="Inalla",power="5",played=5,won=0,draw=0,lost=5,priority="7",W=F,U=T,B=T,R=T,G=F,artist="Yongjae Choi",plane='Unknown')%>%
  add_row(deck="Phyrexian Hippos",commander="Perrie w. Keruga",power="6",played=6,won=2,draw=0,lost=4,priority="7",W=T,U=T,B=F,R=F,G=T,artist="Joshua Raphael,Dan Scott",plane='New Capenna,Ikoria') %>%
  add_row(deck="Point Mutation",commander="Otrimi",power="5",played=3,won=1,draw=0,lost=2,priority="7",W=T,U=T,B=F,R=F,G=T,artist="Victor Adame Minguez",plane='Ikoria') %>%
  add_row(deck="Remember the Fallen",commander="Rayami",power="6",played=2,won=0,draw=0,lost=2,priority="7",W=F,U=T,B=T,R=F,G=T,artist="Kieran Yanner",plane='Zendikar') %>%
  add_row(deck="Reyhan and the Merfolks",commander="Thrasios & Reyhan",power="7",played=8,won=3,draw=0,lost=5,priority="7",W=F,U=T,B=T,R=F,G=T,artist="Josu Hernaiz,Chris Rallis",plane='Theros,Tarkir') %>%
  add_row(deck="Rolling Blackouts",commander="Yidris",power="5",played=3,priority="7",W=F,U=T,B=T,R=T,G=T,artist="Karl Kopinski",plane='Alara') %>%
  add_row(deck="Stegosaurus Combat Behaviour",commander="Kalamax",power="2",played=6,won=2,draw=0,lost=4,priority="7",W=F,U=T,B=F,R=T,G=T,artist="Nicholas Gregory",plane='Ikoria') %>%
  add_row(deck="The Stack Is Your Wonderland",commander="Parnesse",power="6",played=9,won=0,draw=1,lost=8,priority="7",W=F,U=T,B=T,R=T,G=F,artist="Svetlin Velinov",plane='New Capenna')%>%
   add_row(deck="True Love",commander="Regna & Krav",power="5",played=2,won=0,draw=0,lost=2,priority="7",W=T,U=F,B=T,R=F,G=F,artist="Randy Vargas,Randy Vargas",plane='Kylem,Kylem')%>%  
  add_row(deck="We Ride At Dusk",commander="Elenda and Azor",power="6",played=4,won=2,draw=0,lost=2,priority="7",W=T,U=T,B=T,R=F,G=F,artist="Randy Vargas,Randy Vargas",plane='Ixalan,Ixalan')%>%
  add_row(deck="Where Are My Lesbians?",commander="Zimone and Dina",power="5",played=0,won=0,draw=0,lost=0,priority="7",W=F,U=T,B=T,R=F,G=T,artist="Anato Finnstark,Anato Finnstark",plane='Arcavios,Arcavios')%>%
  add_row(deck="You Should Be Nicer",commander="Atla",power="6",played=8,won=1,draw=0,lost=7,priority="7",W=T,U=F,B=F,R=T,G=T,artist="Ekaterina Burmak",plane='Ixalan')%>% 
  # priority 6: Oathbreaker & Pendragon
  add_row(deck="Don't Worry About It",commander="Lukka",power="5",played=0,won=0,draw=0,lost=0,priority="6",W=F,U=F,B=F,R=T,G=T,artist="Chase Stone",plane='Ikoria') %>%
  add_row(deck="For Uther!",commander="Ponyback Brigade",power="5",played=0,won=0,draw=0,lost=0,priority="6",W=F,U=F,B=F,R=T,G=T,artist="Mark Zug",plane='Tarkir') %>%
  # priority 5: Tiny Leaders   
  add_row(deck="Enchanted Contracts",commander="Leovold",power="5",played=0,won=0,draw=0,lost=0,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Magali Villeneuve",plane='Fiora') %>%
  # priority 4: pauper 
  add_row(deck="Challenger",commander="Mr Orfeo",power="4",played=1,won=0,draw=0,lost=0,priority="1",W=F,U=F,B=T,R=T,G=T,artist="Daarken",plane='New Capenna')%>%
  # priority 3: non-tournament cEDH 
  add_row(deck="Metallic Shark",commander="Shabraz & Brallin",power="3",played=3,priority="4",W=F,U=T,B=T,R=T,G=F,artist="Paul Scott Canavanm,Paul Scott Canavan",plane='Ikoria,Ikoria')%>%  
  add_row(deck="Pompeii",commander="Gallia",power="3",played=4,priority="4",W=F,U=F,B=F,R=T,G=T,artist="Johannes Voss",plane='Theros')%>% 
  add_row(deck="The Weatherlight is Under Construction",commander="Jhoira",power="7",played=8,won=0,draw=0,lost=8,priority="3",W=F,U=T,B=F,R=T,G=F,artist="Lisa Heidhoff",plane='Dominaria')%>%
  # priority 2: Casual and Proxied 
  add_row(deck="Directed Acyclic Graphs",commander="Alesha",power="5",played=5,priority="2",W=T,U=F,B=T,R=T,G=F,artist="Winona Nelson",plane='Tarkir')%>%  
  add_row(deck="Don't Talk To Me",commander="Florian w. Obosh",power="5",played=4,priority="2",W=F,U=F,B=T,R=T,G=F,artist="Justine Cruz,Denis Medri",plane='Innistrad,Ikoria')%>% 
  add_row(deck="Elves Across The Multiverse",commander="Abomination of Llanowar",power="7",played=11,won=6,draw=0,lost=5,priority="2",W=F,U=F,B=T,R=F,G=T,artist="Vincent Proce",plane='Dominaria',)%>%  
  add_row(deck="Kept in Suspense",commander="Illuna",power="5",played=2,won=1,draw=0,lost=1,priority="2",W=F,U=T,B=F,R=T,G=T,artist="Chris Rahn",plane='Ikoria')%>%
  add_row(deck="Jeskai Tales",commander="Shu Yun",power="4",played=1,won=0,draw=0,lost=1,priority="2",W=T,U=T,B=F,R=T,G=F,artist="David Gaillet",plane='Tarkir')%>%
  add_row(deck="Necrowarfare",commander="Gisa and Geralf",power="5",played=4,won=2,draw=0,lost=2,priority="2",W=F,U=T,B=T,R=F,G=F,artist="Aaron J. Riley",plane='Innistrad,Innistrad')%>%
  add_row(deck="Prismari for Life",commander="Galazeth Prismari",power="5",played=2,won=1,draw=0,lost=1,priority="2",W=F,U=T,B=F,R=T,G=F,artist="Iain McCaig",plane='Arcavios')%>%
 #priority 1: unsleeved and unfinished
  add_row(deck="A Tooting Time",commander="Tusk and Whiskers",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=F,B=F,R=F,G=T,artist="Chris Seaman,Chris Seaman",plane='Interplanar Galaxy,Interplanar Galaxy')%>% 
  add_row(deck="Bumblebee",commander="St. Traft and Rem",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Lucas Graciano,Lucas Graciano",plane='Innistrad,Innistrad')%>% 
  add_row(deck="Collector's Edition",commander="Pharika w. Umori",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=F,B=T,R=F,G=T,artist="Jason A. Engle, Daniel Warren Johnson",plane='Theros,Ikoria')%>% 
  add_row(deck="Cull The Unworthy",commander="Tasigur",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Chris Rahn",plane='Tarkir')%>% 
  add_row(deck="Cursed Gold",commander="Lynde",power="4",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=F,R=T,G=F,artist="Anna Steinbauer",plane='Innistrad')%>%    
  add_row(deck="Creteaceous Beasts",commander="Nethroi w. Kaheera",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=F,B=T,R=F,G=T, artist="Slawomir Maniak,Ryan Pancoast",plane='Ikoria')%>%
  add_row(deck="Defending Fblthp",commander="Fblthp",power="4",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=F,R=F,G=F,artist="Marija Tiurina",plane='Ravnica')%>%
  add_row(deck="Dynaheir's Honour Guard",commander="Dynaheir w. Zira",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Caroline Gariba,Jesper Ejsing",plane='Forgotten Realms,Ikoria')%>% 
  add_row(deck="Fruit Salad",commander="Tazri",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Chris Rahn",plane='Zendikar')%>% 
  add_row(deck="Gender is a Construct",commander="Alharu & Silas",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=T,R=F,G=F,artist="Chris Rallis,Joseph Meehan",plane='unkown,Alara')%>%
  add_row(deck="Giving Goats Away",commander="Zedruu",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Mark Zug",plane='Ikoria')%>%
  add_row(deck="Guardian of the Lost",commander="Ephara",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=F,G=F,artist="Eric Deschamps",plane='Theros')%>%
  add_row(deck="Hidden Beasts",commander="Kodama & Ludevic",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=F,B=T,R=F,G=T,artist="Daarken,Aaron Miller",plane='Kamigawa,Innistrad')%>%
  add_row(deck="Ixhel's Creations",commander="Ixhel",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=F,B=T,R=F,G=T,artist="Campbell White",plane='New Phyrexia')%>%
  add_row(deck="Jasmine Reads Adventures",commander="Jasmine",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=F,B=F,R=F,G=T,artist="Bastien L. Deharme",plane='Dominaria')%>%
  add_row(deck="My Turn",commander="Rashmi and Ragavan",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=F,R=T,G=T,artist="Joshua Cairos,Joshua Cairos",plane='Kaladesh,Kaladesh')%>%
  add_row(deck="Nope",commander="Ertai",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=T,R=F,G=F,artist="Sidharth Chaturvedi",plane='Dominaria')%>%
  add_row(deck="Pride was a Riot",commander="Kynaios & Tiro",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=T,G=T,artist="Willian Murai",plane='Theros')%>%
  add_row(deck="Release the Gremlins",commander="Gimbal",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=F,R=T,G=T,artist="Fajareka Setiawan",plane='Kaladesh') %>%
  add_row(deck="Runic Lore",commander="Gretchen",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=F,R=F,G=T,artist="Mila Pesic",plane='Forgotten Realms')%>%
  add_row(deck="Shadowborn Devotion",commander="Raphael",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=F,B=T,R=T,G=F,artist="Livia Prima",plane='Forgotten Realms')%>%
  add_row(deck="Sunburst in the Vastes",commander="The Peregrine Dynamo",power="9",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=F,B=F,R=F,G=F,artist="Zoltan Boros",plane='Dominaria')%>%
  add_row(deck="Spores on the Playground",commander="Slimefoot and Squee",power="5",played=1,won=0,draw=0,lost=1,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Ivan Shavrin,Ivan Shavrin",plane='Dominaria,Dominaria')%>% 
  add_row(deck="Venture Across Planes",commander="Safana & Flaming Fist",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=F,B=T,R=F,G=F,artist="Wisnu Tan,Diego Gisbert",plane='Forgotten Realms,Forgotten Realms')
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
# powerlevel
decks%>%filter(priority!="0")%>%group_by(power)%>%count()
# playable decks
decks%>%filter(priority!="1"&!is.na(priority))%>%count()
# cEDH stats 
cEDH <- decks %>% filter(priority=='8') %>% mutate(win=won/played) %>% arrange(-win)
cEDH_results <- ggplot(cEDH, aes(x=lost,y=won,label=commander)) +
                  geom_point(aes(size=played,colour=commander))+
                  geom_text(check_overlap = TRUE,hjust = 0, nudge_x = -0.2,nudge_y = -0.15)+
                  scale_colour_viridis_d()+
                  theme(legend.position = "none")
cEDH_results
buildme<-decks%>%filter(priority=="1")
buildme%>%pull(commander)
# wishlist (This is currently a little behind)


artists<-decks%>%separate_rows(artist,sep=',')%>%group_by(artist)%>%summarise(n=n())%>%arrange(desc(n))
artists
decks%>%dplyr::filter(str_detect(artist,"Jesper Ejsing"))%>%arrange(commander)%>%pull(commander) 

# filter by colour
decks%>%dplyr::filter(U==T&W==T)%>%pull(commander)

# planes 
planes <- decks %>% separate_rows(plane,sep=',') %>% drop_na() %>% group_by(plane) %>% summarise(n=n()) %>% arrange(-n)
planes
