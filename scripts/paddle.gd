extends RigidBody2D

var acceleration = 1000
var set0 = false
var stopped

func _ready():
	set0 = true
	stopped = true

func _physics_process(delta):
	self.position.y = 43
	if Input.is_action_pressed("SecondLeft") and self.position.x >= 60 and self.position.x <= 1092 and stopped == false:
		self.linear_velocity.x -= acceleration/2 * delta
	if Input.is_action_pressed("SecondRight") and self.position.x <= 1092 and self.position.x >= 60 and stopped == false:
		self.linear_velocity.x += acceleration/2 * delta

func reset():
	set0 = true
	stopped = true

func _integrate_forces(state):
	if set0:
		state.transform.origin = Vector2(576,43)
		state.linear_velocity = Vector2.ZERO
		set0 = false

func start():
	stopped = false

func stop():
	stopped = true
