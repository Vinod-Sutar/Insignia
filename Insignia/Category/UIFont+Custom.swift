//
//  UIFont+Custom.swift
//  Insignia
//
//  Created by BBI-M USER1033 on 27/09/17.
//  Copyright © 2017 BBI-M USER1033. All rights reserved.
//

import UIKit

extension UIFont {
    
    convenience init?(fontName: String, withSize size: CGFloat) {
        
        /*
        let fontPath =
        
        guard
            let fontPath = "Path to some font file" ,
            let fontFile = NSData(contentsOfFile: <#T##String#>)
            else {
                //print "Font file not found?"
        }
        
        guard let provider = CGDataProvider(data: fontFile)
            else {
                //print "Failed to create DataProvider"
        }
        
        let font = CGFont(provider)
        let error: UnsafeMutablePointer<Unmanaged<CFError>?>? = nil
        
        guard CTFontManagerRegisterGraphicsFont(font, error) else {
            guard
                let unError = error?.pointee?.takeUnretainedValue(),
                let description = CFErrorCopyDescription(unError)
                else {
                    //print "Unknown error"
            }
            print description
        }
        */
        
        self.init(name: fontName, size: size)
    }
}
