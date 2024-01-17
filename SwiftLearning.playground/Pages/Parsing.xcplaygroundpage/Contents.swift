//: [Previous](@previous)

//api :- https://tools.learningcontainer.com/sample-json.json
import Foundation

struct Person: Codable {
    var firstName: String
    var lastName: String
    var gender: String
    var age: Int
    var address: Location
    var phoneNumbers: [Phone]
}

struct Location: Codable {
    var streetAddress: String
    var city: String
    var state: String
    var postalCode: String
}

struct Phone: Codable {
    var type: String
    var number: String
}

func fetchData() {
    guard let url = URL(string: "https://tools.learningcontainer.com/sample-json.json") else {
        return
    }
    
    URLSession.shared.dataTask(with: url) { (data, error, response) in
        guard let data = data else {
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let person = try decoder.decode(Person.self, from: data)
            print(person)
        } catch {
            print(error)
        }
    }.resume()
}
fetchData()

