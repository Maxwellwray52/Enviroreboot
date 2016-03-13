//
//  displayrecordsTableViewCell.swift
//  Enviroreboot
//
//  Created by Max Wray on 3/3/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
class displayrecordsTableViewCell: UITableViewCell {

    @IBOutlet weak var displayentries: UILabel!
    // temporary variables to store retrieved values
    var place : String = ""
    var weather: String = ""
    var initial: String = ""
    var start: NSDate
    var airtemp: Float = 0.0
    var watertemp: Float = 0.0
    var tolfunction: Double = 0.0
    var healthfunction: Double = 0.0
    // arrays
    //stores retrieved front variables
    var frontretrieved : [String] = [String]()
    // managed object context
    let managedObjectContext = (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    // entity description
    let frontentityDescription = NSEntityDescription.entityForName("Front", inManagedObjectContext: managedObjectContext)
    
    // retrieves front data
    let frontrequest = NSFetchRequest()
    frontrequest.entity = frontentitydescription
    let frontpred = NSPredicate(format: "(location = %@)", Front.location)
    frontrequest.predicate = frontpred
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
