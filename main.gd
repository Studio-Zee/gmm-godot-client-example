extends Node2D

@onready var status_label = $CanvasLayer/Control/Label # Crie um nó Label na cena

var socket = WebSocketPeer.new()
var url = "ws://127.0.0.1:8080" 

func _ready():
	if not has_node("Label"):
		print("AVISO: Crie um nó 'Label' para ver o status na tela.")
	else:
		status_label.text = "Conectando no GMM Server..."
		
	print("Conectando no GMM Server...")
	socket.connect_to_url(url)

func _process(_delta):
	socket.poll()
	var state = socket.get_ready_state()
	
	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			var packet = socket.get_packet()
			var text = packet.get_string_from_utf8()
			
			# Parse do JSON com segurança
			var data = JSON.parse_string(text)
			
			# Se o data for válido e for um dicionário
			if typeof(data) == TYPE_DICTIONARY and data.has("cmd"):
				
				if data["cmd"] == "joined_server":
					var my_uuid = data["content"]["uuid"]
					print("Conectado! Meu UUID é: ", my_uuid)
					if status_label:
						status_label.text = "ONLINE\nSeu UUID: " + str(my_uuid)
						status_label.add_theme_color_override("font_color", Color.GREEN)
				
				elif data["cmd"] == "spawn_new_player":
					var new_uuid = data["content"]["player"]["uuid"]
					print("Novo jogador entrou: ", new_uuid)

	elif state == WebSocketPeer.STATE_CLOSED:
		if status_label:
			status_label.text = "Servidor Offline"
			status_label.add_theme_color_override("font_color", Color.RED)
