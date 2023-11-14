struct PizzaStruct {
	var cost: Double
	var type: PizzaType
	var doughThick: Bool
	var additives: Additives
	
	enum PizzaType {
		case neapolitan
		case chicago
		case margherita
		case sicilian
		case greek
	}
	
	enum Additives {
		case pineapple
		case bacon
		case gherkin
		case pepper
		case sauce
		case olives
	}
}

var myPizza = PizzaStruct(cost: 200, type: .margherita, doughThick: true, additives: .olives)
