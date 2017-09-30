//
//  VSSplitViewController.swift
//  Insignia
//
//  Created by BBI-M USER1033 on 26/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import UIKit

class VSSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.preferredDisplayMode = .allVisible
        self.maximumPrimaryColumnWidth = 320
        self.minimumPrimaryColumnWidth = 320
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
