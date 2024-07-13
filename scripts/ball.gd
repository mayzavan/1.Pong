extends RigidBody2D

var set0
var set1
var set2

func _ready():
	set0 = true
	set1 = false

func reset():
	set0 = true

func _integrate_forces(state):
	if set0:
		state.transform.origin = Vector2(1152/2,648/2)
		state.linear_velocity = Vector2.ZERO
		state.angular_velocity = 0
		set0 = false
	if set1:
		state.linear_velocity = Vector2(randf_range(-200,200),350)
		set1 = false
	if set2:
		state.linear_velocity = Vector2(randf_range(-200,200),-350)
		set2 = false

func start(who):
	match who:
		1:
			set1 = true
		2:
			set2 = true

func _physics_process(delta):
	var old_direction = self.angular_velocity
	await get_tree().create_timer(0.03, false).timeout
	if old_direction != self.angular_velocity:
		$AudioStreamPlayer.play()
