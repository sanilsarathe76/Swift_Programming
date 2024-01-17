//
//  TabBarController.swift
//  MarketingApp
//
//  Created by macmini45 on 20/07/23.
//

import UIKit

private let defaultIndexValue = 0

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    static let identifier = "TabBarController"
    
    private var priviousSelectedIndex: Int = defaultIndexValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
//    public override var selectedIndex: Int {
//        didSet {
//            guard let items = self.tabBar.items else { return }
//            if items.indices.contains(selectedIndex) {
//                let item = items[selectedIndex]
//                self.tabBar(tabBar, didSelect: item)
//            }
//        }
//    }
//
//    public override var viewControllers: [UIViewController]? {
//        didSet {
//            setup()
//        }
//    }
//
//    func setup() {
//        guard let count = tabBar.items?.count, count > 0 else { return }
//
//        if self.priviousSelectedIndex == defaultIndexValue {
//            if let item = self.tabBar.selectedItem {
//                self.tabBar(self.tabBar, didSelect: item)
//            }
//        }
//    }
    
    func setUpTabBarTitle() {
        //create tab 1
        let tabOne = ViewController()
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        tabOne.tabBarItem = tabOneBarItem
        
        //create tab 2
        let tabTwo = ViewControllerSecond()
        let tabTwoBarItem = UITabBarItem(title: "Profile", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        tabTwo.tabBarItem = tabTwoBarItem
        
        //create tab 3
        let tabThird = ViewControllerThird()
        let tabThirdBarItem = UITabBarItem(title: "Feed", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        tabThird.tabBarItem = tabThirdBarItem
        
        let controllers = [tabOne, tabTwo, tabThird]
        self.viewControllers = controllers
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        setUpTabBarTitle()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
