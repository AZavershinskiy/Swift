// Task 1-4
protocol MenuProtocol {
	var cost: Double
}

struct Pizza: MenuProtocol {
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

struct FrenchFries: MenuProtocol {
	var cost: Double
	var size: Size
	
	enum Size {
		case s
		case m
		case l
	}
}

class Pizzeria {
	private var menu: [MenuProtocol]
	
	init(menu: [MenuProtocol]) {
		self.menu = menu
	}
	
	func add(position: MenuProtocol) {
		menu.append(position)
	}
	
	func getMenu() -> [MenuProtocol] {
		self.menu
	}
}

protocol WorkProtocol {
	func open()
	func closed()
}

extension Pizzeria: WorkProtocol {
	func open() {
		print("The pizzeria is open")
	}
	
	func closed() {
		print("Pizzeria is closed")
	}
}

var myPizzeria = Pizzeria(menu: [])

let menuItem1 = FrenchFries(cost: 100, size: .m)
let menuItem2 = Pizza(cost: 500, type: .greek, doughThick: false, additives: .sauce)

myPizzeria.add(position: menuItem1)
myPizzeria.add(position: menuItem2)

myPizzeria.getMenu()
myPizzeria.getMenu()[0]
print(myPizzeria.getMenu().count)


// Task 5
func subtraction<T: Numeric>(a: T, b: T) -> T {
	a - b
}

print(subtraction(a: 5, b: 8.9))
