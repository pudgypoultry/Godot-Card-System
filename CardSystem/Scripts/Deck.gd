extends Node

class_name Deck

@export var cards : Array[BaseCard]

func GetSize() -> int:
	return cards.size()

func Draw() -> BaseCard:
	var tempCard = cards[0]
	cards.remove_at(0)
	return tempCard

func DrawFromPosition(pos : int) -> BaseCard:
	var tempCard = cards[pos]
	cards.remove_at(pos)
	return tempCard

func Shuffle():
	cards.shuffle()

func GetLocationsOfCardInDeck(whichCard : String) -> Array[int]:
	var counter = 0
	var locationList : Array[int] = []
	
	for card in cards:
		if card.cardName == whichCard:
			locationList.append(counter)
		counter += 1
	
	return locationList

func GetCountOfCardNameInDeck(whichCard : String) -> int:
	var counter = 0
	
	for card in cards:
		if card.cardName == whichCard:
			counter += 1
	
	return counter

func GetCountOfCardTypeInDeck(whichType : CardEnums.CardType) -> int:
	var counter = 0
	
	for card in cards:
		if card.type.has(whichType):
			counter += 1
	
	return 0

func InsertCardAtDeckPosition(cardToInsert : BaseCard, positionToInsert : int):
	cards.insert(positionToInsert, cardToInsert)

func PutCardOnTop(cardToPlace : BaseCard):
	cards.insert(0, cardToPlace)

func PutCardOnBottom(cardToPlace : BaseCard):
	cards.insert(cards.size() - 1, cardToPlace)

func LookAtTopX(x : int) -> Array[BaseCard]:
	var returnList = []
	
	for i in range(x):
		returnList.append(cards[i])
	
	return returnList

func ProbabiltyOfDrawingType(typeToFind : CardEnums.CardType) -> float:
	var counter = 0
	
	for card in cards:
		if card.type.has(typeToFind):
			counter += 1
	
	return counter / cards.size()

func ProbabilityOfDrawingCard(cardToFind : BaseCard) -> float:
	var counter = 0
	
	for card in cards:
		if card.name == cardToFind.name:
			counter += 1
	
	return counter / cards.size()

