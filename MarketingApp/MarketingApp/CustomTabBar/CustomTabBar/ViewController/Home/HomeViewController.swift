//
//  HomeViewController.swift
//  CustomTabBar
//
//  Created by macmini45 on 25/07/23.
//

import UIKit

struct ShowData {
    var images: String
    var labels: String
}

class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    static let identitfier = "HomeViewController"
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var currentImage = 1
    private var selectedCellIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        topImage.layer.cornerRadius = 25
        //        currentImage = images.count / 2
        //        DispatchQueue.main.async {
        //            self.collectionView.scrollToItem(at: IndexPath(item: self.currentImage, section: 0), at: .centeredHorizontally, animated: true)
        //        }
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressGesture.minimumPressDuration = 0.3
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    //    var images = ["Image1", "Image2", "Image3", "Image4", "Image5", "Image1", "Image2", "Image3", "Image4", "Image5"]
    //
    //    var label = ["Living Room", "Dining Room", "Bed Room", "Kitchen", "Study Room", "Living Room", "Dining Room", "Bed Room", "Kitchen", "Study Room"]
    
    var cardsData = [
        ShowData(images: "Image1", labels: "Living Room"),
        ShowData(images: "Image2", labels: "Dining Room"),
        ShowData(images: "Image3", labels: "Bed Room"),
        ShowData(images: "Image4", labels: "Kitchen"),
        ShowData(images: "Image5", labels: "Study Room"),
        ShowData(images: "Image1", labels: "Living Room"),
        ShowData(images: "Image2", labels: "Dining Room"),
        ShowData(images: "Image3", labels: "Bed Room"),
        ShowData(images: "Image4", labels: "Kitchen"),
        ShowData(images: "Image5", labels: "Study Room")
    ]
    
    @IBAction func onClickLeft(_ sender: Any) {
        currentImage = max(0, currentImage - 1)
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: IndexPath(item: self.currentImage, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func onClickRight(_ sender: Any) {
        currentImage = min(cardsData.count - 1, currentImage + 1)
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: IndexPath(item: self.currentImage, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func registerXib() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: HomeTemplateCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: HomeTemplateCollectionViewCell.identifier)
    }
    
    //-------------------------------------- scroll one image at a time -----------------------------------------//
    //    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    //        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).x > 0 {
    //            currentImage = max(0, currentImage - 1)
    //        } else {
    //            currentImage = min(images.count - 1, currentImage + 1)
    //        }
    //        DispatchQueue.main.async {
    //            self.collectionView.scrollToItem(at: IndexPath(item: self.currentImage, section: 0), at:  .centeredHorizontally, animated: true)
    //        }
    //    }
    //-------------------------------------- scroll one image at a time -----------------------------------------//
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            let location = gestureRecognizer.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: location) {
                let currentCell = collectionView.cellForItem(at: indexPath) as! HomeTemplateCollectionViewCell
                let selectedItem = cardsData[indexPath.item]
                selectedCellIndexPath = indexPath
                print("Selected Item: \(selectedItem))")
                print("IndexPath: \(indexPath)")
                DispatchQueue.main.async {
                    self.collectionView.collectionViewLayout.invalidateLayout()
                    UIView.animate(withDuration: 0.5) {
                        self.collectionView.layoutIfNeeded()
                        currentCell.setUpHorizonatalLayout()
                        //                        currentCell.gradient()
                    }
                }
            }
        case .ended:
            let indexPath = selectedCellIndexPath ?? IndexPath()
            selectedCellIndexPath = nil
            //            print("\(selectedCellIndexPath)")
            DispatchQueue.main.async {
                let currentCell = self.collectionView.cellForItem(at: indexPath) as! HomeTemplateCollectionViewCell
                self.collectionView.collectionViewLayout.invalidateLayout()
                UIView.animate(withDuration: 0.5) {
                    self.collectionView.layoutIfNeeded()
                    currentCell.setUpVerticalLayout()
                } completion: { _ in
                    //                    currentCell.gradient()
                }
            }
        default:
            break
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTemplateCollectionViewCell.identifier, for: indexPath) as! HomeTemplateCollectionViewCell
        cell.setImages(data: cardsData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        return CGSize(width: selectedCellIndexPath == indexPath ? 200 : 120, height: height)
    }
}
