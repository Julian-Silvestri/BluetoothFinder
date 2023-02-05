//
//  CustomLoader.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-04.
//

import Foundation
import UIKit

class CustomLoader: UIView {
    
    static let instance = CustomLoader()
    
    var viewColor: UIColor = .black
    var setAlpha: CGFloat = 0.7
    var gifName: String = "output-onlinegiftools"
    var width: Int = 300
    var height: Int = 300
    
    let keyWindow = UIApplication.shared.connectedScenes
    .filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene})
    .compactMap({$0})
    .first?.windows
    .filter({$0.isKeyWindow}).first
    
    lazy var transparentView: UIView = {
        let transparentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        transparentView.backgroundColor = viewColor.withAlphaComponent(setAlpha)
        transparentView.isUserInteractionEnabled = false
        return transparentView
    }()
    
    lazy var gifImage: UIImageView = {
        var gifImage = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        gifImage.contentMode = .scaleAspectFit
        gifImage.center = transparentView.center
        gifImage.isUserInteractionEnabled = false
        gifImage.loadGif(asset: gifName)
        return gifImage
    }()
    
    lazy var gifText: UILabel = {
        var frame = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/4, y: 135, width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2))
        frame.text = "Searching..."
        frame.textColor = .white
        frame.textAlignment = .center
        frame.font = .systemFont(ofSize: 22.0, weight: .bold)
        return frame
    }()
    
    func showLoaderView() {
        self.addSubview(self.transparentView)
        
        self.transparentView.addSubview(self.gifImage)
        self.transparentView.addSubview(self.gifText)
        self.transparentView.bringSubviewToFront(self.gifImage)
        keyWindow?.addSubview(transparentView)
    }
    
    func hideLoaderView() {
        self.transparentView.removeFromSuperview()
    }
    
}
