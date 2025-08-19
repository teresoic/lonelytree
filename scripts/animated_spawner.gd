extends Node2D
# AnimatedSpawner.gd

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	animated_sprite.play("spawn")  # First animation
	animated_sprite.animation_finished.connect(_on_animation_finished)

func _on_animation_finished():
	# Create new node
	var debuff_item = preload("res://scenes/DebuffItem.tscn").instantiate()
	debuff_item.global_position = global_position
	get_parent().add_child(debuff_item)
	queue_free() # remove this spawner
