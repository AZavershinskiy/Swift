protocol MenuProtocol {
	var cost: Double { get }
}

class Pizzeria {
	private var menu: [MenuProtocol]
	var employees: [Employee]
	var tables: [Table]
	
	init(menu: [MenuProtocol], employees: [Employee]) {
		self.menu = menu
		self.employees = employees
		tables = []
	}
	
	func add(position: MenuProtocol) {
		menu.append(position)
	}
	
	func getMenu() -> [MenuProtocol] {
		self.menu
	}
}

struct Employee {
	var name: String
	var salary: Double
	var post: Post
	
	enum Post {
		case cashier
		case cook
	}
}

class Table {
	var seats: Int
	weak var pizzeria: Pizzeria?
	
	init(seats: Int, pizzeria: Pizzeria) {
		self.seats = seats
		self.pizzeria = pizzeria
	}
	
	func getEnoughPlaces(guests: Int) -> Bool {
		guard guests <= seats else {
			return false
		}
		return true
	}
}

let employee1 = Employee(name: "Kristina", salary: 100_000, post: .cook)

let myPizzeria = Pizzeria(menu: [], employees: [employee1])

let table1 = Table(seats: 4, pizzeria: myPizzeria)

print(employee1.name, employee1.salary, employee1.post)
print(table1.seats)

print(table1.getEnoughPlaces(guests: 4))
print(table1.getEnoughPlaces(guests: 5))
