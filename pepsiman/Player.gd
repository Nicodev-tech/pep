extends KinematicBody2D

export (int) var speed = 0
export (int) var max_speed = 300
export (float) var acceleration = .7
export (float) var friction = 0.5
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		rotation_dir += 1
	if Input.is_action_pressed("left"):
		rotation_dir -= 1
	if Input.is_action_pressed("up"):
		speed = lerp(speed,max_speed, get_process_delta_time()*acceleration)
	else:
		speed = lerp(speed,0, get_process_delta_time()*friction)
	if Input.is_action_pressed("down"):
		pass
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
