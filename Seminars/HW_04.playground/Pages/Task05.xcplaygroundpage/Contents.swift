class Pizzeria {
	private var pizza: [PizzaStruct]
	
	init(pizza: [PizzaStruct]) {
		self.pizza = pizza
	}
	
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
	
	func addPizza(pizza: PizzaStruct) {
		self.pizza.append(pizza)
	}
	
	func getAllPizzas() -> [PizzaStruct] {
		self.pizza
	}
}

let pizza1 = Pizzeria.PizzaStruct(cost: 400, type: .margherita, doughThick: false, additives: .pineapple)
let pizza2 = Pizzeria.PizzaStruct(cost: 500, type: .chicago, doughThick: true, additives: .olives)

var pizzeria = Pizzeria(pizza: [])

pizzeria.addPizza(pizza: pizza1)
pizzeria.getAllPizzas()

pizzeria.addPizza(pizza: pizza2)
pizzeria.getAllPizzas()

