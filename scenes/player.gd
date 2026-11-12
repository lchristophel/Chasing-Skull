extends CharacterBody3D

# La variable speed définit la vitesse en mètre par second 
@export var speed = 30;
# La variable gravity définit la vitesse de retombée à cause de la gravité
@export var gravity = 45;

# La vélocité du personnage c'est une valeur qui va faire en sorte de le déplacer
# si elle contient : une direction & une vitess

# Fonction qui s'appelle à chaque frame
func _physics_process(delta):

	# Creation de la variable direction qui va contenir le Vector3 à zéro (x,y,z)
	var direction = Vector3.ZERO;
	# Si touche de déplacement vers l'avant pressée
	if Input.is_action_pressed("move_forward"):
		# L'axe Z de la variable direction (Vector3) s'incrémente de 1 (donc avance de 1)
		direction.z -= 1;
	if Input.is_action_pressed("move_back"):
		direction.z += 1;
	if Input.is_action_pressed("move_left"):
		direction.x -= 1;
	if Input.is_action_pressed("move_right"):
		direction.x += 1;
	
	# Si la direction n'est pas égale à zéro via les appuis d'input
	if direction != Vector3.ZERO:
		# On normalize la valeur de direction pour éviter les bugs de vitesse en appuyant sur plusieurs touches
		direction = direction.normalized();
	
	velocity.x = direction.x * speed;
	velocity.z = direction.z * speed;
	if not is_on_floor():
		velocity.y -= gravity * delta;

	move_and_slide();
	
