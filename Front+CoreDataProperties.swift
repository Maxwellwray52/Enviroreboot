//
//  Front+CoreDataProperties.swift
//  Enviroreboot
//
//  Created by Max Wray on 2/5/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Front {

    @NSManaged var additional: String?
    @NSManaged var air: NSNumber?
    @NSManaged var location: String?
    @NSManaged var stamp: NSDate?
    @NSManaged var temperature: NSNumber?
    @NSManaged var water: NSNumber?
    @NSManaged var weather: String?

}
