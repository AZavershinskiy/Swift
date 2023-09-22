protocol MenuProtocol {
	var cost: Double { get }
	var name: String { get }
}

struct TeaStruct: MenuProtocol {
	var name: String { type.rawValue + " tea" }
	var type: Tea
	var cost: Double
	var temperature: Double
	
	enum Tea: String {
		case black
		case green
		case fruit
	}
	
	init(type: Tea, cost: Double, temperature: Double) {
		self.type = type
		self.cost = cost
		self.temperature = temperature
	}
	
	func getCost (sale: Int) -> Double {
		guard sale <= 50 else {
			print("Discount cannot be applied!")
			return cost
		}
		return cost - (cost / 100 * Double(sale))
	}
}

var a: [TeaStruct] = [TeaStruct(type: .black, cost: 100, temperature: 70)]
var b = a

func getAddress(_ collection: UnsafeRawPointer) {
	print(Int(bitPattern: collection))
}

getAddress(a)
getAddress(b)

b.append(TeaStruct(type: .green, cost: 120, temperature: 50))
print("--")

getAddress(a)
getAddress(b)

//


class TestClass {
	var test: String = "test"
}

var c = TestClass()
var d = c

d.test = "testNew"

print("--")
print(c.test)
print(d.test)

//


struct TestStruct {
	var test: String = "test"
}

var e = TestStruct()
var f = e

f.test = "testNew"

print("--")
print(e.test)
print(f.test)

//


class Shop {
	var products: [Product]
	var employees: [Employee]
	var director: Director
	var cafe: Cafe
	
	init(products: [Product], employees: [Employee], director: Director) {
		self.products = products
		self.employees = employees
		self.director = director
		cafe = Cafe(menu: [], director: director)
	}
	
	func addEmployee(employee: Employee) {
		employees.append(employee)
	}
	
	func addProduct(product: Product) {
		products.append(product)
	}
	
	func getCafeMenu() -> [String: [MenuProtocol]] {
		var teas: [TeaStruct] = []
		var lemonades: [Lemonade] = []
		var salads: [Salad] = []
		cafe.menu.forEach{ position in
			if let product = position as? TeaStruct {
				teas.append(product)
			} else if let product = position as? Lemonade {
				lemonades.append(product)
			} else if let product = position as? Salad {
				salads.append(product)
			}
		}
		return ["Teas": teas, "Lemonades": lemonades, "Salads": salads]
	}
	
	func getCostItemCafeMenu() -> [String: [Double]] {
		let dictMenu = getCafeMenu()
		var dictItemCost: [String: [Double]] = [:]
		dictMenu.forEach{ position in
			let cost = position.value.map { $0.cost }
			dictItemCost.updateValue(cost, forKey: position.key)
		}
		return dictItemCost
	}
}

struct Product {
	var name: String
	var cost: Double
}

struct Employee {
	var name: String
}

class Director {
	weak var shop: Shop?
	
	init(shop: Shop) {
		self.shop = shop
	}
}

//


class Cafe {
	fileprivate var menu: [MenuProtocol]
	var director: Director
	
	init (menu: [MenuProtocol], director: Director) {
		self.menu = menu
		self.director = director
	}
	
	func add(position: MenuProtocol) {
		menu.append(position)
	}
	
	func getMenu() -> [MenuProtocol] {
		menu
	}
	
	func getItems(cost: Double) -> [MenuProtocol]? {
		menu.filter{ $0.cost <= cost }
	}
	
	func getTempTeas() {
		menu.forEach { position in
			guard let tea = position as? TeaStruct else { return }
			print(tea.temperature)
		}
	}
}

struct Lemonade: MenuProtocol {
	var cost: Double
	var name: String
}

struct Salad: MenuProtocol {
	var cost: Double
	var name: String
}
