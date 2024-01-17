func map() {
    let array = [1,2,3,4,5]
    var newArray: [Int] = []
    
    array.forEach { num in
        newArray.append(num * 2)
    }
    print(newArray)
    
    
    //Map
    let m1 = array.map { (value) in
        return value * 2
    }
    print(m1)
    
    let m2 = array.map { $0 * 2 }
    print(m2)
}
map()

