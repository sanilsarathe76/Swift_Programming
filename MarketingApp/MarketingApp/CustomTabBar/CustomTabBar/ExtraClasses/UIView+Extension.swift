//
//  UIView+Extension.swift
//  CustomTabBar
//
//  Created by macmini45 on 02/08/23.
//

import UIKit

extension UIView {
    func addGradient(with layer: CAGradientLayer, gradientFrame: CGRect? = nil, colorSet: [UIColor],
                     locations: [Double], startEndPoints: (CGPoint, CGPoint)? = nil) {
        layer.frame = gradientFrame ?? self.bounds
        layer.frame.origin = .zero

        let layerColorSet = colorSet.map { $0.cgColor }
        let layerLocations = locations.map { $0 as NSNumber }

        layer.colors = layerColorSet
        layer.locations = layerLocations

        if let startEndPoints = startEndPoints {
            layer.startPoint = startEndPoints.0
            layer.endPoint = startEndPoints.1
        }

        self.layer.insertSublayer(layer, above: self.layer)
    }
}

extension UIView {
    func setGradient(topGradientColor: UIColor?,botttomGradientColor: UIColor?) {
        let gradientLayer = CAGradientLayer()
        if let topGradientColor = topGradientColor, let botttomGradientColor = botttomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [botttomGradientColor.cgColor,topGradientColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            gradientLayer.locations = [0, 1]
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat)
    {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
