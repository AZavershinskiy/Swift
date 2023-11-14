import Foundation

func solution (_ a: Double, _ b: Double, _ c: Double, _ d: Double) -> (Double?, Double?) {
	let y = c - d
	var dis = (b * b) - 4 * a * y
	if dis < 0 {
		return (nil, nil)
	} else if dis == 0 {
		var x1 = -b / (2 * a)
		return (x1, nil)
	} else {
		var x2 = -b + sqrt(dis) / (2 * a)
		var x3 = -b - sqrt(dis) / (2 * a)
		return (x2, x3)
	}
}

solution(2, 2, 2, 2)


//


struct TeaStruct {
	enum Tea {
		case black
		case green
		case fruit
	}
	
	var type: Tea
	private var cost: Double
	
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

//print(TeaStruct(type: .black, cost: 100).getCost(sale: 51))

//let blackTea = TeaStruct(type: .black, cost: 100)
//print(blackTea.type, blackTea.cost)

//

class Cafe {
	private var tea: [TeaStruct]
	
	init(tea: [TeaStruct]) {
		self.tea = tea
	}
	
	func teaCost(type: TeaStruct.Tea, sale: Int) -> Double? {
		guard let oneTea = tea.first(where: {$0.type == type }) else {
			return nil
		}
		return oneTea.getCost(sale: sale)
	}
	
	func getTea(type: Person.Activity.TypeOfActivity, cost: Double, sale: Int) -> TeaStruct? {
		switch type {
			case .pupil: let priceTea = tea.filter{$0.getCost(sale: sale) <= cost}.sorted{$0.getCost(sale: sale) <= $1.getCost(sale: sale)}
				return priceTea.first
			case .student: let priceTea = tea.filter{$0.getCost(sale: sale) <= cost && $0.type == .black}.sorted{$0.getCost(sale: sale) <= $1.getCost(sale: sale)}
				return priceTea.first
			case .employee: let priceTea = tea.filter{$0.getCost(sale: sale) <= cost && ($0.type == .black || $0.type == .fruit)}.sorted{$0.getCost(sale: sale) <= $1.getCost(sale: sale)}
				return priceTea.first
		}
	}
}

class Person {
	struct Activity {
		enum TypeOfActivity {
			case pupil
			case student
			case employee
		}
	}
}

var run: Person.Activity.TypeOfActivity = .employee

