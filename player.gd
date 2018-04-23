extends Area2D

export (int) var SPEED
var velocity = Vector2()
var screensize

export (PackedScene) var projectile

func _ready():
	screensize = get_viewport_rect().size

func _process(delta):
	
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	

func _input(event):
	if event.is_action_pressed("click"):
		var active_projectile = projectile.instance()
		add_child(active_projectile)