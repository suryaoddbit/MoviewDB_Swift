//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

typealias  testTupple = (id : Int, nama : String)

var sample : String = "asd"
var i = 1
var o = 2
var e = i+o
var vari : testTupple = (1, "asd")

print(vari.id)
print(vari.nama)

let str2 : String = "String 2";
var str3 : String = "String 3"



print(vari.nama + " " + str2)
print("\(vari.id), \(str2)")

//MARK: Array

var name : [String] = ["var 1","Var 2","var 3"]
print(name[0])

var anyVar : [Any] = ["any 1", 2, false]

func validasiNil(str : String?) -> String{
    defer {
        print("eksekusi")
    }
    
    //
    guard let strNew = str else {
        return ""
    }
    
    return strNew
}

func validasiIF(str : String?) -> String{
    if let strNew = str{
        return strNew
    }
    return ""
}



print(validasiNil(str: "Validasi Nil"))
print(validasiIF(str: "Validasi IF"))



//MARK: - Dictionary

var numberOfLeg : [String : Int] = ["ant":6,
                   "snake":0,
                   "cat":4]

print(numberOfLeg["ant"])
numberOfLeg["snake"] = 1000
print(numberOfLeg["snake"])

//MARK: -Looping

for number in 1...20{
    if number == 10{
        break
    }
    
    if number % 2 == 0{
        continue
    }
    print(number)
}


for number2 in anyVar{
    print(number2)
}

for (ind, val) in anyVar.enumerated(){
    print("\(ind),\(val)")
}

for value  in numberOfLeg{
    print("\(value.key),\(value.value)")
}

print("----------Struct---------------------")
// - Struct
struct Movie{
    var id : Int
    var title : String
    var genre : String
    var genap : Bool
    
    init(id: Int, title: String, genre : String){
        self.id = id
        self.title = title
        self.genre = genre
        
        self.genap = id % 2 == 0 ? true : false
    }
}

let movies : [Movie] = [
    Movie(id: 1, title: "Sample 1", genre: "Action")
]

//- Enum
enum Color{
    case white
    case red
    case black
    
    var desc : String{
        switch self {
        case .red:
            return "ini warna merah"
        default:
            return "ini warna lain"
        }
    }
}

var color : Color = .red


switch color {
case .white :
    print("ini putih")
    break;
case .red :
    print("ini warna merah")
    break;
default:
    print("ini warna lain")
    break
}

print(color.desc)