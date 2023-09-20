protocol MenuProtocol {
	var cost: Double { get }
	var name: String { get }
}

class Cafe {
	fileprivate var menu: [MenuProtocol]
	
	init (menu: [MenuProtocol]) {
		self.menu = menu
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
}

struct TeaStruct: MenuProtocol {
	var name: String { type.rawValue + " tea" }
	var type: Tea
	var cost: Double
	
	enum Tea: String {
		case black
		case green
		case fruit
	}
	
	init(type: Tea, cost: Double) {
		self.type = type
		self.cost = cost
	}
	
	func getCost (sale: Int) -> Double {
		guard sale <= 50 else {
			print("Discount cannot be applied!")
			return cost
		}
		return cost - (cost / 100 * Double(sale))
	}
}

class Cafe1: Cafe {
	override func add(position: MenuProtocol) {
		super.add(position: position)
		print(position.cost)
	}
}

class Cafe2: Cafe {}

class Cafe3: Cafe {}

final class FoodMashine: Cafe1 {
	func getItems(numItem: Int, money: Double) -> MenuProtocol? {
		guard numItem < menu.count else {
			return nil
		}
		let menuItem = menu[numItem]
		if menuItem.cost <= money {
			return menuItem
		} else {
			return nil
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

protocol WorkProtocol {
	func start()
	func final()
}

extension FoodMashine: WorkProtocol {
	func start() {
		print("Start")
	}
	
	func final() {
		print("Finish")
	}
}
