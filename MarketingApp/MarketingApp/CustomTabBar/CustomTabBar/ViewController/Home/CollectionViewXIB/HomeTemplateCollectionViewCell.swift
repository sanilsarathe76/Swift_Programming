//
//  HomeTemplateCollectionViewCell.swift
//  CustomTabBar
//
//  Created by macmini45 on 27/07/23.
//

import UIKit

class HomeTemplateCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeTemplateCollectionViewCell"
    
//    let gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var gradientImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 20
        gradientImageView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        setUpVerticalLayout()
//        gradientLayer.cornerRadius = 20
        
//        let colorSet = [UIColor.black.withAlphaComponent(0),
//                        UIColor.black.withAlphaComponent(1)]
//        let location = [0.2, 1.0]
//        gradientView.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        DispatchQueue.main.async {
//            self.setGradientBounds()
//        }
//    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)
//        gradientLayer.frame = gradientView.bounds
    }
        
    func setImages(data: ShowData) {
        imageView.image = UIImage(named: data.images)
        textLabel.text = data.labels
    }
    
//    func setupGradientViews() {
//        print("sublayers :- \(gradientView.layer.sublayers?.count)")
//        gradientView.layer.sublayers?.removeAll()
//        gradientView.setGradient(topGradientColor:UIColor(hex: "191A19").withAlphaComponent(0), botttomGradientColor: UIColor(hex: "191A19").withAlphaComponent(1))
//        gradientView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 20)
//    }
    
    func setUpVerticalLayout() {
        textLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    func setUpHorizonatalLayout() {
        textLabel.transform = .identity
    }
    
    func setGradientBounds() {
//        gradientLayer.frame = gradientView.bounds
    }
}
