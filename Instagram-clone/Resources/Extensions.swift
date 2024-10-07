//
//  Extensions.swift
//  Instagram-clone
//
//  Created by Santiago Varela on 30/09/24.
//

import UIKit

public extension UIView {
    var width: CGFloat {
        frame.size.width
    }

    var height: CGFloat {
        frame.size.height
    }

    var top: CGFloat {
        frame.origin.y
    }

    var bottom: CGFloat {
        frame.origin.y + height
    }

    var left: CGFloat {
        frame.origin.x
    }

    var right: CGFloat {
        frame.origin.x + width
    }
}

extension String {
    func safeDatabaseKey() -> String {
        return replacingOccurrences(of: "@", with: "-").replacingOccurrences(of: ".", with: "-")
    }
}
