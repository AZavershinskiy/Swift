// 3. Добавить возможность получения названия пиццы через rawValue

enum Pizzas: String {
	case neapolitan = "Neapolitan"
	case chicago = "Chicago"
	case margherita = "Margherita"
}

var pizzaName = Pizzas.neapolitan.rawValue

print(pizzaName)
