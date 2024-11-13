//
//  UIApplication+.swift
//  Vollmed
//
//  Created by Ândriu F Coelho on 01/10/23.
//

import Foundation
import UIKit

extension UIApplication {
    
    var getKeyWindow: UIWindow? {
        return self.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
