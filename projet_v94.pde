void setup() {
  fullScreen();

  bckgrnd = loadImage("seamless_pink_background.jpg");
  bckgrnd.resize(width, height);
  background (bckgrnd);

  // chargement des images dans des variables
  cardsBack = loadImage("backcard.png");

  paques = loadImage("paques.jpeg");
  halloween = loadImage("halloween.jpeg");
  noel = loadImage("noel.jpeg");
  stval = loadImage("stval.jpeg");

  // la mise des images dans un tableau
  imagesSrc = new PImage[] {paques, halloween, noel, stval, paques, halloween, noel, stval};

  // mise en place des indices aléaoires pour les images
  index = new IntList();
  for (int i = 0; i < imagesSrc.length; i++) {
    index.append(i);
  }
  index.shuffle();

  // le nouveau tableau dse images aléatoire utilisées par la suite
  imagesDest = new PImage[imagesSrc.length];

  // les dimensions des images , les marges et les espaces entre les images
  cardSize = new PVector(width/5, height/3);
  margesCards = new PVector(width/25, height/9);
  cardsBack.resize(int(cardSize.x), int(cardSize.y));

  // un tableau de boolean pour voir si les cartes sont affichées
  flippedCard = new boolean[imagesDest.length];
  cardsPositions = new PVector[imagesDest.length];

  float x = margesCards.x;
  float y = margesCards.y;

  // mettre a jour la position des cartes
  for (int i = 0; i < imagesSrc.length; i++) {
    imagesDest[i] =  imagesSrc[index.get(i)];
    imagesDest[i].resize(int(cardSize.x), int(cardSize.y));
    cardsPositions[i] = new PVector(x, y);

    if ( i == imagesSrc.length /2 - 1) {
      y += cardSize.y + margesCards.y;
      x = margesCards.x;
    } else {
      x += cardSize.x + margesCards.x;
    }
  }

  // voir la fonction (affiche les images)
  displayCard();
}

void draw() {
  background(bckgrnd);
  displayCard();

  // comparaison de deux cartes selon les conditions suivantes : que les indices des cartes affichées soient différents de -1
  if (firstFlippedIndex != -1 && secondFlippedIndex != -1 && countFlippedCards() % 2 == 0 && millis() - lastFlippedTime > flipDelay) {
    if (imagesDest[firstFlippedIndex] == imagesDest[secondFlippedIndex]) {
      sameCards.append(firstFlippedIndex);        // si les images sont pareils leur indices sont ajoutés à la listge sameCards
      sameCards.append(secondFlippedIndex);
    } else {
      flippedCard[firstFlippedIndex] = false;
      flippedCard[secondFlippedIndex] = false;
    }
    firstFlippedIndex = -1;
    secondFlippedIndex = -1;
  }
}
