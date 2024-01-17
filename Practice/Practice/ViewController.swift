//
//  ViewController.swift
//  Practice
//
//  Created by macmini45 on 29/04/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        map()
//        filter()
//        sorting()
//        flatmap()
//        chaining()
    }
    
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
    
    func filter() {
        let numberFilter = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        var arr1: [Int] = []
        
        for number in numberFilter {
            if number % 2 == 0 {
                arr1.append(number)
            }
        }
        print(arr1)
        
        //filter
        let filterData = numberFilter.filter{ $0 % 2 == 0 }
        print("filterData", filterData)
    }
    
    func sorting() {
        let arr1 = [1,2,3,4,5]
        let arr2 = arr1.sorted{$0 > $1}
        print("Sorted Array:", arr2)
    }
    
    func flatmap() {
        let arr1 = [[11,12,13], [14,15,16]]
        var arr2: [Int] = []
        
        for num in arr1 {
            arr2 += num
        }
        print("Merging two array", arr2)
        
        
        //Using flatmap
        let f1 = arr1.flatMap{ $0 }
        print("Using flat map", f1)
    }
    
    func chaining() {
        let arr1 = [[11,12,13], [14,15,16]]
        let arr2 = arr1.flatMap{ $0 }.filter{$0 % 2 == 0}.map{$0 * $0}
        print("Chaining", arr2)
    }
}

