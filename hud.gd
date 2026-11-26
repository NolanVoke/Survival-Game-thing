extends CanvasLayer
@export var stats: Node

@onready var bars = {
	"health": $MarginContainer/HBoxContainer/HealthBar,
	"thirst": $MarginContainer/HBoxContainer/ThirstBar,
	"hunger": $MarginContainer/HBoxContainer/HungerBar,
	"energy": $MarginContainer/HBoxContainer/EnergyBar
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stats.changed.connect(_on_stat_changed)
	
	for stat_name in bars:
		bars[stat_name].value = stats.get(stat_name)
		
func _on_stat_changed(stat_name, value):
	bars[stat_name].value = value
