//
//  RideListVC.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-05.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var img: UIImageView!

    
}

class RideListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",for:indexPath) as? CustomCollectionViewCell
        cell?.img.image = UIImage(named: "icons8-kick-scooter-80.png")
        cell?.layer.cornerRadius = 15
        cell?.layer.borderWidth = 1
        cell?.layer.borderColor = UIColor.white.cgColor
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      let height: CGFloat = 125.0
        return CGSize(width: collectionView.bounds.width/2.5, height: height)
    }


}
