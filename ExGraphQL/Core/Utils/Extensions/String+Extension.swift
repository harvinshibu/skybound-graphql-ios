//
//  String+Extension.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 04/06/25.
//

import Foundation

extension String{
    func validateEmail() -> Bool {
        var returnValue = true
        let emailRegEx = #"^\S+@\S+\.\S+$"#
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
}
