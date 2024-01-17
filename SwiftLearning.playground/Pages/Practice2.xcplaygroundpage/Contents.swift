func withoutMap() {
    var array = [1,2,3,4,5]
    var newArray: [Int] = []
    for iterator in array {
        newArray.append(iterator * 2)
    }
    print("New Array Without Map: ", newArray, "New Array Count: ", newArray.count)
}
withoutMap()

func withMap() {
    var array = [1,2,3,4,5]
    var newArray = array.map { iterator in
        return iterator * 2
    }
    print("New Array With Map: ", newArray, "New Array Count: ", newArray.count)
}
withMap()

func filterNumber() {
    var array = [1,2,3,4,5,6,7,8,9,10]
    var filterNumbers = array.filter { num in
        num % 2 == 0
    }
    print("Even number filter:", filterNumbers)
}
filterNumber()

