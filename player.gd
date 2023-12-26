extends CharacterBody2D

@export var ACCELERATION = 500
@export var MAX_SPEED = 1000
@export var FRICTION  = 500

@onready var main = $".."

func _physics_process(delta):
	move(delta)

func move(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		main.addscore()
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide()


func _on_area_2d_area_entered(area):
	main.game_over()
	
	#get_tree().change_scene_to_file("res://game_over.tscn")
	pass # Replace with function body.
