// 2. Создать перечисление, которое содержит 3 вида пиццы
// и создать переменные с каждым видом пиццы.

enum Pizzas {
	case neapolitan
	case chicago
	case margherita
}

var neapolitan = Pizzas.neapolitan
var chicago = Pizzas.chicago
var margherita: Pizzas = .margherita

print(neapolitan, chicago, margherita)
