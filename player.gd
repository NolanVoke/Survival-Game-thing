extends CharacterBody2D

const SPEED = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_down")
	if Input.is_action_pressed("sprint"):
		velocity = input_dir * SPEED * 1.75
	else:
		velocity = input_dir * SPEED
	move_and_slide()

	
