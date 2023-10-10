extends Node

class_name PlayerManager

@export var theDeck : Deck

var cardsInPlay : Array[BaseCard] = Array[BaseCard]
var cardsInGraveyard : Array[BaseCard] = Array[BaseCard]
var cardsInHand : Array[BaseCard] = Array[BaseCard]

func AddCardToHandViaDraw():
	var card = theDeck.Draw()
	card.UseOnDraw()
	cardsInHand.append(card)

func AddCardToPlay(card : BaseCard):
	card.UseOnPlay()
	cardsInPlay.erase(card)
	cardsInPlay.append(card)
	# Do visual processes of putting the card in play at the appropriate position

func AddCardToPlayFromHand(card : BaseCard):
	card.UseOnPlay()
	cardsInHand.erase(card)
	cardsInPlay.append(card)

func RemoveCardFromPlay(card : BaseCard):
	# Removes card from play without calling UseOnDeath of card
	# and without adding it to the graveyard
	cardsInPlay.erase(card)
	# Do visual procsses of removing card from the play area

func AddCardToGraveyard(card : BaseCard):
	card.UseOnDeath()
	cardsInPlay.erase(card)
	cardsInGraveyard.append(card)

func DiscardCardToGraveyard(card : BaseCard):
	card.UseOnDiscard()
	cardsInHand.erase(card)
	cardsInGraveyard.append(card)

func StartTurnProcess():
	theDeck.Draw
	for card in cardsInPlay:
		card.UseOnUpkeep()

func EndTurnProcess():
	for card in cardsInPlay:
		card.UseOnEndOfTurn()
