extends Node2D

@onready var QuitButton : Button = $CanvasGroup/Panel/VBoxContainer/ExitButton
@onready var PlayButton : Button = $CanvasGroup/Panel/VBoxContainer/PlayButton
@onready var QuitConfirm : ConfirmationDialog = $CanvasGroup/Panel/ConfirmationDialog

# Called when the node enters the scene tree for the first time.
func _ready():
	QuitButton.pressed.connect(func():
		QuitConfirm.show()
	)
	
	PlayButton.pressed.connect(func(): get_tree().change_scene_to_file("res://levels/Level_1.tscn"))
	
	QuitConfirm.get_ok_button().connect("pressed", func(): get_tree().quit())
