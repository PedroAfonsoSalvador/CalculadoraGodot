extends Control

var display_label
var display_text = "" # Variável para armazenar o texto atual da label

func _ready():
	# Encontrar a label chamada "display" dentro da hierarquia do nó
	display_label = get_node("Background/Display/Label")

# Função para atualizar o texto da label
func update_display_text(new_text):
	display_text += new_text
	display_label.text = display_text

# Números
func _on_zero_pressed():
	update_display_text("0")

func _on_um_pressed():
	update_display_text("1")

func _on_dois_pressed():
	update_display_text("2")

func _on_três_pressed():
	update_display_text("3")

func _on_quatro_pressed():
	update_display_text("4")

func _on_cinco_pressed():
	update_display_text("5")

func _on_seis_pressed():
	update_display_text("6")

func _on_sete_pressed():
	update_display_text("7")

func _on_oito_pressed():
	update_display_text("8")

func _on_nove_pressed():
	update_display_text("9")


#Operações
func _on_igual_pressed():
	var a = display_text.split(" ")
	match a[1]:
		"+":
			display_label.text = str(int(a[0]) + int(a[2]))
			display_text = str(int(a[0]) + int(a[2]))
		"-":
			display_label.text = str(int(a[0]) - int(a[2]))
			display_text = str(int(a[0]) - int(a[2]))
		"/":
			display_label.text = str(int(a[0])/int(a[2]))
			display_text =str(int(a[0])/int(a[2]))
		"x":
			display_label.text = str(int(a[0])*int(a[2]))
			display_text = str(int(a[0])*int(a[2]))


func _on_divisão_pressed():
	if operation_in_progress():
		_on_igual_pressed()
	update_display_text(" / ")

func _on_vezes_pressed():
	if operation_in_progress():
		_on_igual_pressed()
	update_display_text(" x ")

func _on_menos_pressed():
	if operation_in_progress():
		_on_igual_pressed()
	update_display_text(" - ")

func _on_mais_pressed():
	if operation_in_progress():
		_on_igual_pressed()
	update_display_text(" + ")

func operation_in_progress() -> bool:
	return display_text.contains("/") || display_text.contains("x") || display_text.contains("+") || display_text.contains("-")




#Misc
func _on_ac_pressed():
	display_label.text = "0"
	display_text = ""


func _on_apagar_pressed():
	if display_text.length() > 0:
		display_text = display_text.left(display_text.length() - 1)
		display_label.text = display_text
