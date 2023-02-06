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
    
    @IBOutlet weak var backgroundImf: UIImageView!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var bottomViewTitle: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var descriptionHere: UILabel!
}

class upgradesCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var bottomViewDescription: UILabel!
    @IBOutlet weak var bottomViewTitle: UILabel!
    @IBOutlet weak var backgroundImg: UIImageView!
}

class StoreVC: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{


    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var careAndProtectSeeAllBtn: UIButton!
    @IBOutlet weak var careAndProtectCollectionView: UICollectionView!
    @IBOutlet weak var accessoriesCollectionView: UICollectionView!
    @IBOutlet weak var upgradesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.careAndProtectCollectionView.dataSource = self
        self.careAndProtectCollectionView.delegate = self
        self.accessoriesCollectionView.delegate = self
        self.accessoriesCollectionView.dataSource = self
        self.upgradesCollectionView.delegate = self
        self.upgradesCollectionView.dataSource = self
        self.profileBtn.layer.borderWidth = 1
        self.profileBtn.layer.borderColor = UIColor.white.cgColor
        self.profileBtn.layer.cornerRadius = 20
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.upgradesCollectionView {
            return 1
        } else {
            return 3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.careAndProtectCollectionView {
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
        } else if collectionView == self.accessoriesCollectionView {
            let cell = accessoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as? accessoriesCollectioViewCell

    //        cell?.bottomView.layer.cornerRadius = 10
            cell?.buyBtn.layer.cornerRadius = 16
            
            cell?.bottomView.layer.borderWidth = 1
            cell?.bottomView.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.cornerRadius = 10
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.borderWidth = 1
            
            return cell ?? UICollectionViewCell()
        } else {
            let cell = upgradesCollectionView.dequeueReusableCell(withReuseIdentifier: "cellThree", for: indexPath) as? upgradesCollectionViewCell

            cell?.buyBtn.layer.cornerRadius = 16
            cell?.layer.cornerRadius = 10
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.borderWidth = 1
//
            return cell ?? UICollectionViewCell()
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == upgradesCollectionView {
            return CGSize(width: 354, height: 371)
        } else {
            return CGSize(width: 255, height: 328)
            
        }
        
    }

}
