extends KinematicBody2D

export var SPEED = 4
var velocity = Vector2()
export var disabled = false
var horizontal = false
var vertical = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if not disabled:
		if Input.is_action_pressed("ui_right") and not vertical:
			$AnimatedSprite.play("right")
			velocity.x = SPEED
			horizontal = true
		elif Input.is_action_just_released("ui_right"):
			$AnimatedSprite.play("right-idle")
			velocity.x = 0
			horizontal = false
		elif Input.is_action_pressed("ui_left") and not vertical:
			$AnimatedSprite.play("left")
			velocity.x = -SPEED
			horizontal = true
		elif Input.is_action_just_released("ui_left"):
			$AnimatedSprite.play("left-idle")
			velocity.x = 0
			horizontal = false
		elif Input.is_action_pressed("ui_down") and not horizontal:
			$AnimatedSprite.play("down")
			velocity.y = SPEED
			vertical = true
		elif Input.is_action_just_released("ui_down"):
			$AnimatedSprite.play("down-idle")
			velocity.y = 0
			vertical = false
		elif Input.is_action_pressed("ui_up") and not horizontal:
			$AnimatedSprite.play("up")
			velocity.y = -SPEED
			vertical = true
		elif Input.is_action_just_released("ui_up"):
			$AnimatedSprite.play("up-idle")
			velocity.y = 0
			vertical = false
		velocity = velocity.normalized() * SPEED
		var _collision = move_and_collide(velocity)
