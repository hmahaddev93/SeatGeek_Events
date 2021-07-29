//
//  
//
//  Created by Khatib H. on 5/7/21.
//

import Foundation
extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
