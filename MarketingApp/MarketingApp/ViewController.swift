//
//  ViewController.swift
//  MarketingApp
//
//  Created by macmini45 on 18/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var midInnerView: UIView!
    @IBOutlet weak var lionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpViews()
//        blurEffect()
    }
}

extension ViewController {
    func setUpViews() {
        innerView.layer.cornerRadius = 20
        innerView.layer.masksToBounds = true
        
        midInnerView.layer.cornerRadius = 20
        midInnerView.layer.masksToBounds = true
        
        lionImage.layer.cornerRadius = 20
        lionImage.layer.masksToBounds = true
    }
    
    func blurEffect() {
        innerView.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.translatesAutoresizingMaskIntoConstraints = false
        innerView.addSubview(blurView)
    }
}

