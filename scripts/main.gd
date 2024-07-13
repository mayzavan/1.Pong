extends Node

var enemyscore
var playerscore
var stopped
var acceleration = 100000
var who

func _ready():
	playerscore = 0
	enemyscore = 0
	who = int(randf_range(1,3))
	stop()

func _input(event):
	if Input.is_action_just_pressed('Start') and stopped == true:
		start()

func _on_enemy_goal_body_entered(body):
	playerscore += 1
	who = 2
	stop()
	$ScoreHUD/AudioStreamPlayer.play()

func _on_player_goal_body_entered(body):
	enemyscore += 1
	who = 1
	stop()
	$ScoreHUD/AudioStreamPlayer.play()

func start():
	stopped = false
	$ball.reset()
	$Paddle.reset()
	$PlayerPaddle.reset()
	$ScoreHUD.hide()
	$PlayerPaddle.start()
	$Paddle.start()
	await get_tree().create_timer(1.5, false).timeout
	$ball.start(who)

func stop():
	stopped = true
	$ball.reset()
	$PlayerPaddle.stop()
	$Paddle.stop()
	$ScoreHUD.show()
	$ScoreHUD/EnemyScore.text = str(enemyscore)
	$ScoreHUD/PlayerScore.text = str(playerscore)
