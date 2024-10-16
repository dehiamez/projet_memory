// affecte l'indice de la carte lors d'un clic dessus à la variable firstFlippedIndex ou secondFlippedIndex selon le cas.
void mouseClicked() {
  if (countFlippedCards() % 2 == 1 || countFlippedCards() == 0) {
    for (int i = 0; i < imagesDest.length; i++) {
      if (!flippedCard[i] && isInsideCard(cardsPositions[i].x, cardsPositions[i].y)) {
        flippedCard[i] = true;
        if (firstFlippedIndex == -1) {
          firstFlippedIndex = i;
        } else if (secondFlippedIndex == -1) {
          lastFlippedTime = millis();
          secondFlippedIndex = i;
        }
      }
    }
  }
}
