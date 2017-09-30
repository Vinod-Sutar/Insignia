//
//  AppCollectionViewCell.swift
//  Insignia
//
//  Created by BBI-M USER1033 on 27/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import UIKit

class AppCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var appImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        self.contentView.layer.cornerRadius = 13;
        self.contentView.layer.borderColor = UIColor.init(white: 0.8, alpha: 1.0).cgColor
        self.contentView.layer.borderWidth = 0.5;
        self.contentView.layer.shadowColor = UIColor.gray.cgColor
        self.contentView.layer.shadowRadius = 12
        self.contentView.layer.shadowOffset = CGSize(width: 12, height: 12)
    }
}
