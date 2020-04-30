import UIKit

//-----HomeWork for lesson 2-----
//------1. Array-----
        //-----Array of students-----

var studentNameList = ["Alex", "Andrew", "Bob", "Casey", "James", "Katty", "Robert", "Vasiliy"]

        //------Add element------

func addStudent(nameOfNewStudent:String) {
    studentNameList.append(nameOfNewStudent)    //Also we can use studentNameList += ["x"] or [a, b, c] etc.
}
addStudent(nameOfNewStudent: "Piter")
addStudent(nameOfNewStudent: "Donald")
studentNameList

        //------Remove element------

func removeStudent(studentNumber: Int) {
    studentNameList.remove(at: studentNumber - 1)
}
removeStudent(studentNumber: 1)       //Also we can use studentNameList.removeFirst()
studentNameList

        //------Find element------

func findStudent(nameOfStudent: String) -> String {
    var studentNumber = ""
    if let nameOfStudent = studentNameList.firstIndex(of: nameOfStudent) { //How to find all index of same array value? For.ex. 3 Alex?
        studentNumber = "You can find \(studentNameList[nameOfStudent]) by number \(nameOfStudent - 1)"
    } else {
        studentNumber = "Student \(nameOfStudent) isn't listed"
    }
    return studentNumber
}

findStudent(nameOfStudent: "Piter")
findStudent(nameOfStudent: "Alex")

        //------Print all elements------

func printStudentList () {
    var index = 0
    for name in studentNameList {
    
        index += 1
        print("\(index). \(name)")
    }
}

printStudentList()

        //------Print one element by index------

func printSudentNameByNumber(studentNumber: Int) -> String {
    var nameOfStudent = ""
    
    switch studentNumber {
    case 0...studentNameList.count:
        nameOfStudent = studentNameList[studentNumber - 1]
        print(nameOfStudent)
    default:
        nameOfStudent = "Number isn't exist"
        print(nameOfStudent)
    }
    return nameOfStudent
}

printSudentNameByNumber(studentNumber: 1)
printSudentNameByNumber(studentNumber: 2532736)

        //-----Print count of students------

func printCountOfStudent() {
    print("Count of students is \(studentNameList.count)")
}

printCountOfStudent()

        //-----Filtr-------

let firstStudentGroup = studentNameList.filter{ $0[$0.startIndex] < "K"}
let secondStudentGroup = studentNameList.filter{ $0[$0.startIndex] >= "K"}
firstStudentGroup
secondStudentGroup

//let firstStudentGroup = studentNameList.filter{ $0.count > 5 }
//let secondStudentGroup = studentNameList.filter{ $0.count <= 5 }

//let secondStudentGroup = studentNameList.filter{studentNameList.startIndex % 2 == 0 } <------ how we can filter by arguments of array?

studentNameList[0][studentNameList[0].startIndex] // <----- How to write short wersion of this?

firstStudentGroup
secondStudentGroup

        //-----Sort------

let sortedStudentListA_Z = studentNameList.sorted(by: { s1, s2 in s1 < s2 } )
sortedStudentListA_Z
let sortedStudentListZ_A = studentNameList.sorted(by: >)

    //-----2. Dictionary-----
        //-----Dictionary of telephone numbers by SecondName-----

var telephoneDirectory = [ 3_22_55: "Petrov", 2_55_77: "Fisher", 2_45_67: "Vasserman", 3_44_67: "Skutarenko", 5_32_91: "Potockiy", 7_11_63: "Andreev", 8_98_54: "Batonov" ]

        //-----Add element-----

func addNewTelNumber(telNumber: Int, secondNameOfDirectMember: String) {
    telephoneDirectory[telNumber] = secondNameOfDirectMember
}

addNewTelNumber(telNumber: 33333, secondNameOfDirectMember: "Borisova")
telephoneDirectory

        //-----Remove element-----

func removeTelNumber(telNumber: Int) {
    if let removedName = telephoneDirectory.removeValue(forKey: telNumber){
        telephoneDirectory.removeValue(forKey: telNumber) //<------ Why here we hava nil value?
        print("\(removedName)")                                         //  |
    } else {                                                            //  |
        print("Number isn't exist")                                     //  |
    }                                                                   //  |
}                                                                       //  V
//telephoneDirectory.removeValue(forKey: 32255)           //<----- And here we have "Petrov" in console?

removeTelNumber(telNumber: 32255)
telephoneDirectory

        //-----Change element-----

func changeSubscriberName(newSubscriber: String, byTelNumber: Int) {
    if let updatedNameNumber = telephoneDirectory.updateValue(newSubscriber, forKey: byTelNumber) {
        telephoneDirectory.updateValue(newSubscriber, forKey: byTelNumber)
        print("Subscriber \(updatedNameNumber) changed to \(newSubscriber)")
    } else {
        print("Number isn't exist")
    }
}

changeSubscriberName(newSubscriber: "Bach", byTelNumber: 24567)
telephoneDirectory

        //-----Find element-----

func findTelNumberBySub(subName: String) -> String {
    var telNumber = "Subscriber dosn't exist"
    for (telNumbers, subNames) in telephoneDirectory {
        if subName == subNames {
           telNumber = String(telNumbers)
        }
    }
    return telNumber
}

findTelNumberBySub(subName: "Bach")
findTelNumberBySub(subName: "Bach1")

        //-----Print count of pairs-----

print("TelephoneDirectory contain \(telephoneDirectory.count) entries")

        //-----Print all keys-----

print(telephoneDirectory.keys)

        //-----Print all values-----

print(telephoneDirectory.values)


// 3.Set
    //-----3. Set of money-----

var money: Set = ["USD", "RUB", "UAH", "TRY", "JPY", "GBP"]

        //-----Add element-----

money.insert("PLN")
money

        //-----Remove element-----

func deleteMoneyElement(removeСurrency: String) {   //Also we can do by removeAtIndex() - by index???
    if let _ = money.remove(removeСurrency) {       // Also we can use if money.contains() how to make better?
    money.remove(removeСurrency)
    }
}
deleteMoneyElement(removeСurrency: "RUB")
money

        //-----Find element-----

func findCurrency(currencyName: String) -> String {
    var currency = "Currency didn't found"
    if money.contains(currencyName) {
        currency = "Set 'money' contain currency: \(currencyName)"
    }
    return currency
}
findCurrency(currencyName: "UAH")

        //-----Print all elements-----
print(money)
        //-----Print count of elements-----
money.count

        //-----Filtr-----

func moneyByFirstCharacter(firstCharacter: Character) -> Set<String> {
    let moneyByCharacter = money.filter{ $0[$0.startIndex ] == firstCharacter}
    return moneyByCharacter
}
moneyByFirstCharacter(firstCharacter: "U")

        //-----Sort-----
money.sorted()
