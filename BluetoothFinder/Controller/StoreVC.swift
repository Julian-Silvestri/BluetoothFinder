//
//  StoreVC.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-05.
//

import UIKit

class careAndProtectCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
}

class accessoriesCollectioViewCell: UICollectionViewCell{
    
}

class StoreVC: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{


    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var careAndProtectSeeAllBtn: UIButton!
    @IBOutlet weak var careAndProtectCollectionView: UICollectionView!
    @IBOutlet weak var accessoriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.careAndProtectCollectionView.dataSource = self
        self.careAndProtectCollectionView.delegate = self
        self.profileBtn.layer.borderWidth = 1
        self.profileBtn.layer.borderColor = UIColor.white.cgColor
        self.profileBtn.layer.cornerRadius = 20
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = careAndProtectCollectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? careAndProtectCollectionViewCell
        
        
        if indexPath.row == 1{
            cell?.topLabel.isHidden = true
            cell?.middleLabel.text = "APOLLO"
            cell?.bottomLabel.text = "CARE"
        }
//        cell?.bottomView.layer.cornerRadius = 10
        cell?.bottomView.layer.borderWidth = 1
        cell?.bottomView.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.cornerRadius = 10
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 1
        
        return cell ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
 
        return CGSize(width: 255, height: 328)
    }

}
