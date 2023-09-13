var a = [5, 6, -14, 25]

var b = a.sorted(by: <)

var c = a.map{$0 + 5}

var d = a.map{$0 * 2}.filter{$0 > 0 && $0 != 12}


var dict: [Int: String]


var e = [2, 6, 25, 4, 2, 2, 10, 2]
var f = Set(e)

func checkSum (_ arr: [Int]) -> Bool {
	if arr.reduce(0, +) >= 100 {
		return true
	}
	return false
}

//checkSum(e)

//

var g = {(_ dict: [Int: String]) in
	dict.forEach { key, value in
		key > 5 ? print(value) : nil
	}
}
//g([2: "2", 6: "6", 8: "8", 10: "10"])

//

enum Tea { case black; case green; case fruit }

var teas: [Tea: Int] = [.black: 90, .green: 95, .fruit: 110]

func updateDict (_ dict: [Tea: Int]) -> [Tea: Int] {
	var newDict: [Tea: Int] = [:]
	dict.forEach { key, value in
		switch key {
			case .fruit: newDict.updateValue(Int((Double(value) + (Double(value) * 0.3)).rounded()), forKey: key)
			case .black: newDict.updateValue(Int((Double(value) / 1.6).rounded()), forKey: key)
			case .green: newDict.updateValue(Int((Double(value) - (Double(value) * 0.095)).rounded()), forKey: key)
		}
	}
	return newDict
}

//updateDict(teas)

//

var start = [4, -5]
var end = [-2, 5]

func middleLine (_ start: [Int], _ end: [Int]) -> [Int] {
	if start.count == 2 && end.count == 2 {
		return [(start[0] + end[0])/2, (start[1] + end[1])/2]
	}
	return []
}

middleLine(start, end)

//

var arr4 = [1, 2, 3, 4]

func newArr  (_ arr: [Int]) -> [Int]? {
	if arr.count == 4 {
		return [arr[0], arr[1]+arr[2], arr[3]].sorted(by: >)
	}
	return nil
}

//newArr(arr4)

//


var arr5: [Int] = []

for num in 1...50 {
	arr5.append(num)
}
//print(arr5)

//

var h = {(_ int1: Int, _ int2: Int) in
	int1 + int2
}
//h(3, 5)

//


var j = {(_ int1: Int) in }

func vd (_ closure: (Int) -> Void) {
	print(type(of: closure))
}

//vd(j)

//

var arr6 = ["One", 2.0, 3] as [Any]
arr6.forEach {num in
	print(num)
}
