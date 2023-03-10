//
//  StartScanButton.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-03.
//

import UIKit

class StartScanButton: UIButton {

    var cornerRadius = 10.0
    var backgroundCustomColor = #colorLiteral(red: 0.1803921569, green: 0.6078431373, blue: 0.8470588235, alpha: 1)
    var textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var fontSize = 18
    var titleText = "Start Scan"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    func setStyle(){
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundCustomColor
        self.titleLabel?.text = titleText
        self.titleLabel?.font = .systemFont(ofSize: 22.0, weight: .bold)
        self.titleLabel?.textColor = textColor
    }
}
