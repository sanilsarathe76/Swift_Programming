
//
//  ViewControllerFirstViewController.swift
//  Practice
//
//  Created by macmini45 on 30/04/23.
//

import UIKit

class VC1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        map()
        filter()
    }
    
    func map() {
        let arr1 = [1,2,3,4,5]
        var arr2: [Int] = []
        
        arr1.forEach { num in
            arr2.append(num * 2)
        }
        print("This is without map:", arr2)
        
        //map
        let map = arr1.map{ $0 * 2 }
        print("Using map", map)
        
        //map
        let anotherMap = arr2.map { (value) in
            return value / 2
        }
        print("Map Second:", anotherMap)
    }
    
    func filter() {
        let array1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        var filteredArray: [Int] = []
        
        array1.forEach { num in
            if num % 2 == 0 {
                filteredArray.append(num)
            }
        }
        print("Filtered Even Numbers:", filteredArray)
        
        //filter
        let filteredNewArray = array1.filter{ $0 % 2 == 0 }
        print("New Filtered Array Even Numbers:", filteredNewArray)
    }
}


