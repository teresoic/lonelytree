# DebuffItem.gd
extends Area2D

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.play("idle")  # looping animation for the debuff item
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node):
#    if body.is_in_group("player"):  # make sure your player is in "player" group
	if body is PlayerController:
		if body.has_method("apply_slowdown"):
			body.apply_slowdown(4.0, 0.02)  # 2 seconds duration, 50% speed
		queue_free()
