extends CharacterBody3D

@export var speed = 30;
@export var gravity = 45;

func _physics_process(delta):
	var direction = Vector3.ZERO;
	
	if Input.is_action_pressed("move_forward"):
		direction.z += 1;
	if Input.is_action_pressed("move_back"):
		direction.z -= 1;
	if Input.is_action_pressed("move_left"):
		direction.x += 1;
	if Input.is_action_pressed("move_right"):
		direction.x -= 1;

	if direction != Vector3.ZERO:
		direction = direction.normalized();
	
	velocity.x = direction.x * speed;
	velocity.z = direction.z * speed;
	if not is_on_floor():
		velocity.y -= gravity * delta;

	move_and_slide();
	
