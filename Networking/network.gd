extends Node

const DEFAULT_IP = "127.0.0.1"
const DEFAULT_PORT = 32023
const MAX_PLAYERS = 4

var local_player_id = 0

signal player_connected
signal player_disconnected

func _ready():
	get_tree().connect("network_peer_connected", self, "_on_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_on_player_disconnected")
	
func create_server():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(peer)
	set_local_player_id()
	print("server has been created")
	print("I am " + str(local_player_id))

func set_local_player_id():
	local_player_id = get_tree().get_network_unique_id();
