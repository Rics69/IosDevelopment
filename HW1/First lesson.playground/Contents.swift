import UIKit

//first task
protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}

struct Service: HomeworkService{
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        let first = x/y
        let second = x%y
        return(first, second)
    }
    
    func fibonacci(n: Int) -> [Int] {
        var result = [0, 1]
        
        guard n > 1 else {
            return result
        }
        
        while result.count < n {
            let nextNumber = result[result.count - 1] + result[result.count - 2]
            result.append(nextNumber)
        }
        
        return result
    }
    
    func sort(rawArray: [Int]) -> [Int] {
        var array = rawArray
        
        for i in 0..<array.count {
            for j in 0..<(array.count - i - 1) {
                if array[j] > array[j + 1] {
                    let temp = array[j]
                    array[j] = array[j + 1]
                    array[j + 1] = temp
                }
            }
        }
        
        return array
    }
    
    func firstLetter(strings: [String]) -> [Character] {
        var result = [Character]()
        
        for string in strings {
            if let firstChar = string.first {
                result.append(firstChar)
            }
        }
        
        return result
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var result = [Int]()
        
        for element in array {
            if condition(element) {
                result.append(element)
            }
        }
        
        return result
    }
}


//second task
// Книги, которые могут быть выданы в библиотеке
protocol Borrowable {
    var isBorrowed: Bool { get set }
    func borrow()
    func returnBook()
}

// Типы книг
enum BookType {
    case fiction
    case nonFiction
    case reference
}

// Класс книги
class Book: Borrowable {
    var title: String
    var author: String
    var isBorrowed: Bool = false
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
    
    func borrow() {
        if !isBorrowed {
            isBorrowed = true
            print("Книга '\(title)' была взята в библиотеке.")
        } else {
            print("Книга '\(title)' уже взята в библиотеке.")
        }
    }
    
    func returnBook() {
        if isBorrowed {
            isBorrowed = false
            print("Книга '\(title)' была возвращена в библиотеку.")
        } else {
            print("Книга '\(title)' уже находится в библиотеке.")
        }
    }
}

// Класс журнала
class Magazine: Book {
    var issueNumber: Int
    
    init(title: String, author: String, issueNumber: Int) {
        self.issueNumber = issueNumber
        super.init(title: title, author: author)
    }
    
    override func borrow() {
        print("Журналы нельзя забирать из библиотеки.")
    }
    
    override func returnBook() {
        print("Журналы нельзя возвращать в библиотеку.")
    }
}

// Библиотечный зал
struct LibraryRoom {
    var roomNumber: Int
    private var shelves: [Book] = []
    
    mutating func addBook(_ book: Book) {
        shelves.append(book)
        print("Книга '\(book.title)' добавлена на полку в зале \(roomNumber).")
    }
    
    func getBooksCount() -> Int {
        return shelves.count
    }
}

// Библиотечный персонал
enum StaffType {
    case librarian
    case janitor
    case securityGuard
}

protocol LibraryStaff {
    var name: String { get }
    var staffType: StaffType { get }
    func performDuties()
}

// Библиотекарь
class Librarian: LibraryStaff {
    var name: String
    var staffType: StaffType = .librarian
    
    init(name: String) {
        self.name = name
    }
    
    func performDuties() {
        print("Библиотекарь \(name) принимает и отдает книги.")
    }
}

// Уборщик
class Janitor: LibraryStaff {
    var name: String
    var staffType: StaffType = .janitor
    
    init(name: String) {
        self.name = name
    }
    
    func performDuties() {
        print("Уборщик \(name) убираетсяя в библиотеке.")
    }
}

// Охранник
class SecurityGuard: LibraryStaff {
    var name: String
    var staffType: StaffType = .securityGuard
    
    init(name: String) {
        self.name = name
    }
    
    func performDuties() {
        print("Охранник \(name) следит за безопасностью.")
    }
}

