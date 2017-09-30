//
//  AppListViewController.swift
//  Insignia
//
//  Created by BBI-M USER1033 on 26/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import UIKit

class AppListViewController: UIViewController {

    var appList:[App] = []
    
    let mpcManager = MPCManager()
    
    
    @IBOutlet weak var appCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AppListManager.shared.delegate = self
        
        reloadAppCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func reloadAppCollectionView() {
        
        appList = AppListManager.shared.getApps()
        appCollectionView.reloadData()
    }
}

extension AppListViewController : UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return appList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppCollectionViewCell", for: indexPath) as! AppCollectionViewCell
        
        cell.appImageView.image = appList[indexPath.row].getAppIcon()
        
        return cell
    }
}

extension AppListViewController : UICollectionViewDelegate {
    
}

extension AppListViewController : AppListManagerDelegate {
    
    func reloadAppsList() {
        
        self.performSelector(onMainThread: #selector(reloadAppCollectionView), with: nil, waitUntilDone: false)
    }
}

