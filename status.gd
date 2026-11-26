extends Node2D

signal changed(stat, value)

#status + status watchers
var health := 100.0:
	set(v):
		health = clamp(v, 0, 100)
		changed.emit("health", health)
var thirst := 100.0:
	set(v):
		thirst = clamp(v, 0, 100)
		changed.emit("thirst", thirst)
var hunger := 100.0:
	set(v):
		hunger = clamp(v, 0, 100)
		changed.emit("hunger", hunger)
var energy := 100.0:
	set(v):
		energy = clamp(v, 0, 100)
		changed.emit("energy", energy)
		
#status change rates
const HUNGERRATE = 0.0556 
const THIRSTRATE = 0.111
const ENERGYRATE = 0.0278
const HEALTHLOSSRATE = 1.67
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hunger -= HUNGERRATE * delta
	thirst -= THIRSTRATE * delta
	if Input.is_action_pressed("sprint"):
		energy -= ENERGYRATE * delta * 2
	else:
		energy -= ENERGYRATE * delta
	
	if hunger == 0:
		health -= HEALTHLOSSRATE * delta
	if thirst == 0:
		health -= HEALTHLOSSRATE * delta
	if energy == 0:
		health -= HEALTHLOSSRATE * delta
