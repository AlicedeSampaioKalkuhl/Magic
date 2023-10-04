library(forcats)
library(tidyverse)
library(viridis)
library(ggrepel)

# If you don't wan to edit your decks from within R, you can import any table with the same column names. 
decks<-data.frame(structure(list(deck=character(),commander=character(),power=factor(),played=numeric(),won=numeric(),draw=numeric(),lost=numeric(),priority=factor(),W=logical(),U=logical(),B=logical(),R=logical(),G=logical(),artist=character(),plane=character())))
decks<-decks%>%#priority 6: Tournament cEDH
  add_row(deck="Destoying Ravnica",commander="Borborygmos and Fblthp",power="9",played=10,won=2,draw=3,lost=5,priority="6",W=T,U=T,B=T,R=F,G=F,artist="Justin Hernandez,Alexis Hernandez",plane='Ravnica,Ravnica')%>% 
  add_row(deck="Obscura Doomsday",commander="Toluz",power="9",played=11,won=5,draw=1,lost=5,priority="6",W=T,U=T,B=T,R=F,G=F,artist="Donato Giancola",plane='New Capenna')%>%# priority 5: LGS proxy free
  add_row(deck="As Foretold",commander="Codie",power="5",played=6,won=1,draw=0,lost=5,priority="5",W=T,U=T,B=T,R=T,G=t,artist="Daniel Ljunggren",plane='Arcavios')%>%
  add_row(deck="Best Poster Award",commander="Zimone and Dina",power="5",played=0,won=0,draw=0,lost=0,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Anato Finnstark,Anato Finnstark",plane='Arcavios,Arcavios')%>%
  add_row(deck="Bestowing Gifts",commander="Kestia",power="5",played=10,won=2,draw=0,lost=8,priority="2",W=F,U=T,B=F,R=F,G=T,artist="Zezhou Chen",plane='Theros')%>%
  add_row(deck="Bi Disasters",commander="Kamber & Laurine",power="5",played=2,won=1,draw=0,lost=1,priority="5",W=F,U=F,B=T,R=T,G=F,artist="Andrey Kuzinskiy,Andrey Kuzinskiy",plane='Innistrad,Innistrad')%>%
  add_row(deck="Calculator Manipulation",commander="Obeka",power="6",played=7,won=2,draw=1,lost=4,priority="5",W=F,U=T,B=T,R=T,G=F,artist="Jesper Ejsing",plane='Unknown')%>% 
  add_row(deck="Clueing for Looks",commander="Katilda and Lier",power="6",played=2,won=0,draw=0,lost=0,priority="2",W=T,U=T,B=F,R=F,G=T,artist="Lie Setiawan",plane='Innistrad,Innistrad')%>% 
  add_row(deck="Descend Into Madness",commander="Xander",power="5",played=2,won=1,draw=0,lost=1,priority="5",W=F,U=T,B=T,R=T,G=F,artist="Tran Nguyen",plane='New Capenna') %>%
  add_row(deck="Elspeth of the Nine Realms",commander="Kroxa and Kunoros",power="5",played=6,won=1,draw=0,lost=5,priority="5",W=T,U=F,B=F,R=T,G=F,artist="Jason A. Engle",plane='Theros,Theros')%>%
  add_row(deck="Elves With Stones",commander="Akiri & Miara w. Lurrus",power="6",played=2,won=1,draw=0,lost=1,priority="2",W=T,U=F,B=T,R=T,G=F,artist="David Gaillet,Johannes Voss,Steve Ellis",plane='Zendikar,Lorwyn,Ikoria')%>% 
  add_row(deck="Ethics Violations",commander="Volrath",power="6",played=3,won=1,draw=0,lost=2,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Heonhwa Choe",plane='Dominaria')%>%
  add_row(deck="Everchosen Snow",commander="Najeela",power="5",played=2,won=0,draw=0,lost=2,priority="5",W=T,U=T,B=T,R=T,G=T,artist="Antonio José Manzanedo",plane='Kylem')%>%
  add_row(deck="Failed Parley",commander="Phabine",power="5",played=5,won=2,draw=0,lost=3,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Ryan Pancoast",plane='New Capenna')%>%
  add_row(deck="Fangorn Composting",commander="Old Man Willow",power="5",played=0,won=0,draw=0,lost=1,priority="1",W=F,U=F,B=T,R=F,G=T,artist="Miklós Ligeti",plane='Middle Earth')%>%
  add_row(deck="Graveyard of Nightmares",commander="Vial Smasher & Thrasios",power="5",played=2,won=0,draw=0,lost=2,priority="5",W=F,U=T,B=T,R=T,G=T,artist="Deruchenko Alexander,Josu Hernaiz",plane='Tarkir,Theros')%>%
  add_row(deck="Hidden Gems",commander="Tymna & Kydele",power="5",played=2,won=0,draw=0,lost=2,priority="2",W=T,U=T,B=T,R=F,G=T,artist="Winona Nelson,Bastien L. Deharme",plane='Theros,Theros')%>%
  add_row(deck="Keep People Humble",commander="Ivy",power="7",played=5,won=1,draw=0,lost=4,priority="5",W=F,U=T,B=F,R=F,G=T,artist="Evyn Fong",plane='Dominaria') %>% 
  add_row(deck="Let's All Work Together",commander="Sen Triplets",power="6",played=6,won=0,draw=0,lost=6,priority="5",W=T,U=T,B=T,R=F,G=F,artist="Greg Staples",plane='Alara,Alara,Alara')%>%
  add_row(deck="Nephalia Nightmares",commander="Jeleva",power="6",played=12,won=5,draw=1,lost=6,priority="5",W=F,U=T,B=T,R=T,G=F,artist="Cynthia Sheppard",plane='Innistrad')%>% 
  add_row(deck="Phyrexian Hippos",commander="Perrie w. Keruga",power="6",played=6,won=2,draw=0,lost=4,priority="5",W=T,U=T,B=F,R=F,G=T,artist="Joshua Raphael,Dan Scott",plane='New Capenna,Ikoria') %>%
  add_row(deck="Remember the Fallen",commander="Rayami",power="6",played=2,won=0,draw=0,lost=2,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Kieran Yanner",plane='Zendikar') %>%
  add_row(deck="Rolling Blackouts",commander="Yidris",power="5",played=4,won=2,draw=0,lost=2,priority="5",W=F,U=T,B=T,R=T,G=T,artist="Karl Kopinski",plane='Alara') %>%
  add_row(deck="Stegosaurus Combat Behaviour",commander="Kalamax",power="2",played=6,won=2,draw=0,lost=4,priority="5",W=F,U=T,B=F,R=T,G=T,artist="Nicholas Gregory",plane='Ikoria') %>%
  add_row(deck="The Omens of Death",commander="Saruman",power="5",played=1,won=0,draw=0,lost=1,priority="2",W=F,U=T,B=T,R=T,G=F,artist="Leonardo Borazio",plane='Middle Earth')%>%
  add_row(deck="The Stack Is Your Wonderland",commander="Parnesse",power="6",played=11,won=1,draw=1,lost=9,priority="5",W=F,U=T,B=T,R=T,G=F,artist="Svetlin Velinov",plane='New Capenna')%>%
  add_row(deck="We Ride At Dusk",commander="Elenda and Azor",power="6",played=4,won=2,draw=0,lost=2,priority="5",W=T,U=T,B=T,R=F,G=F,artist="Randy Vargas,Randy Vargas",plane='Ixalan,Ixalan')%>%
  add_row(deck="What About Second Breakfast?",commander="Merry & Pippin",power="5",played=2,won=0,draw=1,lost=1,priority="2",W=T,U=F,B=T,R=F,G=T,artist="Viko Menezes,Viko Menezes",plane='Middle Earth')%>%
  add_row(deck="Where are my lesbians?",commander="Nine-Fingers Keene",power="5",played=2,won=1,draw=0,lost=1,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Nils Hamm",plane='Forgotten Realms')%>%
  add_row(deck="You Should Be Nicer",commander="Atla",power="6",played=8,won=1,draw=0,lost=7,priority="5",W=T,U=F,B=F,R=T,G=T,artist="Ekaterina Burmak",plane='Ixalan')%>% 
  # priority 4: Other formats
  add_row(deck="Challenger",commander="Mr Orfeo",power="4",played=1,won=1,draw=0,lost=0,priority="4",W=F,U=F,B=T,R=T,G=T,artist="Daarken",plane='New Capenna')%>%
  add_row(deck="Don't Worry About It",commander="Lukka",power="5",played=0,won=0,draw=0,lost=0,priority="4",W=F,U=F,B=F,R=T,G=T,artist="Chase Stone",plane='Ikoria') %>%
  add_row(deck="Enchanted Contracts",commander="Leovold",power="5",played=3,won=1,draw=0,lost=2,priority="4",W=F,U=T,B=T,R=F,G=T,artist="Magali Villeneuve",plane='Fiora') %>%
  # priority 3: non-tournament cEDH 
  add_row(deck="Pompeii",commander="Gallia",power="3",played=6,won=0,draw=0,lost=6,priority="3",W=F,U=F,B=F,R=T,G=T,artist="Johannes Voss",plane='Theros')%>% 
  add_row(deck="The Weatherlight is Under Construction",commander="Jhoira",power="7",played=8,won=0,draw=0,lost=8,priority="3",W=F,U=T,B=F,R=T,G=F,artist="Lisa Heidhoff",plane='Dominaria')%>%
  # priority 2: Casual and Proxied 
  add_row(deck="Directed Acyclic Graphs",commander="Alesha",power="5",played=5,won=2,draw=0,lost=3,priority="2",W=T,U=F,B=T,R=T,G=F,artist="Winona Nelson",plane='Tarkir')%>%  
  add_row(deck="Don't Talk To Me",commander="Rowan w. Obosh",power="5",played=6,won=1,draw=0,lost=5,priority="2",W=F,U=F,B=T,R=T,G=F,artist="Abigail Larson,Denis Medri",plane='Eldraine,Ikoria')%>% 
  add_row(deck="Enchanted to Meet You",commander="Anikthea",power="7",played=1,won=1,draw=0,lost=0,priority="2",W=F,U=F,B=T,R=T,G=F,artist="Magali Villeneuve",plane='Theros')%>% 
  add_row(deck="Elves Across The Multiverse",commander="Abomination of Llanowar",power="7",played=11,won=6,draw=0,lost=5,priority="2",W=F,U=F,B=T,R=F,G=T,artist="Vincent Proce",plane='Dominaria',)%>%  
  add_row(deck="Guardian of the Lost",commander="Ephara",power="5",played=1,won=0,draw=0,lost=1,priority="2",W=T,U=T,B=F,R=F,G=F,artist="Jason A. Engle",plane='Theros')%>%
  add_row(deck="Level Up",commander="Esika",power="5",played=2,won=0,draw=0,lost=2,priority="2",W=T,U=T,B=T,R=T,G=T,artist="Nana Qi,GodMachine",plane='Kaldheim')%>%
  add_row(deck="Necrowarfare",commander="Gisa and Geralf",power="5",played=4,won=2,draw=0,lost=2,priority="2",W=F,U=T,B=T,R=F,G=F,artist="Aaron J. Riley",plane='Innistrad,Innistrad')%>%
  add_row(deck="Prismari for Life",commander="Galazeth Prismari",power="5",played=2,won=1,draw=0,lost=1,priority="2",W=F,U=T,B=F,R=T,G=F,artist="Iain McCaig",plane='Arcavios')%>%
  add_row(deck="Release the Gremlins",commander="Vazi",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=F,R=T,G=T,artist="José Parodi",plane='New Capenna') %>%
 #priority 1: unsleeved and unfinished
  add_row(deck="Be Gay, Do Crimes",commander="Kynaios and Tiro",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=T,G=T,artist="Willian Murai,Willian Murai",plane='Theros, Theros')%>%   
  add_row(deck="Clash of Titans",commander="Mayael",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=F,B=F,R=T,G=T,artist="Jason Chan",plane='Alara')%>% 
  add_row(deck="Clash over Bounty",commander="Imoti",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=F,R=F,G=T,artist="Ekaterina Burmak",plane='Amonkhet')%>% 
  add_row(deck="Cull The Unworthy",commander="Tasigur",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Chris Rahn",plane='Tarkir')%>% 
  add_row(deck="Defending Fblthp",commander="Fblthp",power="4",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=F,R=F,G=F,artist="Marija Tiurina",plane='Ravnica')%>%
  add_row(deck="Due Diligence",commander="Eloise",power="6",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=T,R=F,G=F,artist="Jarel Threat",plane='Innistrad')%>%
  add_row(deck="Fruit Salad",commander="Tazri",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Chris Rahn",plane='Zendikar')%>% 
  add_row(deck="Gender is a Construct",commander="Alharu & Silas",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=T,R=F,G=F,artist="Chris Rallis,Joseph Meehan",plane='unkown,Alara')%>%
  add_row(deck="Giving Goats Away",commander="Zedruu",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Mark Zug",plane='Ikoria')%>%
  add_row(deck="Hidden Beasts",commander="Kodama & Ludevic",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=F,B=T,R=F,G=T,artist="Daarken,Aaron Miller",plane='Kamigawa,Innistrad')%>%
  add_row(deck="Ixhel's Creations",commander="Ixhel",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=F,B=T,R=F,G=T,artist="Campbell White",plane='New Phyrexia')%>%
  add_row(deck="Iwan Iwanowitsch Goratschin",commander="Ruric Thar",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=F,B=F,R=T,G=T,artist="Alice de Sampaio Kalkuhl (alter)",plane='Ravnica')%>%
  add_row(deck="My Turn",commander="Rashmi and Ragavan",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=T,B=F,R=T,G=T,artist="Joshua Cairos,Joshua Cairos",plane='Kaladesh,Kaladesh')%>%
  add_row(deck="Revenge of the Khans",commander="Narset",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Domenico Cava",plane='Tarkir') %>%
  add_row(deck="Shadowborn Devotion",commander="Raphael",power="5",played=0,won=0,draw=0,lost=0,priority="1",W=F,U=F,B=T,R=T,G=F,artist="Livia Prima",plane='Forgotten Realms')%>%
  add_row(deck="Spores on the Playground",commander="Slimefoot and Squee",power="5",played=1,won=0,draw=0,lost=1,priority="1",W=F,U=F,B=T,R=T,G=T,artist="Ivan Shavrin,Ivan Shavrin",plane='Dominaria,Dominaria')%>% 
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
decks%>%group_by(power)%>%count()
# playable decks
decks%>%filter(priority>"1")%>%count()


# win stats 
played <- decks %>% filter(played>0) %>% mutate(win=(won+0.5*draw)/played) %>% arrange(-win)
played_results <- ggplot(played, aes(x=lost,y=won,label=commander)) +
  geom_point(aes(size=played,fill=commander,colour=priority))+
  geom_text_repel(aes(label = commander),size=2,vjust = -.5,max.overlaps = 21)+
  scale_colour_viridis_d()+
  theme(legend.position = "none")+
  facet_wrap(~priority,ncol=2,labeller = as_labeller(c("1"="In Progress","2"="Casual & Proxied","3"="Non-Tournament cEDH","4"="Other","5"="LGS Proxy Free","6"="Tournament cEDH")))
played_results
ggsave('results.png')
# cEDH stats 
cEDH <- decks %>% filter(priority=='6') %>% mutate(win=(won+0.5*draw)/played) %>% arrange(-win)
cEDH_results <- ggplot(cEDH, aes(x=lost,y=won,label=commander)) +
                  geom_point(aes(size=played,colour=commander))+
                  geom_text(check_overlap = TRUE,hjust = 0, nudge_x = -0.2,nudge_y = -0.15)+
                  scale_colour_viridis_d()+
                  theme(legend.position = "none")
cEDH_results
ggsave('cEDH_results.png')
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
