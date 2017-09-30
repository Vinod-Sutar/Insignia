//
//  App.swift
//  Insignia
//
//  Created by BBI-M USER1033 on 27/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import UIKit

class App: NSObject {
    
    let projectId: String!
    let uniqueId: String!
    let name: String!
    
    override init() {
        
        self.projectId = ""
        self.uniqueId = ""
        self.name = ""
    }
    
    init(_ projectId: String, uniqueId: String, name: String) {
        
        self.projectId = projectId
        self.uniqueId = uniqueId
        self.name = name
    }
    
    func getAppIcon() -> UIImage! {
        
        
        if FileManager.default.fileExists(atPath: getAppIconPath()) {
        
            return UIImage(contentsOfFile: getAppIconPath())
        }
        
        return nil
    }
    
    
    func setAppIcon(_ atPath: URL) {
        
        do {
            
            let toPath = URL(fileURLWithPath: getAppIconPath())
            
            if FileManager.default.fileExists(atPath: getAppIconPath()) {
                
                try FileManager.default.removeItem(at: toPath)
            }
            
            try FileManager.default.moveItem(at: atPath, to: toPath)
        }
        catch {
            
            print(error)
        }
    }
    
    func getAppIconPath() -> String! {
        
        var filePath: String! = nil
        
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let folderPath = documentDirectory + "/AppIcons/"
        
        filePath = folderPath + "appIcon_" + projectId + ".png"
        
        if FileManager.default.fileExists(atPath: folderPath) == false {
            
            do {
                
                try FileManager.default.createDirectory(at: URL(fileURLWithPath: folderPath), withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                
                Swift.print("Error: \(error.localizedDescription)")
            }
        }
        
        return filePath
    }
}
