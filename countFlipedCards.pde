// affecte à la variable flippedCount le nombre de cartes retournées (nb de true dans le tableau flippedCard) sans compter ceux dont l'indice sont dans le tableau sameCards
int countFlippedCards() {
  int flippedCount = 0;
  for (int i = 0; i  < flippedCard.length; i++) {
    if (flippedCard[i] && !sameCards.hasValue(i)) {
      flippedCount ++;
    }
  }
  return flippedCount;
}
