//
//  VSMasterNavigationController.swift
//  Insignia
//
//  Created by BBI-M USER1033 on 26/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import UIKit

class VSMasterNavigationController: UINavigationController {

    @IBOutlet weak var masterNavigationBar: VSNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        masterNavigationBar.setNavigation(viewController: topViewController!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
