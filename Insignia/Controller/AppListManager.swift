//
//  AppListManager.swift
//  Insignia
//
//  Created by BBI-M USER1033 on 27/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import UIKit

protocol AppListManagerDelegate {
    
    func reloadAppsList()
}

class AppListManager: NSObject {

    static let shared = AppListManager()
    
    var delegate:AppListManagerDelegate?
    
    
    
    func saveAppsJson(url: URL) {
        
        do {
            
            let atPath = URL(fileURLWithPath: appsJsonFilePath())
            
            if FileManager.default.fileExists(atPath: appsJsonFilePath()) {
                
                try FileManager.default.removeItem(at: atPath)
            }
            
            try FileManager.default.moveItem(at: url, to: atPath)
        }
        catch {
            
        }
        
        reloadAppsList()
    }
    
    func getApps() -> [App] {
        
        var apps: [App] = []
        
        if FileManager.default.fileExists(atPath: appsJsonFilePath()) {
            
            do {
                
                let appsListData = try Data(contentsOf: URL(fileURLWithPath: appsJsonFilePath()))
                
                let appsListArray = try JSONSerialization.jsonObject(with: appsListData, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                if let appsListArray = appsListArray as? NSArray {
                    
                    for appDictionary in appsListArray {
                        
                        if appDictionary is NSDictionary  {
                            
                            let appItem = appDictionary as! NSDictionary
                            
                            let projectId = appItem["proj_id"] as! String
                            let uniqueId = appItem["unique_id"] as! String
                            let projectName = appItem["proj_name"] as! String
                            
                            apps.append(App(projectId, uniqueId: uniqueId, name: projectName))
                        }
                    }
                    
                }
            }
            catch {
                
                print("Error: \(error.localizedDescription)")
            }
            
        }
        
        return apps.sorted(by: {$0.name < $1.name})
    }
    
    func appsJsonFilePath() -> String {
        
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        return "\(documentDirectory)/apps.json"
    }
    
    func reloadAppsList() {
        
        delegate?.reloadAppsList()
    }
}
