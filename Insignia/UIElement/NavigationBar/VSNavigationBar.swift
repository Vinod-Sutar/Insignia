//
//  VSNavigationBar.swift
//  Insignia
//
//  Created by BBI-M USER1033 on 26/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import UIKit

class VSNavigationBar: UINavigationBar {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        
        self.barTintColor = UIColor(hexString: "#FF0000")
        self.topItem?.title = ""
        self.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hexString: "#FFFFFF")]
    }
    
    func setNavigation(viewController: UIViewController) {
        
        self.barTintColor = UIColor(hexString: "#53697F")
        self.topItem?.title = String(describing: type(of:viewController)).components(separatedBy: ".").first
        
        let titleFont = UIFont (fontName: "Helvetica", withSize: 16)!
        
        self.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(hexString: "#FFFFFF"), NSFontAttributeName:titleFont]
    }
}
