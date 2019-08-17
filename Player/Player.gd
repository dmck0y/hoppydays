extends KinematicBody2D

var motion = Vector2(0, 0)
const SPEED = 1000
const GRAVITY = 300
const UP = Vector2(0, -1)
const JUMP_SPEED = 4000

signal animate

func _physics_process(delta):
	apply_gravity()
	animate()
	var isLeft = Input.is_action_pressed('left')
	var isRight = Input.is_action_pressed('right')
	var jumping = Input.is_action_pressed('jump')

	if jumping:
		jump()

	if isLeft and not isRight:
		motion.x = -SPEED
	elif isRight and not isLeft:
		motion.x = SPEED
	else:
		motion.x = 0

	move_and_slide(motion, UP)	
		
func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY

func jump():
	if is_on_floor(): 
		motion.y -= JUMP_SPEED

func animate():
	emit_signal('animate', motion)