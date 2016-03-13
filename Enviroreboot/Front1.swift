//
//  Front1.swift
//  Enviroreboot
//
//  Created by Max Wray on 3/12/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//

import Foundation
import RealmSwift
class Front1: Object  {
    // saves components of first page
    dynamic var location = "" // string
    dynamic var weather = ""
    dynamic var initial = ""
    dynamic var start = NSDate() // returns current date and time
    dynamic var wtemp: Float = 0.0 // float
    dynamic var atemp: Float = 0.0
    
}
