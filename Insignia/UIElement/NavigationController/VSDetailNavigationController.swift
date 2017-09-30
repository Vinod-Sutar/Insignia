//
//  VSDetailNavigationController.swift
//  Insignia
//
//  Created by BBI-M USER1033 on 26/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import UIKit

class VSDetailNavigationController: UINavigationController {

    @IBOutlet weak var detailNavigationBar: VSNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailNavigationBar.setNavigation(viewController: topViewController!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
