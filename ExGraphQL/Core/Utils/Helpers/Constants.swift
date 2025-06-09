//
//  Constants.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 03/06/25.
//

import Foundation
import UIKit

struct Constants {
    struct Network{
        static let ACCESS_TOKEN_KEY: String = "ACCESS_TOKEN_KEY"
        static let REFRESH_TOKEN_KEY: String = "REFRESH_TOKEN_KEY"
        static let AUTHORIZATION: String = "Authorization"
    }
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    static func screenDynamicHeight(percent: Double) -> CGFloat {
        return screenHeight * (percent/100)
    }
}
