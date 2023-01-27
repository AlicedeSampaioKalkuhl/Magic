library(forcats)
library(tidyverse)
library(viridis)

decks<-data.frame(structure(list(deck=character(),commander=character(),power=factor(),played=numeric(),priority=factor(),W=logical(),U=logical(),B=logical(),R=logical(),G=logical(),artist=character())))
decks<-decks%>%#priority 7: Tournament cEDH

  add_row(deck="Metallic Shark",commander="Shabraz & Brallin",power="9",played=3,priority="7",W=F,U=T,B=T,R=T,G=F,artist="Paul Scott Canavanm,Paul Scott Canavan")%>%  
  add_row(deck="Obscura Doomsday",commander="Toluz",power="10",played=6,priority="7",W=T,U=T,B=T,R=F,G=F,artist="Donato Giancola")%>% 
  add_row(deck="Pompeii",commander="Gallia",power="9",played=4,priority="7",W=F,U=F,B=F,R=T,G=T,artist="Johannes Voss")%>% 
  add_row(deck="Sultai Mean Girls",commander="Sidisi",power="9",played=4,priority="7",W=F,U=T,B=T,R=F,G=T,artist="Karl Kopinski")%>%
  add_row(deck="The Weatherlight is Under Construction",commander="Jhoira",power="9",played=4,priority="7",W=F,U=T,B=F,R=T,G=F,artist="Lisa Heidhoff")%>%
  add_row(deck="Underworld Heist",commander="Cormela",power="9",played=1,priority="7",W=F,U=T,B=T,R=T,G=F,artist="Bram Sels")%>%# priority 6: LGS high power 
  add_row(deck="Depths of Darkness",commander="Thrasios & Reyhan",power="7",played=7,priority="6",W=F,U=T,B=T,R=F,G=T,artist="Josu Hernaiz,Chris Rallis") %>%
  add_row(deck="Nephalia Nightmares",commander="Jeleva",power="7",played=10,priority="6",W=F,U=T,B=T,R=T,G=F,artist="Cynthia Sheppard")%>% 
  # priority 5: LGS low power 
  add_row(deck="Astelle's Maze",commander="Nine-Fingers Keene",power="5",played=0,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Nils Hamm")%>%
  add_row(deck="Ethics Violations",commander="Volrath",power="6",played=3,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Heonhwa Choe")%>%
  add_row(deck="Failed Parley",commander="Phabine",power="5",played=5,priority="5",W=F,U=T,B=T,R=F,G=T,artist="Ryan Pancoast")%>%
  add_row(deck="Gifts to the Table",commander="Parnesse",power="6",played=9,priority="2",W=F,U=T,B=T,R=T,G=F,artist="Svetlin Velinov")%>%
  add_row(deck="Graveyard of Nightmares",commander="Beamtown Bullies",power="5",played=1,priority="5",W=F,U=F,B=T,R=T,G=T,artist="Tyler Jacobson")%>%
  add_row(deck="Hellrider's Pride",commander="Zevlor",power="5",played=3,priority="5",W=F,U=T,B=T,R=T,G=F,artist="David Rapoza")%>%
  add_row(deck="Keep People Humble",commander="Ivy",power="5",played=4,priority="5",W=F,U=T,B=F,R=F,G=T,artist="Evyn Fong") %>% 
  add_row(deck="Let Me Borrow This",commander="Yasova",power="5",played=4,priority="5",W=F,U=T,B=T,R=T,G=F,artist="Winona Nelson")%>%
  add_row(deck="Let's All Work Together",commander="Sen Triplets",power="6",played=6,priority="5",W=T,U=T,B=T,R=F,G=F,artist="Greg Staples")%>%
  add_row(deck="Party of Two",commander="Minthara",power="5",played=2,priority="5",W=T,U=F,B=T,R=F,G=F,artist="Evyn Fong")%>%
  add_row(deck="Point Mutation",commander="Otrimi",power="5",played=3,priority="5",W=T,U=T,B=F,R=F,G=T,artist="Victor Adame Minguez") %>%
  # priority 4: non-tournament cEDH 
  add_row(deck="Macbeth's Witches",commander="Jeska & Tymna",power="9",played=0,priority="4",W=T,U=F,B=T,R=T,G=F,artist="Yongjae Choi,Winona Nelson")%>% 
  add_row(deck="PhD at Trinity",commander="Marath",power="9",played=1,priority="4",W=T,U=F,B=F,R=T,G=T,artist="Tyler Jacobson")%>% 
  # priority 3: pauper 
  add_row(deck="Challenger",commander="Mr Orfeo",power="4",played=1,priority="1",W=F,U=F,B=T,R=T,G=T,artist="Daarken")%>%
  # priority 2: Casual and Proxied 
  add_row(deck="Abzahn Resurgence",commander="Daghatar",power="6",played=6,priority="2",W=T,U=F,B=T,R=F,G=T,artist="Zack Stella")%>%
  add_row(deck="Ad Astra",commander="Belbe",power="8",played=7,priority="2",W=F,U=F,B=T,R=F,G=T,artist="Igor Kieryluk")%>%
  add_row(deck="Be Gay Do Crimes",commander="Vadrik",power="5",played=1,priority="2",W=F,U=T,B=F,R=T,G=F,artist="Kieran Yanner")%>%
  add_row(deck="Bestowing Gifts",commander="Kestia",power="5",played=7,priority="2",W=F,U=T,B=F,R=F,G=T,artist="Zezhou Chen")%>%
  add_row(deck="Biology for the Uninitiated",commander="Runo",power="5",played=8,priority="2",W=F,U=T,B=T,R=F,G=F,artist="Xiaobotong")%>%  
  add_row(deck="Calculator Manipulation",commander="Obeka",power="6",played=5,priority="2",W=F,U=T,B=T,R=T,G=F,artist="Jesper Ejsing")%>% 
  add_row(deck="Clueing for Looks",commander="Amareth",power="5",played=4,priority="5",W=T,U=T,B=F,R=F,G=T,artist="Lie Setiawan")%>% 
  add_row(deck="Dinosaur Nursery",commander="Gavi",power="6",played=6,priority="2",W=T,U=T,B=F,R=T,G=F,artist="Randy Vargas")%>%  
  add_row(deck="Directed Acyclic Graphs",commander="Alesha",power="5",played=5,priority="2",W=T,U=F,B=T,R=T,G=F,artist="Winona Nelson")%>%  
  add_row(deck="Don't Talk To Me",commander="Florian",power="5",played=4,priority="2",W=F,U=F,B=T,R=T,G=F,artist="Justine Cruz")%>% 
  add_row(deck="Dream-Denn",commander="Killian with Lurrus",power="5",played=2,priority="2",W=T,U=F,B=T,R=F,G=F,artist="Ryan Pancoast,Slawomir Maniak")%>%  
  add_row(deck="Eat the Rich",commander="Silvar & Trynn",power="6",played=6,priority="2",W=T,U=F,B=T,R=T,G=F,artist="Jesper Ejsing,Jesper Ejsing")%>%
  add_row(deck="Elspeth of the Nine Realms",commander="Koll",power="7",played=5,priority="2",W=T,U=F,B=F,R=T,G=F,artist="Bram Sels")%>%  
  add_row(deck="Elves Across The Multiverse",commander="Abomination of Llanowar",power="7",played=10,priority="2",W=F,U=F,B=T,R=F,G=T,artist="Vincent Proce")%>%  
  add_row(deck="Elves With Stones",commander="Akiri & Miara",power="6",played=2,priority="2",W=T,U=F,B=T,R=T,G=F,artist="David Gaillet,Johannes Voss")%>%  
  add_row(deck="Hidden Gems",commander="Kadena",power="5",played=2,priority="2",W=F,U=T,B=T,R=F,G=T,artist="Caio Monteiro")%>%
  add_row(deck="Hunting Time",commander="Neyith",power="6",played=4,priority="2",W=F,U=F,B=F,R=T,G=T,artist="Magali Villeneuve")%>%
  add_row(deck="In The Shadows",commander="Yennett",power="5",played=4,priority="2",W=T,U=T,B=T,R=F,G=F,artist="Chris Rahn")%>%
  add_row(deck="Jeskai Lore",commander="Shu Yun",power="5",played=1,priority="2",W=T,U=T,B=F,R=T,G=F,artist="David Gaillet")%>%
  add_row(deck="Keimi's Revenge",commander="Tatsunari",power="5",played=5,priority="2",W=F,U=T,B=T,R=F,G=T,artist="Justine Cruz")%>%
  add_row(deck="Kept in Suspense",commander="Illuna",power="5",played=1,priority="2",W=F,U=T,B=F,R=T,G=T,artist="Chris Rahn")%>%
  add_row(deck="Knives Out, Yavimaya!",commander="Meria",power="5",played=1,priority="1",W=F,U=F,B=F,R=T,G=T,artist="Aurore Folny")%>%
  add_row(deck="Lands of Wrath",commander="Aurelia",power="5",played=1,priority="2",W=T,U=F,B=F,R=T,G=F,artist="Slawomir Maniak")%>%  
  add_row(deck="Legion of Blood",commander="Licia",power="6",played=3,priority="2",W=T,U=F,B=T,R=T,G=F,artist="Magali Villeneuve")%>%  
  add_row(deck="Lord of Lords",commander="Miirym",power="5",played=1,priority="2",W=F,U=T,B=F,R=T,G=T,artist="Kekai Kotaki")%>%  
  add_row(deck="Midnight",commander="Nekusar",power="5",played=3,priority="2",W=F,U=T,B=T,R=T,G=F,artist="Mark Winters")%>%
  add_row(deck="Necrowarfare",commander="Gisa and Geralf",power="5",played=4,priority="2",W=F,U=T,B=T,R=F,G=F,artist="Karla Ortiz")%>%
  add_row(deck="Off To See The Wizard",commander="Inalla",power="5",played=3,priority="2",W=F,U=T,B=T,R=T,G=F,artist="Yongjae Choi")%>%
  add_row(deck="Phyrexian Hippos",commander="Perrie with Keruga",power="6",played=6,priority="2",W=T,U=T,B=F,R=F,G=T,artist="Joshua Raphael,Dan Scott") %>%
  add_row(deck="Population of Llanowar",commander="Allenal",power="5",played=1,priority="2",W=T,U=T,B=F,R=F,G=F,artist="Carly Mazur")%>%
  add_row(deck="Prismari for Life",commander="Galazeth Prismari",power="5",played=1,priority="2",W=F,U=T,B=F,R=T,G=F,artist="Iain McCaig")%>%
  add_row(deck="Roll for Honey",commander="Xira",power="5",played=1,priority="2",W=F,U=F,B=T,R=T,G=T,artist="Mila Pesic") %>%
  add_row(deck="Snakes In The Snow",commander="Jorn",power="6",played=4,priority="2",W=F,U=T,B=T,R=F,G=T,artist="Magali Villeneuve") %>%
  add_row(deck="Spores on the Playground",commander="Tana & Keskit",power="5",played=1,priority="2",W=F,U=T,B=T,R=F,G=T,artist="Magali Villeneuve,Yongjae Choi") %>% 
  add_row(deck="Stegosaurus Combat Behaviour",commander="Kalamax",power="2",played=5,priority="2",W=F,U=T,B=F,R=T,G=T,artist="Nicholas Gregory") %>%
  add_row(deck="Tea Time",commander="Dina",power="8",played=5,priority="2",W=F,U=F,B=T,R=F,G=T,artist="Chris Rahn")%>%
  add_row(deck="The Noble House Of Esper",commander="Sydri",power="5",played=1,priority="2",W=T,U=T,B=T,R=F,G=F,artist="Therese Nielsen")%>%
  add_row(deck="Weather The Storm",commander="Trelasarra",power="5",played=0,priority="1",W=T,U=F,B=F,R=F,G=T,artist="Kieran Yanner")%>%
  add_row(deck="You Should Be Nicer",commander="Atla",power="6",played=6,priority="2",W=T,U=F,B=F,R=T,G=T,artist="Ekaterina Burmak")%>%  #priority 1: unsleeved and unfinished
  add_row(deck="Allies of the Realm",commander="Bruse & Thrasios",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=T,artist="Anthony Palumbo,Josu Hernaiz")%>%
  add_row(deck="Amphibian Hugs",commander="Gor Muldrak",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=T,artist="Steven Belledin")%>%
  add_row(deck="And They Were Roommates!",commander="Halana and Alena",power="5",played=0,priority="1",W=F,U=F,B=F,R=T,G=T,artist="Jason Rainville")%>%
  add_row(deck="At War",commander="Anax and Cymede",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=F,artist="Willian Murai")%>%
  add_row(deck="Baby Bears",commander="Ruxa",power="5",played=0,priority="1",W=F,U=F,B=F,R=F,G=T,artist="Ilse Gort")%>%
  add_row(deck="Backstreet's Back",commander="Alena & Ravos",power="5",played=0,priority="1",W=T,U=F,B=T,R=T,G=F,artist="Zoltan Boros,Carmen Sinek")%>%
  add_row(deck="Bad Girl",commander="Auntie Blyte",power="5",played=0,priority="1",W=F,U=F,B=F,R=T,G=F,artist="Tatiana Kirgetova")%>%
  add_row(deck="Bad Vibes",commander="Mishra",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Randy Vargas")%>%
  add_row(deck="Biggest Butts",commander="Sidar & Tevesh",power="6",played=0,priority="1",W=T,U=F,B=T,R=F,G=T,artist="Ryan Alexander Lee,Livia Prima")%>%
  add_row(deck="Bi Disasters",commander="Kamber & Laurine",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=F,artist="Andrey Kuzinskiy,Andrey Kuzinskiy")%>%
  add_row(deck="Burnt Eart",commander="Erinis",power="5",played=0,priority="1",W=F,U=F,B=F,R=T,G=T,artist="Ioannis Fiore")%>%
  add_row(deck="Champion",commander="Mr. Orfeo",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=T,artist="Justin Hernandez & Alexis Hernandez")%>%
  add_row(deck="Chaos for Everybody",commander="Sol'kanar",power="4",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Richard Kane Ferguson")%>% 
  add_row(deck="Cloudy",commander="Vadrok",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Jedruszek")%>% 
  add_row(deck="Collector's Edition",commander="Pharika",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T,artist="Jason A. Engle")%>% 
  add_row(deck="Council In Session",commander="Tivit",power="6",played=0,priority="1",W=T,U=T,B=T,R=F,G=F,artist="Chris Rahn")%>% 
  add_row(deck="Cull The Unworthy",commander="Tasigur",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Chris Rahn")%>% 
  add_row(deck="Cursed Gold",commander="Lynde",power="4",played=0,priority="1",W=F,U=T,B=F,R=T,G=F,artist="Anna Steinbauer")%>%  
  add_row(deck="Dawnheart Graveyard",commander="Kathilda",power="5",played=0,priority="1",W=T,U=F,B=F,R=F,G=T,artist="Byran Sola")%>%
  add_row(deck="Defending Fblthp",commander="Fblthp",power="4",played=0,priority="1",W=F,U=T,B=F,R=F,G=F,artist="Jesper Ejsing")%>%
  add_row(deck="Descend into Madness",commander="Anhelo",power="4",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Aurore Folny")%>%
  add_row(deck="Destiny & Chicken",commander="Khorvath & Sylvia",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=F,artist="Carmen Sinek,Carmen Sinek")%>%
  add_row(deck="Distinguished Lesbians",commander="Beckett-Brass",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Jason Rainville")%>%
  add_row(deck="Dominarian Waters",commander="Raff",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F,artist="Ivan Shavrin")%>% 
  add_row(deck="Doomsday Experiment",commander="Jan",power="9",played=0,priority="1",W=T,U=F,B=T,R=T,G=F,artist="Vladimir Krisetskiy")%>%
  add_row(deck="Doves & Peace",commander="Lavinia",power="9",played=0,priority="1",W=T,U=T,B=F,R=F,G=F,artist="Steven Belledin")%>% 
  add_row(deck="Drakes of Shandalar",commander="Alandra",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=F,artist="Caroline Gariba")%>% 
  add_row(deck="Dynaheir's Honour Guard",commander="Dynaheir with Zira",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Caroline Gariba,Jesper Ejsing")%>%   
  add_row(deck="Elven Garden",commander="Kianne",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=T,artist="Ryan Pancoast")%>% 
  add_row(deck="Elvish Scavengers",commander="Nath",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T,artist="Kev Walker")%>% 
  add_row(deck="Exalted Glimpses",commander="Ayesha",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F,artist="Aurore Folny")%>%  
  add_row(deck="Exiled to Grixis",commander="Sedris",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Ian Miller")%>%   
  add_row(deck="Faceless Weapons",commander="Vhal & Faceless One",power="5",played=0,priority="1",W=F,U=T,B=F,R=T,G=F,artist="David Gaillet,Gaboleps")%>% 
  add_row(deck="Fairytale Beast",commander="Uril",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Jaime Jones")%>%
  add_row(deck="Field Ecology",commander="Lonis",power="6",played=0,priority="1",W=F,U=T,B=F,R=F,G=T,artist="Andrew Mar")%>%
  add_row(deck="Forest Awaken",commander="Anthousa",power="5",played=0,priority="1",W=F,U=F,B=F,R=F,G=T,artist="Howard Lyon")%>%
  add_row(deck="Friendship is Magic",commander="Tolsimir",power="5",played=0,priority="1",W=T,U=F,B=F,R=F,G=T,artist="Ryan Pancoast")%>%
  add_row(deck="Gaslight, Gatekeep, Girlboss",commander="Queen Marchesa",power="5",played=0,priority="1",W=T,U=F,B=T,R=T,G=F,artist="Peter Diamond")%>%
  add_row(deck="Gender is a Construct",commander="Alharu & Silas",power="5",played=0,priority="1",W=T,U=T,B=T,R=F,G=F,artist="Chris Rallis,Joseph Meehan")%>%
  add_row(deck="Giving Goats Away",commander="Zedruu",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="Mark Zug")%>%
  add_row(deck="Golem Zoology",commander="Ich-Tekik & Silas",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T, artist="Aleksi Briclot,Joseph Meehan")%>%
  add_row(deck="Gorm just wants to be held",commander="Virtus & Gorm",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T,artist="Johann Bodin,Johann Bodin")%>%
  add_row(deck="Graveyard Loops",commander="Varolz",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T,artist="Adam Paquette")%>%
  add_row(deck="Here Be Dragons",commander="Kykar",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="G-host Lee")%>%
  add_row(deck="Hush Now",commander="Kels",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=F,artist="Magali Villeneuve")%>%
  add_row(deck="Hybrid Zone Ascendancy",commander="Rocco",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=T,artist="Alix Branwyn")%>%
  add_row(deck="Illusions of Grandeur",commander="Tuvasa",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=T,artist="Eric Deschamps")%>%
  add_row(deck="In a Flash",commander="Nymris",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=F,artist="Johannes Voss")%>%
  add_row(deck="Itsy Bitsy Graveyard",commander="Ishkanah",power="5",played=0,priority="1",W=F,U=F,B=T,R=F,G=T,artist="Christine Choi")%>%
  add_row(deck="Jasmine Reads Adventures",commander="Jasmine",power="5",played=0,priority="1",W=T,U=F,B=F,R=F,G=T,artist="Bastien L. Deharme")%>%

  add_row(deck="Kithkin War",commander="Vikya",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=F,artist="Zoltan Boros")%>%
  add_row(deck="Knights of the Shire",commander="Mazzy",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=T,artist="Justyna Dura")%>%
  add_row(deck="Just a Glimpse",commander="Kenessos",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=T,artist="Joshua Raphael")%>%
  add_row(deck="Leave Me Alone",commander="Xantcha",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=0,artist="Mark Winters")%>%  
  add_row(deck="Maelstorm Angels",commander="Jenson",power="5",played=0,priority="1",W=T,U=T,B=T,R=T,G=T,artist="Livia Prima")%>%
  add_row(deck="Marine Genomics",commander="Damia",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Steve Argyle")%>%
  add_row(deck="Midnight",commander="Nekusar",power="5",played=0,priority="1",W=T,U=T,B=T,R=T,G=F,artist="Mark Winters")%>%
  add_row(deck="Misery Business",commander="Queza",power="5",played=0,priority="1",W=T,U=T,B=T,R=F,G=F,artist="Julie Dillon")%>%
  add_row(deck="Necromancy in the Kitchen",commander="Colfenor",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Filip Burburan")%>%
  add_row(deck="News of the Day",commander="Denry Klin",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F,artist="Aaron J. Riley")%>%
  add_row(deck="No Waking Up",commander="Nethroi with Kaheera",power="5",played=0,priority="1",W=T,U=F,B=T,R=F,G=T, artist="Slawomir Maniak,Ryan Pancoast")%>%
  add_row(deck="No, You Don't",commander="Merieke",power="5",played=0,priority="1",W=T,U=T,B=T,R=F,G=F,artist="Heather Hudson")%>%
  add_row(deck="Over The Hills",commander="Rubinia",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=T,artist="Cynthia Sheppard")%>%
  add_row(deck="Painting Elves",commander="Kalain",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=F,artist="Justine Cruz")%>%
  add_row(deck="Palaeovirology",commander="Mimeoplasm",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Svetlin Velinov")%>%
  add_row(deck="Peace Amongst Dragons",commander="Phenax",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=F,artist="Ryan Barger")%>%
  add_row(deck="Pillaging Ghosts",commander="Ramirez",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F,artist="Anna Steinbauer")%>%
  add_row(deck="Playing in the Snow",commander="Isu",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=T,artist="Victor Adame Minguez")%>%
  add_row(deck="Poor Little Goblins",commander="Gut",power="4",played=0,priority="1",W=F,U=F,B=T,R=T,G=F,artist="Wayne Reynolds")%>% 
  add_row(deck="Pot of Honey",commander="Wilson & Feywild Visitor",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F,artist="Ilse Gort,Johann Bodin")%>%
  add_row(deck="Pride was a Riot",commander="Kynaios & Tiro",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=T,artist="Willian Murai")%>%
  add_row(deck="Pyramid of Zombies",commander="Temmet",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=F,artist="Anna Steinbauer")%>%
  add_row(deck="Release the Gremlins",commander="Wasitora",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=T,artist="Cynthia Sheppard") %>%
  add_row(deck="Remember, Remember",commander="Geist of Saint Traft",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Igor Kieryluk") %>%
  add_row(deck="Remember the Fallen",commander="Rayami",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Kieran Yanner") %>%
  add_row(deck="Responsible Fieldwork",commander="Quintorius",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=F,artist="Bryan Sola")%>%
  add_row(deck="Return from the Deep",commander="Vohar",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=F,artist="Nino Vecia") %>%
  add_row(deck="Rogues in the Night",commander="Krydle",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=F,artist="Bryan Sola")%>%
  add_row(deck="Royal Snowball",commander="Queen Marchesa",power="8",played=0,priority="1",W=T,U=F,B=T,R=T,G=F,artist="Kieran Yanner")%>%
  add_row(deck="Runic Lore",commander="Gretchen",power="9",played=0,priority="1",W=F,U=T,B=F,R=T,G=T,artist="Mila Pesic")%>%
  add_row(deck="Sands of the Forgotten",commander="Hazezon",power="5",played=0,priority="1",W=T,U=F,B=F,R=T,G=T,artist="Bryan Sola") %>%
  add_row(deck="Searching...",commander="Etrata",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=F,artist="Bastien L. Deharme")%>%
  add_row(deck="Second Breakfast",commander="Piru",power="5",played=0,priority="1",W=T,U=F,B=T,R=T,G=F,artist="Greg Staples") %>%
  add_row(deck="Shattergang Revenge",commander="Shattergang",power="6",played=0,priority="1",W=F,U=F,B=T,R=T,G=T,artist="Kev Walker")%>%
  add_row(deck="Shrines to the Death",commander="Ghen",power="6",played=0,priority="1",W=T,U=F,B=T,R=T,G=F,artist="Kieran Yanner")%>%
  add_row(deck="Sleepy Time",commander="Timin & Rhoda",power="5",played=1,priority="0",W=T,U=T,B=F,R=F,G=F,artist="Randy Vargas,Randy Vargas")%>%
  add_row(deck="Solve for X",commander="Zaxara",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Simon Dominic") %>%
  add_row(deck="Stromkirk Vampires",commander="Evelyn",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Marta Nael") %>%
  add_row(deck="The Ashnod Institute for Myr Research",commander="Ashnod",power="5",played=0,priority="1",W=F,U=T,B=T,R=T,G=F,artist="Kieran Yanner")%>%
  add_row(deck="The Stacl is Your Wonderland",commander="Neera",power="5",played=0,priority="1",W=F,U=T,B=F,R=T,G=F,artist="Pauline Voss")%>%
  add_row(deck="The Saga of Abdel",commander="Abdel & Cloakwood Hermit",power="5",played=0,priority="1",W=T,U=F,B=F,R=F,G=T,artist="Karl Kopinski,Karl Kopinski")%>%  
  add_row(deck="There Can Only Be One Guardian",commander="Ghave",power="5",played=0,priority="1",W=T,U=F,B=T,R=F,G=T,artist="James Paick")%>%  
  add_row(deck="Tron Union",commander="Self-Assembler",power="5",played=0,priority="1",W=F,U=F,B=F,R=F,G=F,artist="Toraji")%>%  
  add_row(deck="True Love",commander="Regna & Krav",power="5",played=0,priority="1",W=T,U=F,B=T,R=F,G=F,artist="Randy Vargas,Randy Vargas")%>%  
  add_row(deck="Trust the Process",commander="Ukkima & Cazur",power="9",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Daarken,Daarken")%>%
  add_row(deck="The Secret Life of Hell",commander="Raphael",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=F,artist="Livia Prima")%>%  
  add_row(deck="Undercity Expedition",commander="Tocasia",power="5",played=0,priority="1",W=T,U=T,B=F,R=F,G=T,artist="Lie Setiawan")%>%  
  add_row(deck="Unspeakable Horrors",commander="Kodama & Ghost of Ramirez",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=T,artist="Daarken,Grzegorz Rutkowski")%>%  
  add_row(deck="Welcome to the Circus",commander="Magar",power="5",played=0,priority="1",W=F,U=F,B=T,R=T,G=F,artist="Tomek Larek")%>%
  add_row(deck="Where Are My Lesbians?",commander="Ikra & Kydele ",power="5",played=0,priority="1",W=F,U=T,B=T,R=F,G=T,artist="Josu Hernaiz,Bastien L. Deharme")%>%
  add_row(deck="Wizards of the Land",commander="Zimone",power="5",played=0,priority="1",W=F,U=T,B=F,R=F,G=T,artist="Ryan Pancoast")%>%
  add_row(deck="Women in STEM",commander="Sophina & Cecily",power="5",played=0,priority="1",W=T,U=T,B=T,R=T,G=F,artist="Bartek Fedyczak,Anastasia Balakchina")%>%
  add_row(deck="You're Gonna Need Some Secularism",commander="Sarevok with Noble Heritage0",power="5",played=0,priority="1",W=T,U=F,B=T,R=F,G=F,artist="Ben Hill,Dallas Williams")%>%# priority: 0 no buying cards for this (proxy free)
  add_row(deck="Fetching",commander="Pako & Haldane",power="5",played=0,priority="0",W=F,U=T,B=F,R=T,G=T,artist="Manuel Castañón,Manuel Castañón")%>%
  add_row(deck="Find the Bride",commander="Korvold",power="5",played=0,priority="0",W=F,U=F,B=T,R=T,G=T,artist="Wisnu Tan")%>%
  add_row(deck="Frayed",commander="Eruth",power="5",played=0,priority="0",W=F,U=T,B=F,R=T,G=F,artist="Paul Jackson")%>%
  add_row(deck="Lulu's Throne",commander="Lulu & Feywild Visitor",power="5",played=0,priority="0",W=T,U=T,B=F,R=F,G=0,artist="Jakob Eirich,Johann Bodin")%>%
  add_row(deck="The Dispossesed",commander="Meren",power="5",played=0,priority="0",W=T,U=T,B=T,R=T,G=F,artist="Mark Winters")%>%
  add_row(deck="Top of the World",commander="Elsha of the Inifinte",power="5",played=0,priority="1",W=T,U=T,B=F,R=T,G=F,artist="G-host Lee")%>%
  add_row(deck="Well-Oiled Machine",commander="Rona",power="5",played=2,priority="0",W=F,U=T,B=T,R=F,G=F,artist="Ryan Alexander Lee")%>%# priority: NA retired 
add_row(deck="Hot Girl Summer",commander="Jeska & Tymna",power="9",played=12,priority=NA,W=T,U=F,B=T,R=T,G=F,artist="Yongjae Choi,Winona Nelson")

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
