extends Node

class_name BaseCard

@export_category("Card Fields")

@export var cardName : String
@export var id : String
@export var rarity : CardEnums.CardRarity
@export var type : Array[CardEnums.CardType]
@export var keywords : Array[CardEnums.CardKeyword]
@export var targets : CardEnums.CardTarget
@export var canFight : bool
@export var power : int
@export var toughness : int

func MakeCopy() -> BaseCard:
	var cardCopy = BaseCard.new()
	return cardCopy

func UseOnDraw():
	pass

func UseOnPlay():
	pass

func UseOnDeath():
	pass

func UseOnAttack():
	pass

func UseOnBlock():
	pass

func UseOnUpkeep():
	pass

func UseOnEndOfTurn():
	pass
