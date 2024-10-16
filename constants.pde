PImage bckgrnd, paques, halloween, noel, stval, cardsBack;
PImage[] imagesSrc;
IntList index;
PImage[] imagesDest;

PVector cardSize;
PVector margesCards;
boolean[] flippedCard;
IntList sameCards = new IntList(1);
PVector[] cardsPositions;

int firstFlippedIndex = -1;
int secondFlippedIndex = -1;

int flipDelay = 750;
int lastFlippedTime = 0;
