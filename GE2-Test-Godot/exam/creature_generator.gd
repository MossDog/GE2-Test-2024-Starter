extends Node3D

@export var length = 0
@export var start_angle = 0
@export var frequency = 0
@export var base_size = 0
@export var mult = 0
@export var headScn:PackedScene
@export var bodyScn:PackedScene
var body_instances = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var head = headScn.instantiate()
	add_child(head)
	
	for i in range(length):
		var body_instance = bodyScn.instantiate()
		head.add_child(body_instance)
		body_instance.global_transform.origin.x = head.global_transform.origin.x - (5000 * i)
		body_instances.append(body_instance)
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(body_instances.size()):
		var body_instance = body_instances[i]
		var size = base_size * sin(frequency + i)
		body_instance.scale = Vector3(base_size, base_size, base_size)
		
	pass
