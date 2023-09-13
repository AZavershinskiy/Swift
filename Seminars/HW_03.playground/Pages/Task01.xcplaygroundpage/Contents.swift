// 1. Есть словарь с видами чая и их стоимостью.
// Есть очередь людей, которые хотят заказать чай
// (можно представить ее в виде массива видов чая, которые хотят заказать).
// Необходимо последовательно выводить в консоль сколько заплатит покупатель
// (необходимо вывести его номер по порядку, чай, который он заказал и стоимость)

var teas: [String: Int] = ["black": 80, "green": 90, "fruit": 110]

var queue = ["black", "green", "green", "black", "fruit", "fruit"]

func orders (_ teas: [String: Int], _ queque: [String]) {
	queque.enumerated().forEach {num, order in
		switch order {
			case "black": print("Order:", num+1, "\nTea:", order, "\nCost:", teas["black"]!, "\n")
			case "green": print("Order:", num+1, "\nTea:", order, "\nCost:", teas["green"]!, "\n")
			case "fruit": print("Order:", num+1, "\nTea:", order, "\nCost:", teas["fruit"]!, "\n")
			default:
				return
		}
	}
}

orders(teas, queue)
