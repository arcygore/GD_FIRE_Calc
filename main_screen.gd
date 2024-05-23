extends CanvasLayer

@onready var net_investments = $NetInvestments
@onready var fire_age = $FireAge
@onready var current_age = $CurrentAge
@onready var recurring_investments = $RecurringInvestments
@onready var interest_rate = $InterestRate
@onready var future_amount = $FutureAmount
@onready var investments_input = $InvestmentsInput

# future_amount = net_investments(1+(interest_rate/12))^12*(fire_age-current_age) + (recurring_investments * (((1+(interest_rate/12))^12)-1)/(interest_rate/12)

func convert_values_to_number():
	net_investments = get_input_child_by_type(net_investments).text.to_float()
	interest_rate = get_input_child_by_type(interest_rate).text.to_float()/100

func get_input_child_by_type(parent):
	for child in parent.get_children():
		if child is TextEdit:
			return child

func calculate_compound_interest():
	pass

func _ready():
	convert_values_to_number()
	print(net_investments)
	var future_amount_float = net_investments*interest_rate
	future_amount.text = "$" + future_amount_float.to_string() # Doesn't work
