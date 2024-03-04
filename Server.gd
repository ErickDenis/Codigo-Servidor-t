extends Node

var network = NetworkedMultiplayerENet.new()
var port = 4242
var max_players = 100

func _ready():
	StartServer()

func StartServer():
	var newtwork_is_on = network.create_server(port, max_players)
	if newtwork_is_on != OK:
		print("Server could not be created")
		return
	get_tree().set_network_peer(network)
	network.connect("peer_connected", self, "_Peer_Connected")
	network.connect("peer_disconnected", self, "_Peer_Disconnected")
	print("Server started")
	
func _Peer_Connected(player_id):
	print("User"+str(player_id) + " Connected")
	
func _Peer_Disconnected(player_id):
	print("User"+str(player_id) + " Disconnected")
