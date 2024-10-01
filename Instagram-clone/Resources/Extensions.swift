//
//  Extensions.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 30/09/24.
//

import UIKit

extension UIView {
    
    public var width: CGFloat {
        frame.size.width
    }
    
    public var height: CGFloat {
        frame.size.height
    }
    
    public var top: CGFloat {
        frame.origin.y
    }
    
    public var bottom: CGFloat {
        frame.origin.y + height
    }
    
    public var left: CGFloat {
        frame.origin.x
    }
    
    public var right: CGFloat {
        frame.origin.x + width
    }
    
}

extension String {
    func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: "@", with: "-").replacingOccurrences(of: ".", with: "-")
    }
}
