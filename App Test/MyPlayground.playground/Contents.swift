import UIKit

var a: String?
var b: String?

a = "s"
b = "d"

if let test = a, let t2 = b {
    print(test)
    print(t2)
}


var name: String = "Jesus"

print(name)

// constants
let value: Int = 1

// boolan
let test: Bool = false

// functions
func display() {
    print("Jsus")
}


display()

// functions com parametros
func params(name: String) {
    print("Ola \(name)")
}

params(name: "Deus")

// functions com parametros ocultos na hora de passar
func olc(_ name: String) {
    print(name)
}

olc("J")

// arrays

let int_numbers: [Int] = [10,20,30,40]

// for
for i in 0...3 {
    print(int_numbers[i])
}

for i in 0...int_numbers.count-1 {
    print(int_numbers[i])
}

for item in int_numbers {
    print(item)
}

// functions com array e retorno
func array_numbers(_ values: [Int]) -> Int{
    var total: Int = 0
    for i in values {
        total += i
    }
    
    return total
}
print(array_numbers([2, 2]))


// classes
class Unit {
    var position: Int?
    var name: String?
}

let u = Unit()

// verifica se nao nulo
if (u.name != nil) {
    print(u.name!)
}

// boas praticas paa valores opcionais :Int?
// declara variavel no teste tmp_name
if let tmp_name = u.name {
    print(tmp_name)
}

//func greet(_ name: String?) {
//    guard let unwrapped = name else {
//        print("You didn't provide a name!")
//        return
//    }
//
//    print("Hello, \(unwrapped)!")
//}
//greet()

func greet() {
    guard let wnwrapped = u.name else {
        print("nome nao existe")
        return
    }
    print(wnwrapped)
}
greet()

// Good citizen -> never crash with nil values

class Name {
    var name: String
    var games: Array<Item> = []
    
    init(_ name: String) {
        self.name = name
    }
    
    // MARK: - addGame
    func addGame(item: Item) {
        self.games.append(item)
    }
}

let mauricio = Name("Mauricio")
print(mauricio.name)

//
class Item {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

let ps5 = Item("PS5")
let xbox = Item("XBOX Series X")
mauricio.addGame(item: ps5)
mauricio.addGame(item: xbox)

for game in mauricio.games {
    print(game.name)
}
