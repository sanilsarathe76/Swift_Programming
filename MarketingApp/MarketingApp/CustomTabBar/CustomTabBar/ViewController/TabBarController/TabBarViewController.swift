//
//  ViewController.swift
//  CustomTabBar
//
//  Created by macmini45 on 25/07/23.
//

import UIKit
struct TabBarItem {
    var title: String
    var image: String
}

class TabBarViewController: UIViewController {
    
    static let identitfier = "TabBarViewController"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var tabBarContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        guard let view = homeVC.view else {return}
        view.frame = containerView.frame
        setUpTabBarContainerView()
        containerView.addSubview(view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    var selectedItem = 0
    
    var homeVC: HomeViewController = {
        let storyboard = UIStoryboard(name: CustomTabBarStoryboard.home.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: HomeViewController.identitfier) as! HomeViewController
    }()
    
    var profileVC: ProfileViewController = {
        let storyboard = UIStoryboard(name: CustomTabBarStoryboard.profile.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: ProfileViewController.identitfier) as! ProfileViewController
    }()
    
    var mapVC: MapViewController = {
        let storyboard = UIStoryboard(name: CustomTabBarStoryboard.map.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: MapViewController.identitfier) as! MapViewController
    }()
    
    var tabBarItems = [
        TabBarItem(title: "Home", image: "Home"),
        TabBarItem(title: "Profile", image: "Profile"),
        TabBarItem(title: "Map", image: "Map"),
    ]
    
    func setUpTabBarContainerView() {
        tabBarContainerView.layer.cornerRadius = 20
        tabBarContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: TabBarCell.identifier, bundle: nil), forCellWithReuseIdentifier: TabBarCell.identifier)
    }
}

//extension UIView {
//    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(
//            roundedRect: bounds,
//            byRoundingCorners: corners,
//            cornerRadii: CGSize(width: radius, height: radius)
//        )
//
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = path.cgPath
//        layer.mask = maskLayer
//    }
//}

extension TabBarViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabBarItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabBarCell.identifier, for: indexPath) as! TabBarCell
        cell.configure(item: tabBarItems[indexPath.row], isSelected: indexPath.row == selectedItem)
        cell.parentView.backgroundColor = selectedItem == index ? UIColor(hex: "083d20") : .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        containerView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        let lastSelectedCell = collectionView.cellForItem(at: IndexPath(row: selectedItem, section: 0)) as! TabBarCell
        let currentCell = collectionView.cellForItem(at: indexPath) as! TabBarCell
        
        selectedItem = indexPath.row
        
        collectionView.collectionViewLayout.invalidateLayout()
        UIView.animate(withDuration: 0.5) {
            collectionView.layoutIfNeeded()
            lastSelectedCell.setUnselectedUI()
            currentCell.setSelectedUI()
        }
        switch indexPath.row {
        case 0:
            guard let view = self.homeVC.view else { return }
            view.frame = self.containerView.frame
            self.containerView.addSubview(view)
        case 1:
            guard let view = self.profileVC.view else { return }
            view.frame = self.containerView.frame
            self.containerView.addSubview(view)
        case 2:
            guard let view = self.mapVC.view else { return }
            view.frame = self.containerView.frame
            self.containerView.addSubview(view)
        default:
            guard let view = self.homeVC.view else { return }
            view.frame = self.containerView.frame
            mainView.backgroundColor = UIColor(hex: "1A5A9A")
            self.containerView.addSubview(view)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellsPerRow = CGFloat(tabBarItems.count)
        let tabBarItemWidth: CGFloat = collectionView.bounds.width
        
        let selectedItemWidth = (tabBarItemWidth / numberOfCellsPerRow) + 50
        let UnSelectedItemWidth  = (tabBarItemWidth - selectedItemWidth) / (numberOfCellsPerRow - 1)
        let cellHeight: CGFloat = 50
        return CGSize(width: selectedItem == indexPath.row ? selectedItemWidth : UnSelectedItemWidth, height: cellHeight)
    }
}

