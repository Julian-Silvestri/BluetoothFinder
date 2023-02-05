//
//  CustomButtons.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-05.
//

import UIKit

class CustomButtons: UIButton {
    
    var bgColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    var cornerRadius = 10
    var textSize = 20.0
    var textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    func setStyle(){
        self.backgroundColor = bgColor
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .systemFont(ofSize: textSize)
        self.titleLabel?.textColor = textColor
    }

}
