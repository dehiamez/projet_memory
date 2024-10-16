// affiche les cartes selon leur etat (dans le tableau flippedCard)
void displayCard() {
  for (int i = 0; i < imagesDest.length; i ++) {
    float x = cardsPositions[i].x;
    float y = cardsPositions[i].y;

    if (flippedCard[i]) {
      image(imagesDest[i], x, y);
    } else {
      image(cardsBack, x, y);
    }
    noFill();
    stroke(198, 15, 135);
    strokeWeight(8);
    strokeJoin(ROUND);
    rect(x, y, cardSize.x, cardSize.y);
  }
}
