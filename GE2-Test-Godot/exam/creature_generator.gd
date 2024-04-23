extends Node3D

@export var length = 200
@export var start_angle = 0
@export var frequency = 2
@export var base_size = 15
@export var mult = 0
@export var headScn:PackedScene
@export var bodyScn:PackedScene
var body_instances = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var head_instance = headScn.instantiate()
	add_child(head_instance)
	
	for i in range(length):
		var body_instance = bodyScn.instantiate()
		head_instance.add_child(body_instance)

		body_instances.append(body_instance)
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(body_instances.size()):
		var body_instance = body_instances[i]
		var size = base_size * sin(i)
		body_instance.size = Vector3(size, size, size)
		body_instance.global_transform.origin.x = body_instance.get_parent().global_transform.origin.x - body_instance.get_size().x
		
		
	pass
