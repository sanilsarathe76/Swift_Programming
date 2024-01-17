//
//  TabBarCell.swift
//  CustomTabBar
//
//  Created by macmini45 on 25/07/23.
//

import UIKit

class TabBarCell: UICollectionViewCell {
    
    static let identifier = "TabBarCell"
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tabBarLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpParentView()
    }
    
    func configure(item: TabBarItem, isSelected: Bool) {
        tabBarLabel.text = item.title
        imageView.image = UIImage(named: item.image)
        if isSelected {
            setSelectedUI()
        } else {
            setUnselectedUI()
        }
    }
    
    func setUpParentView() {
        parentView.layer.cornerRadius = 18
        parentView.layer.masksToBounds = true
    }
    
    func setSelectedUI() {
        parentView.backgroundColor = UIColor(hex: "083d20")
        imageView.isHidden = true
        tabBarLabel.isHidden = false
    }
    
    func setUnselectedUI() {
        parentView.backgroundColor = .clear
        tabBarLabel.isHidden = true
        imageView.isHidden = false
    }
}
